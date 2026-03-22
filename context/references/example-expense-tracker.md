# Product Context

> **One-liner:** Snap a receipt, auto-categorise the deduction, export at tax time.

## Mission

Help solo freelancers stop losing track of expenses so tax time isn't a scramble.

## Codebase & Stack

Greenfield. OCR APIs (Google Vision, AWS Textract) extract vendor/amount/date at ~90% accuracy.

## Must-Haves

1. Snap/upload receipt → auto-extract vendor, amount, date
2. Assign a tax category (meals, travel, supplies, etc.)
3. Export year-end summary as CSV

## Out of Scope

- Invoicing or billing
- Multi-user / team accounts
- Accounting software integrations (QuickBooks, Xero)
- Bank feed sync
- Tax filing or tax advice

## Principles

- Speed over features — every interaction should be under 5 seconds
- No onboarding — the app should be obvious on first open
- Privacy first — receipt photos may contain sensitive info

## Tech Stack & Conventions

- React Native (Expo) for mobile-first
- Supabase for auth and storage
- Google Vision API for OCR
- All components use `snake_case` variables, `PascalCase` components

## Constraints

- OCR on crumpled/faded receipts — need manual-entry fallback
- Photo storage costs at full resolution — compress or thumbnail originals
- No budget for paid OCR above free tier initially

## Success Criteria

- Receipt-in-hand to expense-logged in under 10 seconds
- 80%+ OCR extractions need zero correction
- One freelancer uses it a full quarter without reverting to spreadsheets
