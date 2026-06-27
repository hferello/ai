# Guardrails

Guardrails are constraints that keep the agent on course. They tell it what is out of scope, what not to add, and what to check before touching code that already works.

AI does not drift because it is bad. It drifts because no one told it what staying on course looks like. Guardrails are how you say it once and have it apply every time.

Below is a filled example for a software project. For the Data layer shape and other domains (generic, business, everyday, resume), see [data.md](data.md).

## Where guardrails live

Pick one of these. Both are read automatically by the agent.

- **`AGENTS.md`** at the repo root. Plain markdown, no setup. Best place to start.
- **`.cursor/rules/`** for rules that only apply to certain files. Each rule is a `.mdc` file with a small header that says when it applies.

For most projects, start with `AGENTS.md`. Move to `.cursor/rules/` when you want a rule to fire only for, say, database files.

---

## Example: AGENTS.md for TidyList

```markdown
# Guardrails

Read `docs/context.md` before any non-trivial work. These rules apply to every task in this repo.

## Out of scope (do not build unless I ask)

- Sub-tasks, task dependencies, or any Gantt or timeline view.
- Time tracking, billing, or anything to do with payments.
- Native mobile apps. This is a web app that must work well on a phone browser.
- Integrations with Slack, email, or calendars.

If a request seems to need one of these, stop and ask before building it.

## Before you write code

- Plan first. For anything non-trivial, summarise what you will do and wait for my go-ahead.
- Never guess. If something is unclear, ask. If you do not know, say so and check the official docs.
- No placeholders, no TODOs, no half-finished code. Ship the whole thing or tell me what is blocking it.

## Do not add

- New dependencies without asking first. Use what is already installed.
- New UI libraries. We use Tailwind and shadcn/ui only.
- New icon packs (Lucide, Heroicons, and so on) when an asset or component already exists.
- Custom components when a shadcn component already does the job.
- Inline styles or hardcoded colors. Use Tailwind classes and our design tokens.
- "Nice to have" extras I did not ask for. Build the request, nothing more.

## Check before you touch existing logic

- Read the file fully before changing it. Do not guess what it does.
- Before editing the auth flow, the database schema, or row level security, explain what you plan to change and why, then wait for my go-ahead.
- Do not rename or move files that other files import without telling me.
- If a change touches more than three files, show me the plan first.
- Keep working code working. If you are unsure a change is safe, ask.

## Security (never break these)

- Never expose `SUPABASE_SERVICE_ROLE_KEY` or any secret to the browser. Only `NEXT_PUBLIC_` values reach the client.
- Never commit secrets. `.env.local` stays gitignored. Document required vars in `.env.example` with placeholders.
- Row level security stays on for every table that holds user data. User queries go through the Supabase client so RLS enforces access.
- Validate every input with Zod before it reaches the database. Never trust client-side checks alone.
- Use UUID v4 for IDs, not auto-increment integers.

## Code rules

- TypeScript in strict mode. No `any`. No non-null assertions (`!`). Use type guards for unknown data.
- Server Components by default. Push `use client` down to the smallest piece that needs it. Each client component lives in its own file.
- Use Server Actions for mutations and validate inside the action with Zod.
- Never swallow errors. No empty `catch {}`. Log with `console.error` and show the user a safe message.
- Log server actions: `[functionName] started` and `[functionName] completed` with key params.
- Do not duplicate logic or types. Shared logic goes in `lib/`, shared types in `types/`.
- Use `next/image` for images and `next/font` for fonts.
- Naming: snake_case variables, camelCase functions, PascalCase components, kebab-case files.

## Design and accessibility rules

- Mobile first. It must work well on a phone browser before anything else.
- Match the spacing, type, and color scale already in the project. Do not invent new ones.
- Use the right element for the job. A clickable action is a `<button>`, not a styled `<div>`.
- Every interactive element works with a keyboard and keeps a visible focus ring.
- Every form field has a label. Every image has alt text (use `alt=""` for decorative images).
- Text contrast is at least 4.5:1. Never use color alone to show state. Pair it with text or an icon.
- Touch targets are at least 44 by 44 pixels.
- One `<h1>` per page and a logical heading order.
- Modals trap focus while open and return it on close.
- Respect `prefers-reduced-motion` for any animation.

## When in doubt

Ask a short question instead of guessing. One good question now saves an hour of rework later.
```

---

## How to use this

1. Save the block above as `AGENTS.md` at the root of your repo.
2. Edit the lists so they match your product and your stack.
3. Commit it. From now on the agent reads it on every task.
4. When the agent drifts, do not just fix the output. Add a line to `AGENTS.md` so it cannot drift the same way twice.

Guardrails grow with the project. Each time you catch the agent doing something you did not want, that is a new rule.

The example above is grouped on purpose: scope, security, code, and design. Those are the same groups people keep as separate Cursor rule files (a security rule, an accessibility rule, a code-style rule). One `AGENTS.md` is the simplest way to start. When the list gets long, split each group into its own `.cursor/rules/` file so a rule only fires for the files it covers.
