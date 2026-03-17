# Planning with Files — Workflow

A step-by-step workflow for using the planning-with-files system on complex tasks.

## When to Use This

- Multi-step tasks (3+ steps)
- Research or exploration work
- Tasks spanning many tool calls
- Work you might pause and resume later

---

## Phase 0: Decide

**Before starting, ask:** Is this a complex task?

- **Yes** → Use this workflow
- **No** → Use normal Chat/Agent

---

## Phase 1: Initialize (~2 min)

### 1.1 Create the planning files

From your project root, run:

```bash
./.cursor/skills/planning-with-files/scripts/init-session.sh
```

Or manually copy the templates into your project root:

- `.cursor/skills/planning-with-files/templates/task_plan.md` → `task_plan.md`
- `.cursor/skills/planning-with-files/templates/findings.md` → `findings.md`
- `.cursor/skills/planning-with-files/templates/progress.md` → `progress.md`

### 1.2 Fill in `task_plan.md`

- **Goal:** One sentence describing the end state
- **Phases:** 3–7 phases (e.g. Discovery → Plan → Implement → Test → Deliver)
- **Key questions:** What you need to clarify

### 1.3 Tell the AI

Example prompt:

> I'm starting a complex task. I've created `task_plan.md`, `findings.md`, and `progress.md` in the project root. Read them first, then we'll work through the phases. Here's what I need: [your task]

---

## Phase 2: Discovery (if needed)

### 2.1 Research

- Search the codebase
- Read relevant files
- Use browser/search if needed

### 2.2 After every 2 view/browser/search actions

- Update `findings.md` with what you learned
- Especially for images, PDFs, or browser results

### 2.3 When discovery is done

- Mark Phase 1 complete in `task_plan.md`
- Update `progress.md` with what you did

---

## Phase 3: Planning & Decisions

### 3.1 Before major decisions

- Re-read `task_plan.md` (and `findings.md` if relevant)

### 3.2 Record decisions

- Add to "Decisions Made" in `task_plan.md`
- Add technical details to `findings.md`

### 3.3 When planning is done

- Mark Phase 2 complete in `task_plan.md`
- Update `progress.md`

---

## Phase 4: Implementation

### 4.1 Before each significant step

- Re-read `task_plan.md` to stay aligned with the goal

### 4.2 When something fails

- Log the error in `task_plan.md` (Error, Attempt, Resolution)
- Change approach instead of repeating the same action

### 4.3 After each phase

- Update phase status in `task_plan.md`
- Log actions and files in `progress.md`

---

## Phase 5: Testing & Delivery

### 5.1 Testing

- Log tests in `progress.md` (Test, Input, Expected, Actual, Status)

### 5.2 Delivery

- Mark all phases complete in `task_plan.md`
- Do a final update in `progress.md`

---

## Resuming After a Break

**If you used `/clear` or started a new chat:**

1. Check if `task_plan.md` exists in your project root.
2. If it exists, tell the AI:

   > I'm resuming a task. Read `task_plan.md`, `findings.md`, and `progress.md` first, then continue from where we left off.

3. Optional: run the catchup script to see what changed since the last planning update:

   ```bash
   python3 .cursor/skills/planning-with-files/scripts/session-catchup.py "$(pwd)"
   ```

4. If the catchup shows unsynced context, run `git diff --stat` and update the planning files based on what actually changed.

---

## Quick Reference Card

| When | Do This |
|------|---------|
| Starting a complex task | Init files → Fill `task_plan.md` → Tell AI to read them |
| After 2 view/browser/search ops | Update `findings.md` |
| Before a major decision | Re-read `task_plan.md` |
| After an error | Log in `task_plan.md` + change approach |
| After completing a phase | Update status in `task_plan.md` and `progress.md` |
| Resuming after `/clear` | Tell AI to read all three files first |

---

## Optional: Combine with Cursor Plan Mode

1. Use **Shift+Tab** in Agent chat to create a plan.
2. Review and edit the plan.
3. Save it as `task_plan.md` or merge it into the template.
4. Add `findings.md` and `progress.md`.
5. Follow this workflow during implementation.
