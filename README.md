# AI Tools & Skills

A collection of AI-related tools and Cursor skills.

## Managing AI agents: Structure, Guardrails, Skills

Worked examples of the three layers that keep an AI agent on course: a context file and PRD (Structure), an `AGENTS.md` of constraints (Guardrails), and targeted prompts and tools (Skills). Built around a small SaaS todo list so you can copy the shape for your own project.

See [management/README.md](management/README.md).

## Context (Cursor skill — `/context`)

Capture product context — mission, must-haves, boundaries, principles, stack, constraints — so AI agents stay aligned. Asks 8 direct questions, one at a time, and writes a single file: `docs/context.md`. Say "you tell me" on any question and the agent researches it for you. The first run in a repo also wires `AGENTS.md` so every future agent — Cursor, Claude Code, Codex — reads `docs/context.md` before non-trivial work.

**Install skill:**

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
