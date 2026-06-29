# Feature skill — extra detail

Plain-language [README](../README.md) covers install and update. **Update** is the same operation as install: it overwrites `${CLAUDE_PLUGIN_ROOT}/skills/feature`. Use the README one-liner, or [`update.sh`](../update.sh) / [`update.ps1`](../update.ps1) (`--local` / `-Local` after `git pull` in your clone).

---

## Windows install (one paste)

In **PowerShell** (Terminal → select PowerShell if needed):

```powershell
git clone --depth 1 https://github.com/hferello/ai.git $env:TEMP\cursor-feature-skill; & "$env:TEMP\cursor-feature-skill\feature\install.ps1"; Remove-Item -Recurse -Force $env:TEMP\cursor-feature-skill
```

Then restart Cursor.

---

## Hooks

If `~/.cursor/hooks.json` already exists, `install.sh` / `install.ps1` can merge in planning hooks (without removing yours). If that file does not exist, nothing is created.

| Hook                                          | Purpose                                                                                                                                 |
| --------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `beforeShellExecution` / `beforeMCPExecution` | If planning is active, injects a short reminder: _"Planning active: update progress.md and task_plan.md when you finish a phase."_       |
| `stop`                                        | Runs `check-complete` for each active task; output appears in the Hooks panel                                                         |

Hooks only run when `features/<task>/task_plan.md` exists. On Windows, hooks expect a Unix-like shell (Git Bash or WSL) unless your setup says otherwise.

---

## Initialize planning files (optional script)

From your **project root**, with an optional **task name**:

```bash
${CLAUDE_PLUGIN_ROOT}/skills/feature/scripts/init-session.sh audit-logging
```

Without a name, the folder name is auto-generated for that day.

**Windows (PowerShell):**

```powershell
& "$env:USERPROFILE\.cursor\skills\feature\scripts\init-session.ps1" "audit-logging"
```

Creates `features/<task>/` with `task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and `prd.md`.

---

## Phase 0: discovery

For a **new** task, the AI asks clarifying questions first (you can skip any). After that it can create or fill the task folder. See also [WORKFLOW.md](WORKFLOW.md).

---

## Quick reference

| When                            | Do this                                                                                                        |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Starting a complex task         | `/feature` → answer questions (or skip) → AI creates files; or run `init-session.sh` yourself               |
| After 2 view/browser/search ops | Update `findings.md`                                                                                          |
| Before a major decision         | Re-read `task_plan.md`                                                                                         |
| After an error                  | Log in `task_plan.md` + change approach                                                                        |
| After completing a phase        | Update `task_plan.md` and `progress.md`                                                                        |
| Resuming after `/clear`         | Ask the AI to read all five files in the task folder first                                                     |

---

## Files in each task folder

| File                | Purpose                                      |
| ------------------- | -------------------------------------------- |
| `task_plan.md`      | Goal, phases, decisions, errors              |
| `findings.md`       | Research, discoveries, technical choices     |
| `progress.md`       | Session log, actions, test results           |
| `documentation.md`  | What was built, how it works                 |
| `prd.md`            | Product requirements                         |

---

## Uninstall

```bash
rm -rf ${CLAUDE_PLUGIN_ROOT}/skills/feature
```

**Windows (PowerShell):** `Remove-Item -Recurse -Force "$env:USERPROFILE\.cursor\skills\feature"`

---

## Requirements

- **Cursor** (with Agent)
- **Python 3** (optional, for `session-catchup.py` when resuming after `/clear`)

---

## For maintainers

**Zip for sharing:**

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
