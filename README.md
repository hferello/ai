# AI Tools & Skills

A collection of AI-related tools and Cursor skills.

## Spec (Cursor Skill)

Turn a raw idea into a PRD so agents stay aligned with what to build. Asks 9 focused questions — one at a time — and writes a lightweight PRD to `docs/prds/`. Say "you tell me" on any question and the agent researches it for you. Trigger with `/spec`. An always-on Cursor rule (`spec.mdc`) reminds agents to treat those PRDs as the spec; install copies it to `~/.cursor/rules/`.

**Install:**

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-spec-skill && bash /tmp/cursor-spec-skill/spec/install.sh && rm -rf /tmp/cursor-spec-skill
```

See [spec/README.md](spec/README.md) for full documentation.

## Feature (Cursor Skill)

Feature design workflow. Asks clarifying questions first, then creates planning files in `features/<task>/`. Trigger with `/feature`.

**Install:**

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

See [feature/README.md](feature/README.md) for full documentation.
