# /architecture-flow

Helps Cursor write architecture notes with simple diagrams and plain language (not raw code).

**Install:** In Cursor, open **Terminal → New Terminal**, paste the line below, press Enter, then **fully quit and reopen Cursor**.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-architecture-flow && mkdir -p ~/.cursor/skills && cp -R /tmp/cursor-architecture-flow/architecture-flow ~/.cursor/skills/ && rm -rf /tmp/cursor-architecture-flow
```

After that, you can ask in chat for an architecture doc or flow diagram whenever you need one.

## Example output

Ask the agent something like "document the architecture flow for the contact form". It writes an `architecture-flow.md` next to the feature. Here is a trimmed version of what that file looks like:

````markdown
# Contact form: architecture flow

## High-Level Flow

```text
┌─────────────────────────────────────────────────┐
│  Contact form (client component)                │
│  - User submits name, email, and message        │
└────────────────────────┬────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────┐
│  submitContact() server action                  │
│  - Validate input with Zod before anything else │
└────────────────────────┬────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────┐
│  Resend API                                     │
│  - Send the message to the team inbox           │
└────────────────────────┬────────────────────────┘
                         │
                         ▼
┌─────────────────────────────────────────────────┐
│  Result returned to the form                    │
│  - Toast shows success or a safe error message  │
└─────────────────────────────────────────────────┘
```

## Data Flow

```text
on submit:
  collect name, email, message from the form
  call submitContact(form_data)

submitContact(form_data):
  validate form_data with the Zod schema
  if invalid: return field errors to the form
  send email via Resend to the team inbox
  if send fails: log the error, return a safe error message
  on success: return ok so the form can show a toast
```

## Error Handling Flow

```text
invalid input    -> return field errors, nothing is sent
email send fails -> log server-side, show a generic "try again" message
success          -> clear the form, show a success toast
```
````

Notice what it does and does not contain: plain pseudocode instead of real code, simple boxes instead of screenshots, and no raw SQL. The goal is a map you can read in a minute, not a second copy of the codebase.
