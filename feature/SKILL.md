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

## CRITICAL: Manual Discipline (No Hooks in Cursor)

Cursor does not support automatic hooks. You must **manually** follow these rules:

1. **Before starting:** If a task folder exists (e.g. `features/audit-logging/task_plan.md`), read `task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and `prd.md` first.
2. **Before major decisions:** Re-read `task_plan.md` to refresh goals in your attention window.
3. **After every 2 view/browser/search operations:** Update `findings.md` immediately (2-Action Rule).
4. **After completing a phase:** Update phase status in `task_plan.md` and log actions in `progress.md`.
5. **After any error:** Log in `task_plan.md` and change your approach—never repeat the same failing action.

## Where Files Go

| Location              | What Goes There                                                                                                                                                  |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Skill directory       | Templates, scripts, reference docs                                                                                                                               |
| **Your project root** | `features/` (created if missing) containing task folders (e.g. `audit-logging/`) with `task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, `prd.md` |

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
   - `task_plan.md` — populated with Goal, Phases, Key Questions from answers
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

## Quick Start (Alternative: Skip Phase 0)

If the user prefers to create files first without discovery questions, they can run the init script directly:

### 1. Initialize (run from project root, optionally with a task name)

```bash
# With a name: creates features/<task>/ with the four files
~/.cursor/skills/feature/scripts/init-session.sh audit-logging

# Names are sanitized: "dark mode toggle" → features/dark-mode-toggle/

# Without a name: uses {yyyy}-{mm}-{dd}-task-{N} (auto-increments per day)
~/.cursor/skills/feature/scripts/init-session.sh
# → features/2025-03-19-task-1/, features/2025-03-19-task-2/, etc.
```

### 2. Fill in task_plan.md (in the task folder)

- **Goal:** One sentence describing the end state
- **Phases:** 3–7 phases (Discovery → Plan → Implement → Test → Deliver)
- **Key questions:** What you need to clarify

### 3. Tell the user

"I've created `features/audit-logging/task_plan.md`, `findings.md`, and `progress.md`. Read them first, then we'll work through the phases."

## File Purposes

| File                        | Purpose                                                         | When to Update                      |
| --------------------------- | --------------------------------------------------------------- | ----------------------------------- |
| `<folder>/task_plan.md`     | Phases, progress, decisions                                     | After each phase                    |
| `<folder>/findings.md`      | Research, discoveries                                           | After ANY discovery                 |
| `<folder>/progress.md`      | Session log, test results                                       | Throughout session                  |
| `<folder>/documentation.md` | What was built, how it works                                    | During delivery or as you implement |
| `<folder>/prd.md`           | Product requirements (goals, user stories, acceptance criteria) | Populated from Phase 0 answers      |

## Code Standards (When Implementing)

**When creating or modifying code**, especially backend/server code, follow the project's standards.

**Summary (from typical project standards):**

- **Console logging:** `console.log("[functionName] started", { key_params })` at start; `console.log("[functionName] completed", { result_summary })` at end; `console.error("[functionName] error_context", error)` on all error paths
- **Comments:** Top-of-file (purpose, context); above functions (intent, role); inline (tricky logic, RLS, data flow); step-by-step in server actions

## Critical Rules

(Unchanged: Create plan first, 2-Action Rule, Read before decide, Update after act, Log errors, Never repeat failures, Continue after completion.)

## Resuming After /clear

1. Read `<folder>/task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and `prd.md` immediately.
2. Optionally run: `python3 ~/.cursor/skills/feature/scripts/session-catchup.py "$(pwd)"`
3. If catchup shows unsynced context: run `git diff --stat`, read planning files, update them, then proceed.

## When to Use

**Use for:** Multi-step tasks (3+ steps), research, building projects, tasks spanning many tool calls.

**Skip for:** Simple questions, single-file edits, quick lookups.

## References

- **Workflow:** [references/WORKFLOW.md](references/WORKFLOW.md)
- **Manus principles:** [references/reference.md](references/reference.md)
- **Examples:** [references/examples.md](references/examples.md)
- **Project code standards:** If the project has `docs/comments and debugging.md`, read it before implementing backend code.
