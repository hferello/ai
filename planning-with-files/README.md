# Planning with Files — Cursor Skill

Manus-style file-based planning for complex AI agent tasks. Creates `task_plan.md`, `findings.md`, and `progress.md` to keep goals in focus across long sessions.

**Use for:** Multi-step tasks, research, building projects, anything spanning many tool calls.

---

## Installation

### Option 1: One-command install (from this repo)

If you have this skill in a project or cloned the repo:

```bash
# From the skill directory
./install.sh

# Or from project root (if skill is in .cursor/skills/)
./.cursor/skills/planning-with-files/install.sh
```

**Windows (PowerShell):**
```powershell
.\.cursor\skills\planning-with-files\install.ps1
```

### Option 2: Install from GitHub

```bash
# Clone and install
git clone https://github.com/hferello/ai.git
cd ai/planning-with-files
./install.sh
```

### Option 2b: Install from zip

If you received `planning-with-files-cursor-skill.zip`:

```bash
unzip planning-with-files-cursor-skill.zip
cd planning-with-files
./install.sh
```

### Option 3: Project-only (no install)

Keep the skill in your project's `.cursor/skills/planning-with-files/`. It will be available when working in that project. No install script needed.

---

## Hooks

If `~/.cursor/hooks.json` already exists, install adds planning hooks to it (without overwriting existing hooks). If it doesn't exist, nothing is created.

| Hook | Purpose |
|------|---------|
| `beforeShellExecution` / `beforeMCPExecution` | If planning is active, injects a short reminder: *"Planning active: update progress.md and task_plan.md when you finish a phase."* |
| `stop` | Runs `check-complete` for each active task; output appears in the Hooks panel |

Messages are kept short to avoid token bloat. Hooks only run when `planning-with-files/<task>/task_plan.md` exists. On Windows, hooks require a Unix-like shell (Git Bash or WSL).

---

## After Installation

1. **Restart Cursor** (or reload window: Cmd+Shift+P → "Developer: Reload Window")
2. The skill is now available globally (if you used Option 1 or 2) or in the project (Option 3)

---

## Usage

### 1. Invoke the skill

In Cursor Agent chat, type:
- `/planning-with-files` — or —
- `@planning-with-files`

### 2. Initialize planning files (for a new complex task)

From your **project root**, run with a **task name**:

```bash
# If installed globally (replace "audit-logging" with your task name)
~/.cursor/skills/planning-with-files/scripts/init-session.sh audit-logging

# If in project .cursor/skills/
./.cursor/skills/planning-with-files/scripts/init-session.sh "dark mode toggle"
```

Creates `planning-with-files/` if missing, then `planning-with-files/<task>/`. Names are sanitized: `"dark mode toggle"` → `dark-mode-toggle/`

**Windows:**
```powershell
& "$env:USERPROFILE\.cursor\skills\planning-with-files\scripts\init-session.ps1" "audit-logging"
```

### 3. Tell the AI

> I'm starting a complex task. I've created `planning-with-files/audit-logging/task_plan.md`, `findings.md`, and `progress.md`. Read them first, then we'll work through the phases. Here's what I need: [your task]

---

## Quick Reference

| When | Do This |
|------|---------|
| Starting a complex task | `init-session.sh <name>` → Fill `task_plan.md` → Tell AI to read them |
| After 2 view/browser/search ops | Update `findings.md` |
| Before a major decision | Re-read `task_plan.md` |
| After an error | Log in `task_plan.md` + change approach |
| After completing a phase | Update status in `task_plan.md` and `progress.md` |
| Resuming after `/clear` | Tell AI to read all three files in the task folder first |

---

## Files Created

| File | Purpose |
|------|---------|
| `planning-with-files/<task>/task_plan.md` | Goal, phases, decisions, errors |
| `planning-with-files/<task>/findings.md` | Research, discoveries, technical choices |
| `planning-with-files/<task>/progress.md` | Session log, actions, test results |

A root folder `planning-with-files/` is created if missing. Each task gets its own subfolder (e.g. `planning-with-files/audit-logging/`).

---

## Uninstall

Remove the skill from Cursor:

```bash
rm -rf ~/.cursor/skills/planning-with-files
```

---

## Requirements

- **Cursor** (with Agent)
- **Python 3** (optional, for `session-catchup.py` when resuming after `/clear`)

---

---

## For maintainers

**Create a zip for sharing:**
```bash
./scripts/package.sh
```

**Publish updates to GitHub ([hferello/ai](https://github.com/hferello/ai)):**
```bash
./scripts/publish-to-github.sh
# Then: cd /tmp/ai-repo-publish-* && git push origin main
```

---

## License

Same as the parent project.

Original: https://github.com/OthmanAdi/planning-with-files/releases/tag/v2.23.1
