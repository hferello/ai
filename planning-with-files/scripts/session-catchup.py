#!/usr/bin/env python3
"""
Session Catchup Script for planning-with-files (Cursor-compatible)

Analyzes the previous session to find unsynced context after the last
planning file update. Supports both Cursor and Claude storage formats.

Usage: python3 session-catchup.py [project-path]
"""

import json
import sys
import os
from pathlib import Path
from typing import List, Dict, Optional, Tuple

PLANNING_FILES = ['task_plan.md', 'progress.md', 'findings.md']


def get_cursor_project_dir(project_path: str) -> Path:
    """Get Cursor's project storage path from project path."""
    # Cursor uses ~/.cursor/projects/ with path-like folder names
    # e.g. /Users/hal558/Sites/dublcheck -> Users-hal558-Sites-dublcheck
    resolved = Path(project_path).resolve()
    parts = resolved.parts
    # Build format: first part (e.g. Users) + rest joined by -
    if len(parts) >= 2:
        folder_name = '-'.join(parts[1:])  # Skip root /
    else:
        folder_name = resolved.name or 'project'
    return Path.home() / '.cursor' / 'projects' / folder_name


def get_claude_project_dir(project_path: str) -> Path:
    """Get Claude's project storage path (legacy compatibility)."""
    sanitized = project_path.replace('/', '-')
    if not sanitized.startswith('-'):
        sanitized = '-' + sanitized
    sanitized = sanitized.replace('_', '-')
    return Path.home() / '.claude' / 'projects' / sanitized


def get_session_files(project_dir: Path, use_cursor: bool) -> List[Path]:
    """Get session files sorted by modification time (newest first)."""
    if use_cursor:
        # Cursor: agent-transcripts/<uuid>/<uuid>.jsonl
        transcripts_dir = project_dir / 'agent-transcripts'
        if not transcripts_dir.exists():
            return []
        session_files = []
        for uuid_dir in transcripts_dir.iterdir():
            if uuid_dir.is_dir():
                jsonl_file = uuid_dir / f'{uuid_dir.name}.jsonl'
                if jsonl_file.exists():
                    session_files.append(jsonl_file)
        return sorted(session_files, key=lambda p: p.stat().st_mtime, reverse=True)
    else:
        # Claude: flat *.jsonl files
        sessions = list(project_dir.glob('*.jsonl'))
        main_sessions = [s for s in sessions if not s.name.startswith('agent-')]
        return sorted(main_sessions, key=lambda p: p.stat().st_mtime, reverse=True)


def parse_session_messages(session_file: Path) -> List[Dict]:
    """Parse all messages from a session file, preserving order."""
    messages = []
    with open(session_file, 'r') as f:
        for line_num, line in enumerate(f):
            try:
                data = json.loads(line)
                data['_line_num'] = line_num
                messages.append(data)
            except json.JSONDecodeError:
                pass
    return messages


def find_last_planning_update(messages: List[Dict]) -> Tuple[int, Optional[str]]:
    """Find the last time a planning file was written/edited."""
    last_update_line = -1
    last_update_file = None

    for msg in messages:
        # Support both Cursor (role) and Claude (type) formats
        msg_type = msg.get('type') or msg.get('role')

        if msg_type == 'assistant':
            content = msg.get('message', {}).get('content', [])
            if isinstance(content, list):
                for item in content:
                    if item.get('type') == 'tool_use':
                        tool_name = item.get('name', '')
                        tool_input = item.get('input', {})

                        if tool_name in ('Write', 'Edit'):
                            file_path = tool_input.get('file_path', '')
                            for pf in PLANNING_FILES:
                                if file_path.endswith(pf):
                                    last_update_line = msg['_line_num']
                                    last_update_file = pf

    return last_update_line, last_update_file


def extract_messages_after(messages: List[Dict], after_line: int) -> List[Dict]:
    """Extract conversation messages after a certain line number."""
    result = []
    for msg in messages:
        if msg['_line_num'] <= after_line:
            continue

        # Support both Cursor (role) and Claude (type) formats
        msg_type = msg.get('type') or msg.get('role')
        is_meta = msg.get('isMeta', False)

        if msg_type == 'user' and not is_meta:
            content = msg.get('message', {}).get('content', '')
            if isinstance(content, list):
                for item in content:
                    if isinstance(item, dict) and item.get('type') == 'text':
                        content = item.get('text', '')
                        break
                else:
                    content = ''

            if content and isinstance(content, str):
                if content.startswith(('<local-command', '<command-', '<task-notification')):
                    continue
                if len(content) > 20:
                    result.append({'role': 'user', 'content': content, 'line': msg['_line_num']})

        elif msg_type == 'assistant':
            msg_content = msg.get('message', {}).get('content', '')
            text_content = ''
            tool_uses = []

            if isinstance(msg_content, str):
                text_content = msg_content
            elif isinstance(msg_content, list):
                for item in msg_content:
                    if item.get('type') == 'text':
                        text_content = item.get('text', '')
                    elif item.get('type') == 'tool_use':
                        tool_name = item.get('name', '')
                        tool_input = item.get('input', {})
                        if tool_name == 'Edit':
                            tool_uses.append(f"Edit: {tool_input.get('file_path', 'unknown')}")
                        elif tool_name == 'Write':
                            tool_uses.append(f"Write: {tool_input.get('file_path', 'unknown')}")
                        elif tool_name == 'Bash':
                            cmd = tool_input.get('command', '')[:80]
                            tool_uses.append(f"Bash: {cmd}")
                        else:
                            tool_uses.append(f"{tool_name}")

            if text_content or tool_uses:
                result.append({
                    'role': 'assistant',
                    'content': text_content[:600] if text_content else '',
                    'tools': tool_uses,
                    'line': msg['_line_num']
                })

    return result


def main():
    project_path = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
    project_path = str(Path(project_path).resolve())

    # Check if planning files exist (root, named folders, or planning-with-files/<task>/)
    project = Path(project_path)
    has_root = any((project / f).exists() for f in PLANNING_FILES)
    has_folders = any(
        (d / 'task_plan.md').exists()
        for d in project.iterdir()
        if d.is_dir() and not d.name.startswith('.')
    )
    # Also check planning-with-files/<task>/ structure
    pwf = project / 'planning-with-files'
    has_pwf = (
        pwf.is_dir() and
        any((d / 'task_plan.md').exists() for d in pwf.iterdir() if d.is_dir())
    )
    if not has_root and not has_folders and not has_pwf:
        return

    # Try Cursor first, then Claude
    cursor_dir = get_cursor_project_dir(project_path)
    claude_dir = get_claude_project_dir(project_path)

    session_files = []
    use_cursor = False

    if cursor_dir.exists():
        session_files = get_session_files(cursor_dir, use_cursor=True)
        use_cursor = True
    elif claude_dir.exists():
        session_files = get_session_files(claude_dir, use_cursor=False)

    if len(session_files) < 1:
        return

    # Find a substantial previous session
    target_session = None
    for session in session_files:
        if session.stat().st_size > 5000:
            target_session = session
            break

    if not target_session:
        return

    messages = parse_session_messages(target_session)
    last_update_line, last_update_file = find_last_planning_update(messages)

    if last_update_line < 0:
        return

    messages_after = extract_messages_after(messages, last_update_line)

    if not messages_after:
        return

    # Output catchup report
    agent_name = "Agent" if use_cursor else "Claude"
    print("\n[planning-with-files] SESSION CATCHUP DETECTED")
    print(f"Previous session: {target_session.stem}")

    print(f"Last planning update: {last_update_file} at message #{last_update_line}")
    print(f"Unsynced messages: {len(messages_after)}")

    print("\n--- UNSYNCED CONTEXT ---")
    for msg in messages_after[-15:]:
        if msg['role'] == 'user':
            print(f"USER: {msg['content'][:300]}")
        else:
            if msg.get('content'):
                print(f"{agent_name}: {msg['content'][:300]}")
            if msg.get('tools'):
                print(f"  Tools: {', '.join(msg['tools'][:4])}")

    print("\n--- RECOMMENDED ---")
    print("1. Run: git diff --stat")
    print("2. Read planning files (e.g. <folder>/task_plan.md, progress.md, findings.md)")
    print("3. Update planning files based on above context")
    print("4. Continue with task")


if __name__ == '__main__':
    main()
