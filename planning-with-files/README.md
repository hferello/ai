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

From your **project root**:

```bash
# If installed globally
~/.cursor/skills/planning-with-files/scripts/init-session.sh

# If in project .cursor/skills/
./.cursor/skills/planning-with-files/scripts/init-session.sh
```

**Windows:**
```powershell
& "$env:USERPROFILE\.cursor\skills\planning-with-files\scripts\init-session.ps1"
```

### 3. Tell the AI

> I'm starting a complex task. I've created `task_plan.md`, `findings.md`, and `progress.md` in the project root. Read them first, then we'll work through the phases. Here's what I need: [your task]

---

## Quick Reference

| When | Do This |
|------|---------|
| Starting a complex task | Init files → Fill `task_plan.md` → Tell AI to read them |
| After 2 view/browser/search ops | Update `findings.md` |
| Before a major decision | Re-read `task_plan.md` |
| After an error | Log in `task_plan.md` + change approach |
| After completing a phase | Update status in `task_plan.md` and `progress.md` |
| Resuming after `/clear` | Tell AI to read all three files first |

---

## Files Created

| File | Purpose |
|------|---------|
| `task_plan.md` | Goal, phases, decisions, errors |
| `findings.md` | Research, discoveries, technical choices |
| `progress.md` | Session log, actions, test results |

All three go in your **project root**, not the skill folder.

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

## For maintainers: creating a distributable package

To create a zip for sharing:

```bash
./scripts/package.sh
```

Output: `planning-with-files-cursor-skill.zip` in the parent directory. Share this file or publish the folder to GitHub.

---

## License

Same as the parent project.
