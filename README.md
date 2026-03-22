# AI Tools & Skills

A collection of AI-related tools and Cursor skills.

## Context (Cursor skill — `/context`)

Capture product context — mission, must-haves, boundaries, principles, stack, constraints — so AI agents stay aligned. Asks 9 direct questions, one at a time, and writes a single file: `docs/context.md`. Say "you tell me" on any question and the agent researches it for you. An always-on Cursor rule (`context.mdc`) tells agents to read that file before non-trivial work.

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
