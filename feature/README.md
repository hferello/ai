# /feature

Designing features, multi-step tasks, research, building projects, anything spanning many tool calls. Helps Cursor plan bigger pieces of work: it asks a few questions up front, then keeps a simple folder of notes—`task_plan`, `findings`, `progress`, `documentation`, and a **PRD** (`prd.md`)—so nothing gets lost.

**Demo:**

![/feature demo](demo.gif)

**Install:** In Cursor, open **Terminal → New Terminal**, paste the line below, press Enter, then **fully quit and reopen Cursor**.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

---

## How to invoke `/feature`

Send **one Agent message** that has two parts: the **command line**, then everything the agent needs to understand the work.

### 1. First line: task name

Use a **short slug in quotes** right after `/feature`. Cursor uses it as the human-readable name for the work; it also lines up with the folder under `features/` (e.g. `checkout flow`) once planning files exist.

```text
/feature "feature name"
```

Use lowercase words, hyphens if you need them (`"checkout flow"` → often `checkout-flow` on disk). The agent will still understand; the init script sanitizes names when you use scripts.

### 2. What happens next

The agent runs **Phase 0** (clarifying questions) unless you skip that flow, then creates **`features/<task>/`** with `task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and **`prd.md`**. You iterate from there.

---

For step-by-step workflow, hooks, Windows install, or uninstall, see [references/more.md](references/more.md).
