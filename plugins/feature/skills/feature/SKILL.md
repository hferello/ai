---
name: feature
description: Feature design workflow. Use when designing features—asks clarifying questions first, then creates the plan. Trigger with /feature.
disable-model-invocation: false
---

# Feature Design

Work like Manus: Use persistent markdown files as your "working memory on disk" for feature design.

```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)
→ Anything important gets written to disk.
```

## Installation (humans)

One paste-in command: [README.md](README.md). Extra detail (Windows, hooks, uninstall): [references/more.md](references/more.md).

## When the user runs `/feature`

They should send **`/feature "task slug"`** and, in the **same message**, a detailed brief: goal, **`@`** files/folders/docs for context, any external systems (e.g. Twilio), pointers to existing patterns, and hard constraints (e.g. “SMS must use a different webhook than email”). If they only send a slug, ask what to attach before heavy planning. Full pattern and copy-paste example: [README.md](README.md) (section *How to invoke `/feature` (detailed)*).

## CRITICAL: Manual Discipline (hooks are a safety net)

This plugin ships Claude Code hooks that nudge you automatically, but they are only a safety net - you must still **manually** follow these rules:

1. **Before starting:** If a task folder exists, read the **plan** (`task_plan.md` **or** `overview.md` plus the relevant `phase-*.md` files—see [Phased plan layout](#phased-plan-layout-instead-of-task_planmd)), then `findings.md`, `progress.md`, `documentation.md`, and `prd.md`.
2. **Before major decisions:** Re-read the plan (`task_plan.md` or `overview.md` + active phase file) to refresh goals in your attention window.
3. **After every 2 view/browser/search operations:** Update `findings.md` immediately (2-Action Rule).
4. **After completing a task group or phase:** Run the **[Mandatory task: close out each task group or phase](#mandatory-task-close-out-each-task-group-or-phase)** checklist **in full** before treating that unit as done or ending your turn.
5. **After any error:** Log in the plan (`task_plan.md` or `overview.md` / current `phase-*.md`) and change your approach—never repeat the same failing action.

### Mandatory task: close out each task group or phase

Implementation work for a **task group** or **phase** is **not finished** until the right planning files are updated. Run this checklist **every time** you complete a group or phase (including before you pause, hand off, or say you are done).

**Single-file plan (`task_plan.md` only)**

- [ ] **`task_plan.md`:** Mark finished tasks `[x]`; set this group’s **Status** to `complete` (and set the next group to `in_progress` if there is one); record new **Decisions** / **Errors** from this stretch.
- [ ] **`progress.md`:** Session entry—what you did, files/paths touched, **exact next step** for the next session or agent.
- [ ] **`findings.md`:** Anything new since the last write (facts, URLs, decisions).
- [ ] **`documentation.md`:** Update **only if** behavior, APIs, env vars, or user-facing flows changed.

**Phased layout (`overview.md` + `phase-*.md`)**

- [ ] **`phase-N-<slug>.md` (the phase you finished):** Mark tasks `[x]`; set **Status** to `complete`.
- [ ] **`overview.md`:** Update that phase’s **Status** in the table and **Current phase** if you are moving on—**must match** the phase file. Do **not** update only `overview.md` or only the phase file.
- [ ] **`progress.md`:** Same as single-file plan.
- [ ] **`findings.md`:** Same as single-file plan.
- [ ] **`documentation.md`:** Same as single-file plan.

**When the entire feature is complete:** mark every group/phase complete in the plan, and state completion in `progress.md`.

### Agent handoff (new chat, different model, or “continue later”)

**Switching agents is the same as `/clear` for memory:** the next agent does not see this conversation or past tool output. The **only** durable state is what you wrote under `features/<task>/`.

**Do not end a turn** (or mark a phase “done”) until you have run **[Mandatory task: close out](#mandatory-task-close-out-each-task-group-or-phase)** for that unit **and** this **handoff checklist** is satisfied:

| Step | File | What to write |
|------|------|----------------|
| 1 | `task_plan.md` **or** `overview.md` + `phase-*.md` | Same intent: current group/phase **Status** (`pending` / `in_progress` / `complete`), checkboxes, any new **Decisions** (see [Phased plan layout](#phased-plan-layout-instead-of-task_planmd)) |
| 2 | `progress.md` | Session date, what you did, files touched, **what’s next** for the next agent |
| 3 | `findings.md` | New facts, decisions, URLs, and anything from search/browser/view since last update (2-Action Rule still applies) |
| 4 | `documentation.md` | If behavior, APIs, env vars, or user-facing flows changed—update **Overview / What Was Built / How It Works / Usage** |

If you only have time for one file before stopping, prioritize **`progress.md`** (where we are + what’s next), then **`findings.md`** (facts that would be lost), then **`documentation.md`** (how to use what changed).

**On the next agent’s first message** in this task: read the plan (`task_plan.md` **or** `overview.md` and all `phase-*.md` files), `findings.md`, `progress.md`, `documentation.md`, and `prd.md` before writing code or plans.

## Where Files Go

| Location              | What Goes There                                                                                                                                                  |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Skill directory       | Templates, scripts, reference docs                                                                                                                               |
| **Your project root** | `features/` (created if missing) containing task folders with `findings.md`, `progress.md`, `documentation.md`, `prd.md`, plus **either** `task_plan.md` **or** the phased files below |

## Phased plan layout (instead of task_plan.md)

When the agent decides the work should be **split into phases** as separate files, use this layout **instead of** `task_plan.md` (do not maintain both—one planning shape per task folder).

**Remove `task_plan.md` when switching to phased layout:** If `task_plan.md` already exists (for example after `init-session.sh`), **delete it** when you create `overview.md` and `phase-*.md`, so humans are not faced with two parallel plans that say the same thing. **Exception:** keep `task_plan.md` only when it serves a **clear, non-overlapping** purpose (for example scratch notes or a checklist that you are **not** duplicating in `overview.md` / phase files). If you keep it for that reason, put a short note at the top of `task_plan.md` stating what it is for and that **execution status** lives in `overview.md` and the `phase-*.md` files.

| File | Role |
|------|------|
| `overview.md` | Overall **goal**; a **table or list of every phase** with a short summary, **status** per phase (`pending` / `in_progress` / `complete`), and a link or filename to each phase doc; optional **global** decisions/errors. |
| `phase-1-<kebab-slug>.md`, `phase-2-<kebab-slug>.md`, … | **Per-phase** detail: purpose, task checklists, status, phase-scoped decisions/errors. |

**Naming:** `phase-<n>-<kebab-slug>.md` where `n` is the order (1, 2, …) and `<kebab-slug>` comes from the phase name, e.g. `phase-1-schema-and-migrations.md`, `phase-2-api-layer.md`.

**Templates:** Copy from the skill’s `templates/overview.md` and `templates/phase.md` (render `{{TASK_NAME}}` / `{{DATE}}` for `overview.md` like other templates).

**When to choose this:** Multi-phase work where a single file would be hard to navigate; the agent may still use a **single** `task_plan.md` when phases are few and fit comfortably in one document.

## Phase 0: Discovery Questions (BEFORE Creating Files)

**When the skill is invoked for a new task, run Phase 0 first.** Do not create any planning files until the user has answered (or skipped) the clarifying questions. The user may skip any question—proceed with whatever answers they provide.

### 0.1 Ask clarifying questions (one at a time)

**Ask exactly one question per turn.** Wait for the user's response before asking the next. Do not list all questions at once.

**Flow:**

1. Ask the first question.
2. User responds in one of three ways:
   - **Answer** — Record it and move to the next question.
   - **Skip** — Treat "skip", "next", "pass", or blank as valid; move to the next question.
   - **Question the question** — User asks for clarification (e.g., "What do you mean by that?", "Why does that matter?"). Briefly clarify, then move to the next question.
3. Repeat until all questions are done.
4. Only then create the plan (0.2).

**Question order (ask in this sequence):**

1. **Problem/Goal:** "What problem does this feature solve for the user?" or "What is the main goal we want to achieve with this feature?"
2. **Target User:** "Who is the primary user of this feature?"
3. **Core Functionality:** "Can you describe the key actions a user should be able to perform with this feature?"
4. **User Stories:** "Could you provide a few user stories? (e.g., As a [type of user], I want to [perform an action] so that [benefit].)"
5. **Acceptance Criteria:** "How will we know when this feature is successfully implemented? What are the key success criteria?"
6. **Scope/Boundaries:** "Are there any specific things this feature _should not_ do (non-goals)?"
7. **Data Requirements:** "What kind of data does this feature need to display or manipulate?"
8. **Design/UI:** "Are there any existing design mockups or UI guidelines to follow?" or "Can you describe the desired look and feel?"
9. **Edge Cases:** "Are there any potential edge cases or error conditions we should consider?"

### 0.2 Create the plan (only after questions)

Once the user has answered (or skipped all), create the task folder and files:

1. **Determine task name:** Use the name the user provided, or run `init-session.sh` with no args to get an auto-generated name (e.g. `2025-03-19-task-1`).
2. **Create** `features/<task>/` with:
   - **Plan (pick one):**
     - **`task_plan.md`** — Goal, phases/task groups in one file (Foundation, Backend, Frontend, Tests, or custom), Key Questions from answers; **or**
     - **`overview.md` + `phase-1-<slug>.md`, …** — [Phased layout](#phased-plan-layout-instead-of-task_planmd) when the agent chooses separate phase files; same content split across files. **Delete `task_plan.md`** if it exists (e.g. left over from init), unless it has a distinct non-overlapping purpose—see phased layout section.
   - `findings.md` — Requirements, Research Findings from answers
   - `progress.md` — Session log template
   - `documentation.md` — Overview, What Was Built from answers
   - `prd.md` — Full PRD (see structure below), populated from answers

### PRD structure (for `prd.md` inside the task folder)

1. **Introduction/Overview** — Feature and problem it solves
2. **Goals** — Specific, measurable objectives
3. **User Stories** — User narratives and benefits
4. **Functional Requirements** — Numbered, explicit requirements
5. **Non-Goals (Out of Scope)** — What this feature will _not_ include
6. **Design Considerations (Optional)** — Mockups, UI/UX notes
7. **Technical Considerations (Optional)** — Constraints, dependencies
8. **Success Metrics** — How success is measured
9. **Open Questions** — Remaining clarifications

### 0.3 Critical Reassessment (after creating files)

**Shift from creation mode to adversarial review mode.** Re-read the PRD, task plan, and findings with the explicit goal of finding problems — not confirming what you wrote is good.

Your role here is **intellectual sparring partner**, not agreeable assistant. Prioritise truth over agreement. If the user's logic is weak or an assumption is shaky, say so clearly and explain why.

#### Part 1: Document Review (always check these)

| Category | What to look for |
|----------|-----------------|
| **Requirements Consistency** | Do goals, user stories, acceptance criteria, and functional requirements align? Any contradictions? |
| **Completeness Gaps** | Requirements implied by user stories but not listed? Missing error states? Unaddressed edge cases? |
| **Scope Integrity** | Tasks that belong in non-goals? Scope creep beyond what was discussed? |
| **Dependency Analysis** | Hidden dependencies between tasks? External dependencies not mentioned? Ordering issues in the task plan? |
| **Security & Data** | Data validation gaps? Missing authorization considerations? Sensitive data handling? |

#### Feature-Specific Categories (pick the ones relevant to the feature)

- **UI features:** Accessibility gaps, unhappy paths (empty/loading/error states), responsive design
- **API/Backend:** Performance implications (N+1 queries, rate limiting), error handling coverage, data migration
- **Full-stack:** Client-server contract mismatches, caching invalidation, optimistic vs pessimistic updates

#### Part 2: Intellectual Challenge

Go beyond the document. Challenge the *thinking* behind it.

| Lens | What to do |
|------|------------|
| **Assumption analysis** | What is the user taking for granted that might not be true? Surface hidden assumptions about the user, the tech stack, data availability, or effort estimates. Name them explicitly. |
| **Counterpoints** | What would an intelligent, well-informed skeptic say about this approach? Steel-man the objections — don't strawman them. |
| **Reasoning test** | Does the logic chain from problem → solution → requirements → acceptance criteria actually hold? Are there gaps or leaps of faith? |
| **Alternative framing** | How else could this feature be built? Is the user anchored on one approach when a simpler, cheaper, or more effective alternative exists? |
| **Confirmation bias check** | Did the discovery phase reinforce the user's initial idea without genuine pushback? Were hard questions asked, or did we just validate? |

**Tone:** Constructive but rigorous. The goal is greater clarity, accuracy, and intellectual honesty — not argument for its own sake. If a challenge doesn't hold up, drop it. If it does, press it.

#### How to execute

1. **Re-read** all planning files (PRD, task plan, findings) looking for problems
2. **Part 1 (Document):** Categorize each issue as "obvious fix" or "judgment call"
   - **Obvious fixes** — update the files directly (e.g., add missing edge case to PRD, add missing task to plan)
   - **Judgment calls** — present to the user with context and a recommendation; wait for input before updating
3. **Part 2 (Intellectual Challenge):** Present challenges to the user as questions or provocations. Do not edit planning files for these — they are meant to sharpen thinking, not patch a document. Only update files if the user decides to change direction based on the challenge.
4. **Log** the reassessment summary in `progress.md`

#### Output format

Present findings to the user like this:

> **Reassessment complete.** Reviewed PRD and task plan for [feature-name].
>
> **Fixed (N items):**
> - [What was fixed and where]
>
> **Needs your input (N items):**
> - [Issue, context, and recommendation]
>
> **Intellectual challenges:**
> - [Assumption, counterpoint, or alternative framing — stated clearly with reasoning]

If nothing was found in a section, say so briefly and proceed. Do not invent problems to appear thorough.

## Quick Start (Alternative: Skip Phase 0)

If the user prefers to create files first without discovery questions, they can run the init script directly:

### 1. Initialize (run from project root, optionally with a task name)

```bash
# With a name: creates features/<task>/ with task_plan, findings, progress, documentation, prd
${CLAUDE_PLUGIN_ROOT}/skills/feature/scripts/init-session.sh audit-logging

# Names are sanitized: "dark mode toggle" → features/dark-mode-toggle/

# Without a name: uses {yyyy}-{mm}-{dd}-task-{N} (auto-increments per day)
${CLAUDE_PLUGIN_ROOT}/skills/feature/scripts/init-session.sh
# → features/2025-03-19-task-1/, features/2025-03-19-task-2/, etc.
```

The script **copies from** `templates/` next to the script and replaces `{{TASK_NAME}}` and `{{DATE}}`, so new task folders match the full templates (including HANDOFF reminders), not minimal stubs.

### 2. Fill in the plan (in the task folder)

**Either** edit **`task_plan.md`** **or** create **`overview.md`** and **`phase-N-<slug>.md`** files ([phased layout](#phased-plan-layout-instead-of-task_planmd))—not both. If you use the phased layout and `task_plan.md` is already present, **delete it** unless it has a distinct purpose (see [Phased plan layout](#phased-plan-layout-instead-of-task_planmd)).

- **Goal:** One sentence describing the end state
- **Phases/task groups:** Agent decides based on feature (e.g. Foundation, Backend, Frontend, Tests, or custom)
- **Key questions:** What you need to clarify

### Phases / task groups (agent decides)

**The agent decides which phases or task groups to include** based on the feature. Common options:

| Group | What goes here |
|-------|----------------|
| **Foundation** | Schema, migrations, config, types, validation, shared utilities |
| **Backend** | API routes, server logic, queries, server actions |
| **Frontend** | UI components, pages, client-side logic, styling |
| **Tests** | Creating or running unit, integration, or e2e tests |

Use only the groups that apply (e.g. backend-only feature → Backend + Tests). Each group has **Status:** (pending / in_progress / complete) and checkboxes for tasks. If you use the phased file layout, each phase maps to one `phase-N-<slug>.md` and summaries live in `overview.md`.

### 3. Tell the user

Point them at the plan you created, e.g. `features/audit-logging/task_plan.md` **or** `features/audit-logging/overview.md` and the `phase-*.md` files, plus `findings.md` and `progress.md`.

## File Purposes

| File                        | Purpose                                                         | When to Update                      |
| --------------------------- | --------------------------------------------------------------- | ----------------------------------- |
| `<folder>/task_plan.md`     | Task groups, progress, decisions (omit if using phased layout)   | After each task group               |
| `<folder>/overview.md`      | Phase index, per-phase summary and status (phased layout only)   | After each phase or status change   |
| `<folder>/phase-*.md`      | Per-phase tasks and detail (phased layout only)                   | While working that phase            |
| `<folder>/findings.md`      | Research, discoveries                                           | After ANY discovery                 |
| `<folder>/progress.md`      | Session log, test results                                       | Throughout session                  |
| `<folder>/documentation.md` | What was built, how it works                                    | When behavior/API/usage changes; **before handoff** if you shipped user-visible or integrator-facing changes |
| `<folder>/prd.md`           | Product requirements (goals, user stories, acceptance criteria) | Populated from Phase 0 answers; updated during reassessment (0.3) |

## Code Standards (When Implementing)

**When creating or modifying code**, especially backend/server code, follow the project's standards.

**Summary (from typical project standards):**

- **Console logging:** `console.log("[functionName] started", { key_params })` at start; `console.log("[functionName] completed", { result_summary })` at end; `console.error("[functionName] error_context", error)` on all error paths
- **Comments:** Top-of-file (purpose, context); above functions (intent, role); inline (tricky logic, RLS, data flow); step-by-step in server actions

## Critical Rules

Create plan first, 2-Action Rule, Read before decide, Update after act, Log errors, Never repeat failures, Continue after completion. **After each task group or phase:** always run [Mandatory task: close out](#mandatory-task-close-out-each-task-group-or-phase)—no exceptions for “small” finishes.

## Resuming After /clear (or Switching Agents)

Treat **new chat**, **different model**, and **`/clear`** the same: read disk first, assume zero chat memory.

1. Read the plan (`task_plan.md` **or** `overview.md` + `phase-*.md`), `findings.md`, `progress.md`, `documentation.md`, and `prd.md` immediately.
2. Optionally run: `python3 ${CLAUDE_PLUGIN_ROOT}/skills/feature/scripts/session-catchup.py "$(pwd)"`
3. If catchup shows unsynced context: run `git diff --stat`, read planning files, update them, then proceed.

## When to Use

**Use for:** Multi-step tasks (3+ steps), research, building projects, tasks spanning many tool calls.

**Skip for:** Simple questions, single-file edits, quick lookups.

## References

- **Workflow:** [references/WORKFLOW.md](references/WORKFLOW.md)
- **Manus principles:** [references/reference.md](references/reference.md)
- **Examples:** [references/examples.md](references/examples.md)
- **Project code standards:** If the project has `docs/comments and debugging.md`, read it before implementing backend code.
