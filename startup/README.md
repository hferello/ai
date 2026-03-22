# /startup

A Cursor skill for **early-stage founders and teams**. It walks you through problem validation, market research, surveys (when appropriate), customer interviews, insights, opportunity framing, monetisation, legal risk flags, and a bridge to `/feature` — one phase at a time. **All outputs go in a flat `startup/` folder at the project root** (numbered files, plus `progress.md` and `findings.md`). No subfolders.

**Trigger:** `/startup "your-idea-slug"` with a short description of the problem or idea.

**Install:** Open a terminal in Cursor, paste this, hit Enter, then fully quit and reopen Cursor.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-startup-skill && bash /tmp/cursor-startup-skill/startup/install.sh && rm -rf /tmp/cursor-startup-skill
```

Or from a local clone, from the `startup/` folder:

```bash
bash install.sh
```

---

## What you get (all under `startup/`)

| File | What it is |
|------|------------|
| `startup/progress.md` | Phase tracker + discovery answers |
| `startup/findings.md` | Running index of what the agent learned |
| `startup/01-` … `09-` | One markdown file per phase (problem → feature plans) |

See `SKILL.md` for the full workflow, methods, and rules.
