# Structure

Structure is the document you write before the first line of code. It tells the agent what you are building and why, so it builds to your intent instead of guessing.

There are two parts:

1. **A context file** for the whole product. Mission, principles, tech stack, constraints. You write this once.
2. **A PRD (product requirements document)** for each feature. One short doc per feature, written just before you build it.

Below is a filled example for a small SaaS todo list app called **TidyList**. Read it, then copy the shape for your own project.

You do not have to write these by hand. The `/context` skill builds the context file by asking you questions, and the `/feature` skill builds a feature plan the same way. See [skills.md](skills.md).

---

## Part 1: The context file

This lives at `docs/context.md`. It is the single source of truth for the product. Every agent reads it before doing real work.

```markdown
# Product Context

> **One-liner:** A todo list for small teams that keeps everyone on the same page without the weight of a full project tool.

## Mission

Help small teams capture and finish shared tasks without arguing over who owns what. The win is a list everyone trusts, not another tool people abandon after a week.

## Principles

- Fast over full. Adding a task should take one keystroke, not a form.
- Obvious on first open. No onboarding tour, no manual.
- Calm by default. No red badges or guilt. The app should feel light.
- Accessible always. Keyboard and screen reader support are not optional.

## Must-Haves

1. Create, edit, complete, and delete tasks in a shared list.
2. Invite a teammate to a list and see each other's changes live.
3. Sort tasks by due date and filter by who they belong to.

## Constraints

- Solo founder, nights and weekends. Keep the scope tight.
- Free tiers only for now (Supabase, Vercel). No paid add-ons until there is revenue.
- Real-time sync is expected, so the data layer has to support it from day one.

## Out of Scope

- Sub-tasks, dependencies, and Gantt charts.
- Time tracking or billing.
- Native mobile apps. Web only, but it must work well on a phone browser.
- Integrations with Slack, email, or calendars.

## Tech Stack & Conventions

- Next.js (App Router) and TypeScript in strict mode.
- Tailwind CSS and shadcn/ui for the interface.
- Supabase for auth, database, and real-time. Drizzle for the schema.
- Server Components by default. Push `use client` as far down the tree as possible.
- Variables use snake_case, functions use camelCase, components use PascalCase, files use kebab-case.

## Success Criteria

- A new user can create a list and add their first task in under 30 seconds.
- Two people editing the same list see each other's changes within a second.
- One real team uses TidyList for a month without going back to a spreadsheet.
```

---

## Part 2: A PRD for one feature

You write one of these per feature, just before you build it. This example is for the shared-list feature from the must-haves above. It lives at `tasks/prd-shared-lists.md`.

```markdown
# Product Requirements Document: Shared lists

## 1. Introduction/Overview

Let a list owner invite a teammate so both people can view and edit the same todo list. Changes from one person appear for the other without a refresh. This is the core of TidyList. Without it, the app is just a personal todo list.

## 2. Goals

- Owners can invite a teammate by email.
- Invited people can view and edit the shared list.
- Edits sync between members in near real time.

## 3. User Stories

- As a list owner, I want to invite a teammate by email so we can manage tasks together.
- As an invited member, I want to see the owner's tasks so I know what is going on.
- As any member, I want my edits to show up for everyone so we never work off a stale list.

## 4. Functional Requirements

1. An owner can open a list and enter a teammate's email to send an invite.
2. The invited person gets an email with a link to join the list.
3. Joining adds them as a member with view and edit rights.
4. Any member can create, edit, complete, or delete tasks in the list.
5. When one member changes a task, other members see it within one second.
6. An owner can remove a member, which revokes their access at once.
7. The database enforces access with row level security, not just the interface.

## 5. Non-Goals (Out of Scope)

- Roles beyond owner and member (no read-only viewers yet).
- Comments or chat on tasks.
- Activity history or an audit log.

## 6. Design Considerations

- Use the shadcn `Dialog` for the invite flow and `Avatar` for member presence.
- Show who owns each task with a small avatar, not a long name.
- The invite state must be clear: pending, accepted, removed.

## 7. Technical Considerations

- Use Supabase Realtime to broadcast task changes to members.
- Row level security policies decide who can read and write each list.
- A `list_members` table joins users to lists with their access level.

## 8. Success Metrics

- Time from "invite sent" to "teammate editing" is under two minutes.
- Edits appear for other members within one second in normal conditions.
- No member can ever read a list they were not invited to.

## 9. Open Questions

- Should an invite expire if it is not accepted within seven days?
- What happens to a member's tasks when they are removed from a list?
```

---

## How to use this

1. Write `docs/context.md` first, once, for the whole product. Run `/context` to make it easy.
2. For each feature, write a short PRD before you build. Run `/feature` to make it easy.
3. Point the agent at the right file and ask it to build: `@tasks/prd-shared-lists.md can you build this please?`

Keep both files short. A page each is plenty. The goal is shared intent, not a contract.
