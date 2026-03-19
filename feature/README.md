# Feature — Cursor Skill

Feature design workflow. Asks clarifying questions first, then creates `task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and `prd.md` in a `features/<task>/` folder. Trigger with `/feature`.

**Use for:** Designing features, multi-step tasks, research, building projects, anything spanning many tool calls.

---

## Installation

### Option 1: One-command install (from this repo)

If you have this skill in a project or cloned the repo:

```bash
# From the skill directory
./install.sh

# Or from project root (if skill is in .cursor/skills/)
./.cursor/skills/feature/install.sh
```

**Windows (PowerShell):**
```powershell
.\.cursor\skills\feature\install.ps1
```

### Option 2: Install from GitHub

```bash
# Clone and install
git clone https://github.com/hferello/ai.git
cd ai/feature
./install.sh
```

### Option 2b: Install from zip

If you received `feature-cursor-skill.zip`:

```bash
unzip feature-cursor-skill.zip
cd feature
./install.sh
```

### Option 3: Project-only (no install)

Keep the skill in your project's `.cursor/skills/feature/`. It will be available when working in that project. No install script needed.

---

## Hooks

If `~/.cursor/hooks.json` already exists, install adds planning hooks to it (without overwriting existing hooks). If it doesn't exist, nothing is created.

| Hook | Purpose |
|------|---------|
| `beforeShellExecution` / `beforeMCPExecution` | If planning is active, injects a short reminder: *"Planning active: update progress.md and task_plan.md when you finish a phase."* |
| `stop` | Runs `check-complete` for each active task; output appears in the Hooks panel |

Messages are kept short to avoid token bloat. Hooks only run when `features/<task>/task_plan.md` exists. On Windows, hooks require a Unix-like shell (Git Bash or WSL).

---

## After Installation

1. **Restart Cursor** (or reload window: Cmd+Shift+P → "Developer: Reload Window")
2. The skill is now available globally (if you used Option 1 or 2) or in the project (Option 3)

---

## Usage

### 1. Invoke the skill

In Cursor Agent chat, type:
- `/feature` — or —
- `@feature`

### 2. Initialize planning files (for a new complex task)

From your **project root**, run with an optional **task name**:

```bash
# With a name (if installed globally)
~/.cursor/skills/feature/scripts/init-session.sh audit-logging

# If in project .cursor/skills/
./.cursor/skills/feature/scripts/init-session.sh "dark mode toggle"

# Without a name: uses {yyyy}-{mm}-{dd}-task-{N} (auto-increments per day)
~/.cursor/skills/feature/scripts/init-session.sh
# → features/2025-03-19-task-1/, 2025-03-19-task-2/, etc.
```

Creates `features/` if missing, then `features/<task>/`. Names are sanitized: `"dark mode toggle"` → `dark-mode-toggle/`

**Windows:**
```powershell
& "$env:USERPROFILE\.cursor\skills\feature\scripts\init-session.ps1" "audit-logging"
# Or without a name for auto-generated folder:
& "$env:USERPROFILE\.cursor\skills\feature\scripts\init-session.ps1"
```

### 3. Tell the AI

> I'm starting a complex task. I've created `features/audit-logging/task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and `prd.md`. Read them first, then we'll work through the phases. Here's what I need: [your task]

---

## Phase 0: Discovery Questions (Recommended)

When you invoke the skill for a **new** task, the AI will ask clarifying questions first (problem/goal, target user, user stories, acceptance criteria, non-goals, etc.). You may skip any question. Only after you answer (or skip) will the AI create the task folder and files, populated with your answers. The PRD (`prd.md`) lives inside the task folder.

---

## Quick Reference

| When | Do This |
|------|---------|
| Starting a complex task | Invoke skill → Answer Phase 0 questions (or skip) → AI creates files; or run `init-session.sh <name>` to skip |
| After 2 view/browser/search ops | Update `findings.md` |
| Before a major decision | Re-read `task_plan.md` |
| After an error | Log in `task_plan.md` + change approach |
| After completing a phase | Update status in `task_plan.md` and `progress.md` |
| Resuming after `/clear` | Tell AI to read all five files in the task folder first |

---

## Files Created

| File | Purpose |
|------|---------|
| `features/<task>/task_plan.md` | Goal, phases, decisions, errors |
| `features/<task>/findings.md` | Research, discoveries, technical choices |
| `features/<task>/progress.md` | Session log, actions, test results |
| `features/<task>/documentation.md` | What was built, how it works |
| `features/<task>/prd.md` | Product requirements (goals, user stories, acceptance criteria) |

A root folder `features/` is created if missing. Each task gets its own subfolder (e.g. `features/audit-logging/`).

---

## Uninstall

Remove the skill from Cursor:

```bash
rm -rf ~/.cursor/skills/feature
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
