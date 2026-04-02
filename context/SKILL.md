---
name: context
description: Captures product context so AI agents stay aligned. Asks direct questions one by one, writes docs/context.md. Trigger with /context.
---

# Context: Product → Guardrails

You're capturing the product context that AI agents need to do good work. Your job: ask direct questions, push back on vague answers, and write a clear, bounded doc that agents can reference to stay within scope.

## Rules

1. **Human language.** No jargon. Direct questions, direct answers.
2. **One question per turn.** Ask one. Wait. Never stack questions.
3. **Every question ends with:** `(Say "skip" to leave this out, or "you tell me" and I'll research it.)`
4. **Skip means skip.** If the user says "skip," move to the next question. Do not add the section to `docs/context.md` — omit it entirely. The doc only contains sections the user cared enough to answer.
5. **"You tell me" means research.** When the user says "you tell me" — search the codebase, DON'T search the web. Propose what you find and get confirmation before writing it to the doc.
6. **Never assume.** Don't fill in gaps with guesses or defaults. If the user doesn't know and research turns up nothing, write "Unknown" in that field. Every line in `docs/context.md` comes from the user or confirmed research — never from your imagination.
7. **Push back.** If they list 10 must-haves, say: "That's 10. Pick 3 you'd ship without the others." If the pitch is vague: "I can't picture it yet — give me a concrete example."
8. **Incremental drafting.** After each answer (or confirmed research), update `docs/context.md` on disk immediately.

## Kickoff

User runs `/context`. They may add a short seed in the same message (e.g. `/context — receipt tracking for freelancers`) but **do not ask for a project name** — the repo is the container; `docs/context.md` has no separate title field for a named initiative.

1. Ensure `docs/` exists (create it if needed).
2. **`docs/context.md` is the only file for this workflow** — never add sibling PRDs or extra markdown under `docs/` for it.
3. If `docs/context.md` **does not exist**, create it from the template at the bottom of this file.
4. If it **already exists**, read it first. If it looks like a **different** initiative than the user's message (or seed), ask whether to replace it (suggest archiving the old content) or keep/resume it. If it is empty or partial, continue filling it — do not reset unless the user agrees.
5. Begin the question flow. If they gave a seed, use it when asking **The Pitch**; if not, open with the pitch question cold.

## Resuming a Session

If the user says `/context` and `docs/context.md` already exists:

1. Read `docs/context.md` from disk.
2. Check which sections are present. Missing sections were either skipped or not yet reached.
3. Find the last section that has content and map it back to the question flow to figure out where the session stopped.
4. Tell the user what you found: "Looks like we got through [last completed section]. Picking up from there."
5. Resume at the next question in the flow — don't re-ask questions whose sections already have content.
6. If the doc looks complete, say: "This context doc looks complete. Want to revise anything?"

## The Question Flow

Ask in this order, one per turn. Update `docs/context.md` after each answer.

### 1. The Pitch

> "What's the product? Give me one sentence."

If the answer runs longer than two sentences, push back: "Love the detail, but give me the version you'd text to a friend."

→ Update: **Overview**

### 2. The Mission

> "What's the goal? What should this product achieve for its users?"

If they describe a feature instead of a goal, redirect: "That's something it does — but what's the outcome for the user?"

→ Update: **Mission**

### 3. The Principles

> "Do you have any guiding principles for this product? How should agents make decisions when something isn't spelled out?"

If they're unsure, offer examples: "For instance — 'always prefer simplicity over flexibility', 'never break backwards compatibility', 'accessibility is non-negotiable', 'ship fast, refine later.'"

→ Update: **Principles**

### 4. The Must-Haves

> "What are the 3 most important things this product must do?"

If they list more than 3: "That's [N]. Which 3 matter most?" Hold the line.

→ Update: **Must-Haves**

### 5. The Constraints

> "Any limitations agents should know about? Budget, timeline, technical constraints, third-party dependencies?"

If they say "nothing," push: "Every product has at least one. A service we depend on? A hard deadline? A platform restriction?"

→ Update: **Constraints**

### 6. The Boundaries

> "What's off-limits? What should agents never build or change?"

These become hard stops during implementation. If the user says "I don't know," suggest common traps based on what you've heard so far.

→ Update: **Out of Scope**

### 7. The Stack

> "What's the tech stack? Any conventions, patterns, or existing architecture agents should always follow?"

If a codebase exists, scan it before asking this. Use what you find to ground the question, then fold any confirmed details into this section only if they're useful for future agents. This is about preferences and rules that aren't obvious from the code — naming conventions, architectural patterns, libraries to prefer or avoid.

→ Update: **Tech Stack & Conventions**

### 8. The Win

> "How do we know this is working? What's a real signal, not a vanity metric?"

→ Update: **Success Criteria**

## After the Last Question

1. Read back the complete `docs/context.md` to the user inline.
2. Ask: "Anything to add, change, or cut?"
3. Apply any edits the user requests.
4. Run the Red Team step (below).

## Red Team: Adversarial Review

**Shift from creator to critic.** Re-read the entire context document with the goal of finding problems — not confirming it's good.

Your role here is **intellectual sparring partner**, not agreeable assistant. Prioritise truth over agreement. If the user's logic is weak or an assumption is shaky, say so clearly and explain why.

### Part 1: Document Review

Check the document for internal consistency and completeness.

| Lens                  | Questions to ask                                                                                         |
| --------------------- | -------------------------------------------------------------------------------------------------------- |
| **Contradictions**    | Do must-haves conflict with out-of-scope? Do principles conflict with stack conventions?                 |
| **Hidden complexity** | Is any "must-have" actually 3 features in a trenchcoat? Are constraints understated?                     |
| **Gaps**              | Are there decisions an agent would need to make that nothing in this doc covers?                         |
| **Feasibility flags** | Anything technically unrealistic given the stated stack and constraints?                                 |
| **Scope creep**       | Did the conversation drift beyond the original pitch? Would the one-liner still describe what's in here? |

### Part 2: Intellectual Challenge

Go beyond the document. Challenge the _thinking_ behind it.

| Lens                        | What to do                                                                                                                                                          |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Assumption analysis**     | What is the user taking for granted that might not be true? Surface hidden assumptions about the user, the market, the tech, or the timeline. Name them explicitly. |
| **Counterpoints**           | What would an intelligent, well-informed skeptic say about this idea? Steel-man the objections — don't strawman them.                                               |
| **Reasoning test**          | Does the logic chain from problem → solution → must-haves → success criteria actually hold? Are there gaps or leaps of faith?                                       |
| **Alternative framing**     | How else could this problem be solved? Is the user anchored on one approach when a simpler, cheaper, or more effective alternative exists?                          |
| **Confirmation bias check** | Did the conversation reinforce the user's initial idea without genuine pushback? Were hard questions asked, or did we just validate?                                |

**Tone:** Constructive but rigorous. The goal is greater clarity, accuracy, and intellectual honesty — not argument for its own sake. If a challenge doesn't hold up, drop it. If it does, press it.

### How to execute

1. Re-read `docs/context.md` from disk (not from memory — re-read it).
2. **Part 1 (Document):** For each issue found, categorize as **"obvious fix"** or **"needs your input"**.
   - **Obvious fixes** — update `docs/context.md` directly (e.g., add a missing edge case to risks, tighten a vague must-have).
   - **Needs input** — present to the user with context and a recommendation. Wait before editing.
3. **Part 2 (Intellectual Challenge):** Present challenges to the user as questions or provocations. Do not edit the file for these — they are meant to sharpen thinking, not patch a document. Only update `docs/context.md` if the user decides to change direction based on the challenge.

### Output format

> **Red team review complete.**
>
> **Fixed (N items):**
>
> - [What was tightened/added and why]
>
> **Needs your input (N items):**
>
> - [Issue + recommendation]
>
> **Intellectual challenges:**
>
> - [Assumption, counterpoint, or alternative framing — stated clearly with reasoning]

If nothing was found in a section, say so briefly. Do not invent problems to appear thorough.

### After the review

Once the user has resolved any flagged items and engaged with the intellectual challenges, close:

"Context locked in at `docs/context.md`. Any agent or session in this repo should read it before non-trivial work to stay in scope."

## Quality Reference

Two examples live in `references/` alongside this skill. Read them to calibrate what a finished context doc looks like — tight one-liners, concrete must-haves (not vague wishes), specific boundaries, and success criteria you could actually measure.

## Context document template

Start `docs/context.md` with just the header. Add each section only when the user answers (or you research it for them). Skipped questions get no section — the doc only contains what's relevant.

```markdown
# Product Context

> **One-liner:** [filled after Q1]
```

Sections to add as they're answered (use these exact headings):

| Question        | Section heading               |
| --------------- | ----------------------------- |
| The Mission     | `## Mission`                  |
| The Principles  | `## Principles`               |
| The Must-Haves  | `## Must-Haves`               |
| The Constraints | `## Constraints`              |
| The Boundaries  | `## Out of Scope`             |
| The Stack       | `## Tech Stack & Conventions` |
| The Win         | `## Success Criteria`         |

## When to Use

**Use for:** Any product where AI agents will do the building. Gives them a single source of truth — what the product is, what matters, and what's off-limits.

**Skip for:** Bug fixes, refactors, or tasks where the context is already obvious.
