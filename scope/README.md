# /scope

A Cursor skill that turns a raw idea into a PRD to ensure your agents stay within scope. Ask `/scope "project-name"` and it walks you through 9 focused questions — one at a time — to produce a lightweight PRD at `docs/prds/<slug>.md`.

Not sure about an answer? Say "you tell me" and the agent will research it for you.

**Demo:**

![/scope demo](../assets/scope-demo.gif)

**Install:** Open a terminal in Cursor, paste this, hit Enter, then fully quit and reopen Cursor.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-scope-skill && bash /tmp/cursor-scope-skill/scope/install.sh && rm -rf /tmp/cursor-scope-skill
```

---

## Using `/scope`

### 1. Give it a name and a seed idea

```text
/scope "expense-tracker" — a simple app for freelancers to snap receipts and track deductions
```

### 2. Answer the questions (or don't)

The agent asks 9 questions, one per turn. You can answer, skip, or say "you tell me" to let the agent research it. After each answer the PRD file is updated on disk — nothing is lost if the session breaks.

### 3. Review the PRD

After the last question, the agent reads back the full PRD and asks for final edits. The finished doc lives at `docs/prds/<slug>.md` where any future agent session can reference it.
