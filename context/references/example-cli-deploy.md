# Product Context

> **One-liner:** One command: lint, build, push, get a preview URL.

## Mission

Remove friction from preview deploys so the team previews every feature before PRs.

## Principles

- One command, no prompts — muscle memory over configuration
- Fail loud — never push broken code silently
- Output is compact by default, verbose with `--verbose`

## Must-Haves

1. Single `deploy` command: lint → build → push → return preview URL
2. Fail fast with clear error if any step breaks
3. Zero config for repos linked to a Vercel project

## Constraints

- Vercel API rate limits — need exponential backoff when polling
- Slow lint/build (>2 min) risks developers skipping the tool
- Auth: using user's Vercel token for now; shared team token TBD

## Out of Scope

- Production deploys (prod goes through PR merge flow)
- Non-Vercel hosting
- CI/CD replacement
- Monorepo support

## Tech Stack & Conventions

- Node.js CLI (no framework — keep it simple)
- Shell out to `npm run lint` and `npm run build` directly
- Use Vercel API for deploy status polling
- Follow team ESLint config

## Success Criteria

- Full cycle under 90 seconds
- Zero broken preview deploys per sprint
- 3+ team members adopt within a week
