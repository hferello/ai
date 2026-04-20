# Context

A Cursor skill that captures product context so AI agents stay aligned. Run `/context` and it walks you through 8 direct questions — one at a time — writing everything to a single file: `docs/context.md`.

Not sure about an answer? Say "you tell me" and the agent will research it for you.

The first time you run `/context` in a repo, it also wires `AGENTS.md` (creating it if needed) so every future agent — Cursor, Claude Code, Codex — reads `docs/context.md` before doing real work. Commit `AGENTS.md` and `docs/context.md` together.

**Demo:**

![/context demo](../assets/context-demo.gif)

**Install** (once per machine): Open a terminal in Cursor, paste this, hit Enter, then fully quit and reopen Cursor.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-skill && bash /tmp/cursor-skill/context/install.sh && rm -rf /tmp/cursor-skill
```

That's it. No per-project setup — just run `/context` in any repo when you're ready.

---

## Using `/context`

### 1. Start (optional seed)

```text
/context

/context — a simple app for freelancers to snap receipts and track deductions
```

### 2. Answer the questions (or don't)

The agent asks 8 questions in this order: product, mission, principles, must-haves, constraints, boundaries, stack, and success criteria. One per turn. You can answer, skip, or say "you tell me." After each answer `docs/context.md` is updated on disk.

If a codebase already exists, the agent uses it to ground the stack question and folds any confirmed details into `## Tech Stack & Conventions` only when they're useful.

## Examples

Finished examples live in `references/` to show what a tight context doc looks like.
