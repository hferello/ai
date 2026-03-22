# CLI Deploy Tool — PRD

> **One-liner:** One command: lint, build, push, get a preview URL.

## Problem

Deploying a preview takes 4–5 manual steps. People skip steps, previews break, reviewers see features for the first time in PRs.

## Context

Next.js 14, Vercel, GitHub. Vercel CLI exists but needs flags and doesn't run pre-checks. Team already has `lint` and `build` npm scripts.

## Must-Haves (ship-tomorrow list)

1. Single `deploy` command: lint → build → push → return preview URL
2. Fail fast with clear error if any step breaks
3. Zero config for repos linked to a Vercel project

## Out of Scope

- Production deploys (prod goes through PR merge flow)
- Non-Vercel hosting
- CI/CD replacement
- Monorepo support

## UX Direction

Power tool — one command, muscle memory. No interactive prompts. Compact output: step pass/fail, then URL.

## User Journey

1. Run `deploy` → detects branch, confirms not `main`
2. Lint → pass/fail
3. Build → pass/fail
4. Push → poll Vercel (~30s) → print preview URL

## Risks & Open Questions

- Vercel API rate limits — need exponential backoff
- Slow lint/build (>2 min) means developers skip the tool
- Auth: user's Vercel token or shared team token?

## Success Criteria

- Full cycle under 90 seconds
- Zero broken preview deploys per sprint
- 3+ team members adopt within a week
