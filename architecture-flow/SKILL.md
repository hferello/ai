---
name: architecture-flow
description: >-
  Drafts architecture documentation with ASCII box diagrams and pseudocode (no raw SQL or implementation syntax).
  Use when the user asks for architecture diagrams, flow documentation, ARCHITECTURE.md, or documents cron, API, or feature flows.
---

# Architecture flow documentation

## Quick start

When producing architecture or flow docs:

1. **Output**: Default to `ARCHITECTURE.md` beside the feature unless the user specifies another path.
2. **Content**: Pseudocode for queries and control flow; ASCII boxes for flows per **Format rules** below.
3. **Structure**: Choose sections from **Section structure** that fit the feature; use **Data flow step template** for per-step flows.
4. **Before finishing**: Apply **Checklist before completing**.

## Installation (humans)

Single paste-in command and plain steps: [README.md](README.md).

## Format rules

### 1. Pseudocode Only — No Raw SQL or Code

**Queries**: Describe in pseudocode, not exact SQL.

```
# Good
query: sessions joined with events
filter: session.status = active
        session.created_at >= cutoff
        session.start_date > now
returns: session + event metadata per row

# Bad
SELECT s.id, s.event_id FROM sessions s INNER JOIN events e ...
```

**Logic**: Use descriptive pseudocode, not language-specific syntax.

```
# Good
for each (user_id, event_id) in batch:
  lookup user, event_data, sessions, org_data
  if any missing: skip
  build email template
  send email
  wait 100ms

# Bad
for (const { user_id, event_id } of batch) {
  await wait_ms(INTER_EMAIL_DELAY_MS);
}
```

### 2. ASCII Box Diagrams

Use ASCII box characters for flow diagrams.

**Alignment rules** (critical — ensures `│` and corners `┌┐└┘` line up):

1. **Fixed line width per box**: Every line in a box must have the same total character count. Pick a width (e.g. 67 chars) and use it for all lines in that box.
2. **Content padding**: Between `│` and `│`, pad content with spaces so the inner content is exactly `(width - 2)` characters. Left-pad, right-pad, or center as needed.
3. **Spaces only**: Use spaces for padding — no tabs.
4. **Consistent width across connected boxes**: Top/bottom lines (`┌─┐`, `└─┘`) must match the content lines in length.
5. **Corner columns**: `┌` and `└` share the same column; `┐` and `┘` share the same column. The horizontal run between each left/right pair is the same length on every edge line (no ragged `┐`/`┘` shifted in or out). For split bottoms like `└───┬───┘`, the `┌`/`└` and `┐`/`┘` columns still match the full box width.

**Example** (67-char lines; inner content = 65 chars):

```
┌─────────────────────────────────────────────────────────────────┐
│                         Vercel Cron                             │
│                    (Daily at 01:00 UTC)                         │
└─────────────────┬───────────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────────────────────────┐
│                    route.ts (GET Handler)                       │
│  • Validate CRON_SECRET                                         │
│  • Call business logic                                          │
└─────────────────┬───────────────────────────────────────────────┘
```

**Quick check**: Select a box — every line from `┌` to `└` should have identical length. The `│` on the left and right must align vertically; `┌`/`└` and `┐`/`┘` must sit in the same columns on top and bottom so the rectangle closes cleanly.

Characters: `┌ ─ ┐ │ └ ┘ ┬ ┴ ├ ┤ ┼ ▼`

### 3. Section Structure

Include these sections as relevant to the feature:

| Section                         | Purpose                                          |
| ------------------------------- | ------------------------------------------------ |
| **High-Level Flow**             | Entry point → route → logic → dependencies       |
| **Data Flow**                   | Per-step flow: input → query/filter → output     |
| **Component Architecture**      | HTTP layer, business logic, sub-functions        |
| **Security Architecture**       | Auth, service role, external services            |
| **Early Exit Paths**            | Decision tree for early returns                  |
| **Error Handling Flow**         | Success vs failure, per-item vs full failure     |
| **Database Tables Used**        | Tables and key columns (no raw SQL)              |
| **Performance Characteristics** | Query count, batching, timing                    |
| **Time Window Configuration**   | Schedule, date ranges, cutoff logic              |
| **Key Differences**             | Comparison to related features (if applicable)   |
| **Template Structure**          | Props, subject, content (for email/UI templates) |

## Data Flow Step Template

For each logical step in the flow:

```
┌─────────────────────────────────────────────────────────┐
│  logic.ts: function_name(inputs)                        │
└───────────────────┬─────────────────────────────────────┘
                    │
                    │ Brief description
                    ▼
┌─────────────────────────────────────────────────────────┐
│  query: table_name (or "in-memory aggregation")         │
│  filter: condition1, condition2                         │
│  returns: description of result shape                   │
└───────────────────┬─────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────────────────────┐
│  Returns: Type[] or Map<key, value>                     │
│  (optional: example structure in pseudocode)            │
└─────────────────────────────────────────────────────────┘
```

## Checklist Before Completing

- [ ] No raw SQL (SELECT, UPDATE, INSERT, etc.)
- [ ] No language-specific code (await, const, =>, etc.)
- [ ] Queries described as: `query:`, `filter:`, `returns:`
- [ ] Logic described as: `for each`, `if`, `add to`, `wait Nms`
- [ ] ASCII box diagrams use ┌─┐│└┘┬┴├┤▼
- [ ] Box alignment: every line in a box has same character count; │ align vertically; ┌┐└┘ share left/right columns
- [ ] Sections match feature type (cron vs API vs generic)
