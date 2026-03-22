# AI Tools & Skills

A collection of AI-related tools and Cursor skills.

## Scope (Cursor Skill)

Turn a raw idea into a PRD so agents stay within scope. Asks 9 focused questions — one at a time — and writes a lightweight PRD to `docs/prds/`. Say "you tell me" on any question and the agent researches it for you. Trigger with `/scope`.

**Install:**
```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-scope-skill && bash /tmp/cursor-scope-skill/scope/install.sh && rm -rf /tmp/cursor-scope-skill
```

See [scope/README.md](scope/README.md) for full documentation.

## Feature (Cursor Skill)

Feature design workflow. Asks clarifying questions first, then creates planning files in `features/<task>/`. Trigger with `/feature`.

**Install:**
```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

See [feature/README.md](feature/README.md) for full documentation.

## Startup (Cursor Skill)

Problem and market validation for early-stage ideas — phased reports in a flat `startup/` folder at the project root. Trigger with `/startup`.

**Install:**
```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-startup-skill && bash /tmp/cursor-startup-skill/startup/install.sh && rm -rf /tmp/cursor-startup-skill
```

See [startup/README.md](startup/README.md) for full documentation.
