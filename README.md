# AI Tools & Skills

A collection of AI-related tools and Cursor skills.

## Context (Cursor skill — `/spec`)

Turn a raw idea into a PRD so agents stay in the right **context** for what to build. Asks 9 focused questions — one at a time — and writes **one** file, `docs/context.md` (PRD content as product context). Say "you tell me" on any question and the agent researches it for you. Trigger with `/spec`. An always-on Cursor rule (`spec.mdc`) points agents at that file; install copies it to `~/.cursor/rules/`.

**Install:**

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-skill && bash /tmp/cursor-skill/context/install.sh && rm -rf /tmp/cursor-skill
```

See [context/README.md](context/README.md) for full documentation.

## Feature (Cursor Skill)

Feature design workflow. Asks clarifying questions first, then creates planning files in `features/<task>/`. Trigger with `/feature`.

**Install:**

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

See [feature/README.md](feature/README.md) for full documentation.
