---
name: planning-with-files
description: Manus-style file-based planning for complex tasks. Creates a named folder with task_plan.md, findings.md, progress.md. Use when planning, breaking down, or organizing multi-step projects, research, or work requiring many tool calls. Supports session recovery after /clear.
disable-model-invocation: false
---

# Planning with Files

Work like Manus: Use persistent markdown files as your "working memory on disk."

```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)
→ Anything important gets written to disk.
```

## CRITICAL: Manual Discipline (No Hooks in Cursor)

Cursor does not support automatic hooks. You must **manually** follow these rules:

1. **Before starting:** If a task folder exists (e.g. `planning-with-files/audit-logging/task_plan.md`), read the three files first.
2. **Before major decisions:** Re-read `task_plan.md` to refresh goals in your attention window.
3. **After every 2 view/browser/search operations:** Update `findings.md` immediately (2-Action Rule).
4. **After completing a phase:** Update phase status in `task_plan.md` and log actions in `progress.md`.
5. **After any error:** Log in `task_plan.md` and change your approach—never repeat the same failing action.

## Where Files Go

| Location | What Goes There |
|----------|-----------------|
| Skill directory | Templates, scripts, reference docs |
| **Your project root** | `planning-with-files/` (created if missing) containing task folders (e.g. `audit-logging/`) with `task_plan.md`, `findings.md`, `progress.md` |

## Quick Start

### 1. Initialize (run from project root with a task name)

```bash
# Creates planning-with-files/ if missing, then planning-with-files/<task>/ with the three files
~/.cursor/skills/planning-with-files/scripts/init-session.sh audit-logging

# Names are sanitized: "dark mode toggle" → planning-with-files/dark-mode-toggle/
```

### 2. Fill in task_plan.md (in the task folder)

- **Goal:** One sentence describing the end state
- **Phases:** 3–7 phases (Discovery → Plan → Implement → Test → Deliver)
- **Key questions:** What you need to clarify

### 3. Tell the user

"I've created `planning-with-files/audit-logging/task_plan.md`, `findings.md`, and `progress.md`. Read them first, then we'll work through the phases."

## File Purposes

| File | Purpose | When to Update |
|------|---------|----------------|
| `<folder>/task_plan.md` | Phases, progress, decisions | After each phase |
| `<folder>/findings.md` | Research, discoveries | After ANY discovery |
| `<folder>/progress.md` | Session log, test results | Throughout session |

## Critical Rules

(Unchanged: Create plan first, 2-Action Rule, Read before decide, Update after act, Log errors, Never repeat failures, Continue after completion.)

## Resuming After /clear

1. Read `<folder>/task_plan.md`, `progress.md`, and `findings.md` immediately.
2. Optionally run: `python3 ~/.cursor/skills/planning-with-files/scripts/session-catchup.py "$(pwd)"`
3. If catchup shows unsynced context: run `git diff --stat`, read planning files, update them, then proceed.

## When to Use

**Use for:** Multi-step tasks (3+ steps), research, building projects, tasks spanning many tool calls.

**Skip for:** Simple questions, single-file edits, quick lookups.

## References

- **Workflow:** [references/WORKFLOW.md](references/WORKFLOW.md)
- **Manus principles:** [references/reference.md](references/reference.md)
- **Examples:** [references/examples.md](references/examples.md)
