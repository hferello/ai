# AI Tools & Skills

A collection of AI-related tools and Cursor skills.

## Startup (Cursor Skill)

Turn a raw idea into a buildable PRD. Asks 9 focused questions — one at a time — and writes a lightweight PRD to `docs/prds/`. Say "you tell me" on any question and the agent researches it for you. Trigger with `/startup`.

**Install:**
```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-startup-skill && bash /tmp/cursor-startup-skill/startup/install.sh && rm -rf /tmp/cursor-startup-skill
```

See [startup/README.md](startup/README.md) for full documentation.

## Feature (Cursor Skill)

Feature design workflow. Asks clarifying questions first, then creates planning files in `features/<task>/`. Trigger with `/feature`.

**Install:**
```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

See [feature/README.md](feature/README.md) for full documentation.
