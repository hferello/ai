# Expense Tracker — PRD

> **One-liner:** Snap a receipt, auto-categorise the deduction, export at tax time.

## Problem

Freelancers forget to log expenses and scramble every April. Existing tools (FreshBooks, Expensify) are built for teams, not solo operators with 20 receipts a month.

## Context

Greenfield. OCR APIs (Google Vision, AWS Textract) extract vendor/amount/date at ~90% accuracy. Solo-freelancer "just track receipts" niche is underserved.

## Must-Haves (ship-tomorrow list)

1. Snap/upload receipt → auto-extract vendor, amount, date
2. Assign a tax category (meals, travel, supplies, etc.)
3. Export year-end summary as CSV

## Out of Scope

- Invoicing or billing
- Multi-user / team accounts
- Accounting software integrations (QuickBooks, Xero)
- Bank feed sync
- Tax filing or tax advice

## UX Direction

Invisible — open, snap, done. No onboarding, no dashboard to learn.

## User Journey

1. Open app → camera viewfinder
2. Snap receipt → OCR extracts vendor, amount, date (~2s)
3. Confirm or correct → pick category → saved
4. Tax time: tap Export → pick date range → CSV

## Risks & Open Questions

- OCR on crumpled/faded receipts — need manual-entry fallback
- Photo storage costs at full resolution
- Category taxonomy: IRS Schedule C or simpler?

## Success Criteria

- Receipt-in-hand to expense-logged in under 10 seconds
- 80%+ OCR extractions need zero correction
- One freelancer uses it a full quarter without reverting to spreadsheets
