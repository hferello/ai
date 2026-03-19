# /feature

Designing features, multi-step tasks, research, building projects, anything spanning many tool calls. Helps Cursor plan bigger pieces of work: it asks a few questions up front, then keeps a simple folder of notes—`task_plan`, `findings`, `progress`, `documentation`, and a **PRD** (`prd.md`)—so nothing gets lost.

**Demo:**

![/feature demo](demo.gif)

**Install:** In Cursor, open **Terminal → New Terminal**, paste the line below, press Enter, then **fully quit and reopen Cursor**.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

---

## How to invoke `/feature` (detailed)

Send **one Agent message** that has two parts: the **command line**, then everything the agent needs to understand the work.

### 1. First line: task name

Use a **short slug in quotes** right after `/feature`. Cursor uses it as the human-readable name for the work; it also lines up with the folder under `features/` (e.g. `sms-parsing`) once planning files exist.

```text
/feature "sms parsing"
```

Use lowercase words, hyphens if you need them (`"checkout flow"` → often `checkout-flow` on disk). The agent will still understand; the init script sanitizes names when you use scripts.

### 2. Same message: the full brief

**Below that first line**, write the real request. Be specific: the more you attach here, the less guesswork later.

| Include | Why |
| -------- | --- |
| **Goal** | What “done” looks like in plain language (ingest SMS → DB, new screen, refactor, etc.). |
| **`@` references** | In Cursor, type `@` and pick **files, folders, or docs** so they’re loaded into context (schema, routes, examples). |
| **External services** | Name the product (Twilio, Stripe, …). Optionally add a **doc link** or use Cursor’s context chips so official docs ride along. |
| **Prior art** | Point at an existing pattern (“same as email submission but for SMS”). |
| **Constraints** | Non-negotiables: separate webhook vs email, auth, RLS, no breaking change to X, must work on Vercel, etc. |

### 3. Example (copy and adapt)

This is a realistic shape; **replace paths** with your repo’s real files.

```text
/feature "sms parsing"

I need to get SMS messages sent to our Twilio number parsed and stored in Supabase, aligned with how submissions already work.

Schema / types: @src/db/drizzle/schema/submissions.ts

Follow the existing email ingestion pattern: @src/docs/submissions/email-submission.md

Requirements:
- SMS must use its own webhook URL and handler—do not reuse the email webhook.
- Inbound payloads should end up consistent with whatever `submissions` (or related tables) expect, or call out migrations if we need new columns.

Optional: attach Twilio’s inbound SMS / webhook docs in the chat if you want the agent to cite them while planning.
```

### 4. What happens next

The agent runs **Phase 0** (clarifying questions) unless you skip that flow, then creates **`features/<task>/`** with `task_plan.md`, `findings.md`, `progress.md`, `documentation.md`, and **`prd.md`**. You iterate from there.

---

For step-by-step workflow, hooks, Windows install, or uninstall, see [references/more.md](references/more.md).
