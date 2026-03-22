# Context

This folder holds a Cursor skill that turns a raw idea into a PRD so agents stay in the **right context**—what to build, what not to build, and where the truth lives: a **single** file, `docs/context.md`. Ask `/spec "project-name"` and it walks you through 9 focused questions — one at a time — to produce that document.

Not sure about an answer? Say "you tell me" and the agent will research it for you.

**Always-on rule:** `cursor-rule.mdc` is the source of truth. Installing with `install.sh` copies it to `~/.cursor/rules/spec.mdc` so agents read `docs/context.md` before non-trivial work in every project. In this repo, `.cursor/rules/spec.mdc` is a symlink to `context/cursor-rule.mdc`.

**Demo:**

![/spec demo](../assets/spec-demo.gif)

**Install:** Open a terminal in Cursor, paste this, hit Enter, then fully quit and reopen Cursor.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-skill && bash /tmp/cursor-skill/context/install.sh && rm -rf /tmp/cursor-skill
```

---

## Using `/spec`

### 1. Give it a name and a seed idea

```text
/spec "expense-tracker" — a simple app for freelancers to snap receipts and track deductions
```

### 2. Answer the questions (or don't)

The agent asks 9 questions, one per turn. You can answer, skip, or say "you tell me" to let the agent research it. After each answer `docs/context.md` is updated on disk — nothing is lost if the session breaks.

### 3. Resume if interrupted

If a session dies mid-flow, just run `/spec` again. The agent reads `docs/context.md`, finds the last filled section, and picks up from there.

### 4. Review

After the last question, the agent reads back the full document and asks for final edits. There is only **one** context file per repo: `docs/context.md`.

## Example shape

Finished examples live in `references/` to show what tight content looks like — one consumer app, one developer tool. On disk they still map to the same `docs/context.md` structure.
