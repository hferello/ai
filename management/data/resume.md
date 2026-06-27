# Data example: Resume writing (job search)

**Marcus Chen** — product manager with eight years in fintech, targeting a specific role. The context file is the truthful baseline; each brief targets one application.

Files: `docs/context.md` · `briefs/resume-monzo-senior-pm.md`

Related: [ats/resume-improvement-prompt.md](../../ats/resume-improvement-prompt.md) for ATS-aware rewrite rules.

---

## Context file

```markdown
# Project Context

> **One-liner:** Get Marcus into senior product interviews at regulated fintech companies — with a resume that is honest, scannable, and tuned for how recruiters actually read.

## Mission

Land first-round interviews for senior product roles where Marcus's payments and compliance experience is a genuine fit. The win is conversations with the right companies, not spray-and-pray applications.

## Principles

- Truth only. Never invent employers, titles, dates, skills, or metrics.
- Reframe and reorder what Marcus has actually done — don't fabricate.
- Write for a tired recruiter scanning for seven seconds, then for ATS parsing.
- Show impact through bullets, not adjectives. "Strong communicator" never appears as a line.

## Career Facts (ground truth — do not change)

- **Current:** Product Manager, PayStream Ltd (2021–present). B2B payments platform, ~40 engineers, PCI-adjacent environment.
- **Previous:** Associate PM → PM, ClearLedger (2018–2021). Invoice reconciliation SaaS for mid-market finance teams.
- **Before that:** Business analyst, HighStreet Bank (2016–2018).
- **Education:** BSc Economics, University of Manchester (2016).
- **Location:** London. Right to work in UK. Open to hybrid; not full-time relocation.
- **Real metrics Marcus can defend:** Cut onboarding time from 12 days to 4 at PayStream (measured via support tickets + time-to-first-payment). Grew active merchants 18% YoY at ClearLedger (internal dashboard, FY2020). Led migration off legacy auth stack — zero downtime, 3-month project.

## Must-Haves

1. A master resume in plain text — single column, ATS-safe — updated once per quarter.
2. A tailored version per serious application, saved as `resumes/company-role-date.md`.
3. A short change log with each tailored version: what moved up, what keywords added, why.

## Constraints

- Two pages maximum at senior level.
- No photo, no columns, no icons, no text boxes.
- UK English. Dates as Mon YYYY – Mon YYYY.
- Marcus is not an engineer — don't imply he shipped code. "Partnered with engineering" not "Built the API."

## Out of Scope

- Cover letters (separate brief per application if needed).
- LinkedIn profile rewrites.
- Salary negotiation scripts.
- Applying to roles that need 10+ years PM when Marcus has 6 — don't stretch seniority.

## Standards

- Summary: three lines max, current title + domain + one proof point.
- Bullets: [Action verb] + [what you did] + [result with number if truthful].
- Skills: hard skills only in a dedicated section near the top; match JD language when Marcus truly has the skill.
- Include both spelled-out terms and abbreviations where ATS expects them (e.g. API and REST, KPI and OKR).

## Success Criteria

- Recruiter could explain Marcus's last two roles after a 30-second skim.
- Every metric on the resume Marcus can explain in two sentences in an interview.
- Tailored resume includes verbatim phrases from the JD only where experience is real.
```

---

## Work brief: Resume for Monzo — Senior Product Manager

```markdown
# Work Brief: Tailored resume — Monzo, Senior Product Manager

## 1. Overview

Rewrite Marcus's master resume for Monzo's Senior Product Manager posting (Retail Banking squad). Output: plain-text resume, change log, and a five-point self-audit against the job description.

## 2. Goals

- Rank in the top tier of honest matches — strong on regulated consumer fintech and shipping at scale.
- Lead with PayStream and ClearLedger bullets that mirror Monzo's language where Marcus has real overlap.
- Pass ATS and survive a recruiter's first scan in under 30 seconds.

## 3. Audience

- **ATS:** Greenhouse (Monzo uses this). Single column, standard headings, no tables.
- **Recruiter:** Likely filtering for consumer-facing product, regulatory awareness, and data-informed decisions.
- **Hiring manager:** Will care about discovery, delivery, and working with compliance — not buzzwords.

## 4. Job description highlights (must address honestly)

From the posting — only reflect these if Marcus's ground truth supports it:

1. Own roadmap for a customer-facing banking feature area.
2. Work with design, engineering, and compliance from discovery to launch.
3. Use data and customer research to prioritise.
4. Experience in regulated environments (FCA-context helpful).
5. Comfortable with ambiguity; senior IC, not people-manager track.

## 5. Requirements

1. Plain-text resume, two pages max, UK formatting.
2. Summary retargeted to consumer + regulated fintech (without claiming Marcus worked on consumer banking if he didn't — frame B2B payments + compliance overlap honestly).
3. Reorder bullets so the strongest JD matches sit in the top third of the resume.
4. Skills section updated with JD terms Marcus actually has (e.g. roadmap prioritisation, A/B testing, stakeholder management — only if true).
5. Change log: bullet list of what moved, added, or cut and why.
6. Self-audit: five yes/no checks against the five JD highlights above.

## 6. Non-Goals (Out of Scope)

- Invent Monzo-specific product knowledge or pretend Marcus uses Monzo as a customer beyond personal account.
- Add people-management bullets — this is an IC role.
- Cover letter or "why Monzo" paragraph.

## 7. Practical Considerations

- Save as `resumes/monzo-senior-pm-2026-03.md`.
- Marcus will paste his current master resume into the chat alongside this brief.
- If a JD requirement isn't in ground truth, note it in the change log as a gap — don't fill it with fiction.

## 8. Success Metrics

- Every metric in the output appears in the context file ground truth section.
- At least three verbatim JD phrases woven into bullets where experience is real.
- Marcus reads it and says "I could defend every line in an interview."

## 9. Open Questions

- Should Marcus mention personal Monzo use in the summary, or keep it professional only?
- ClearLedger was B2B — frame as "customer-facing dashboards for finance teams" or keep strictly back-office?
```
