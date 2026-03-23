# /feature

A Cursor skill that helps you **think before you build**. Use it when you’re designing a feature, exploring a problem, or starting something that will take more than a quick edit. It asks a few good questions up front, then keeps everything in simple docs you can come back to: a plan, notes, progress, how it works, and a short Product Requirements Document.

**Demo:**

![/feature demo](../assets/feature-demo.gif)

**Install/Update:** Open a terminal in Cursor, paste this, hit Enter, then fully quit and reopen Cursor.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

---

## Using `/feature`

### 1. Give it a name

Start with `/feature` followed by a short name in quotes. This becomes the label for the work and maps to a folder under `features/`.

```text
/feature "checkout flow"
```

Lowercase, hyphens are fine. The name doesn't need to be perfect — the init script tidies it up.

### 2. Answer a few questions, then go

The agent kicks off with a round of clarifying questions (you can skip this if you already know what you want), then scaffolds `features/<your-task>/` with everything it needs to track the work: `task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and `prd.md`. From there, you iterate.

---

### Dev notes:

- **From a local clone** (after `git pull`): `bash feature/update.sh --local` — installs from your working tree (no second clone).
- **One-liner without saving the repo** (needs `curl`):

```bash
curl -fsSL https://raw.githubusercontent.com/hferello/ai/main/feature/update.sh | bash
```

Override the repo with `FEATURE_SKILL_REPO` if you use a fork.

On Windows: `.\feature\update.ps1` (fetch from GitHub) or `.\feature\update.ps1 -Local` after `git pull`.

---

## Inspiration

The workflow and “plan with living docs” idea for this skill take their cue from [planning-with-files](https://github.com/OthmanAdi/planning-with-files) (Othman Adi), which was used as the starting point for how `/feature` structures task plans, findings, and related files.

---

For the full workflow, hooks, Windows install, or uninstall instructions, see [references/more.md](references/more.md).
