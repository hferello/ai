---
name: startup
description: Startup-focused problem and market validation. Tests if a problem space exists and whether it is worth building for. Asks questions one by one, then builds phased reports. Trigger with /startup.
disable-model-invocation: false
---

# Startup

**For founders and early teams.** This skill is tuned to what startups need: de-risk the idea before you burn time and money. It tests whether a problem is real, painful, and worth solving — before anyone writes code.

```
Good validation = finding reasons the idea WON'T work.
If the idea survives honest scrutiny, it might be worth building.
```

## TL;DR — Validation Methods Report

This section is your knowledge base. Read it. Use it to push back on weak ideas.

### Why Validation Matters

90% of startups fail. The #1 reason? No market need. Not bad code. Not ugly design. The product solved a problem nobody had. Validation exists to catch this before you waste months building.

**The core question is not "Can we build this?" It is "Should we build this?"**

### The 7 Best Validation Methods (Ranked by Evidence Strength)

| Rank | Method | What It Tests | Evidence Type | Effort |
|------|--------|---------------|---------------|--------|
| 1 | **Pre-selling** | Will people pay real money? | Behavioural (strongest) | Medium |
| 2 | **Fake Door / Smoke Test** | Do people click, sign up, or act? | Behavioural | Low |
| 3 | **Concierge MVP** | Do people value the outcome? | Behavioural | High |
| 4 | **Problem Interviews** | Is the problem real and painful? | Qualitative | Medium |
| 5 | **Workaround Analysis** | Are people already trying to solve this? | Behavioural | Low |
| 6 | **Market Research** | Is the market big enough? | Quantitative | Low |
| 7 | **Surveys** | What do people say they think? | Attitudinal (weakest) | Low |

> **Key insight:** What people *do* beats what people *say*. Behavioural evidence is stronger than opinions. A customer who built a spreadsheet hack proves more than 100 survey respondents saying "yeah, that sounds useful."

### Method Deep Dives

#### 1. Pre-selling

Ask people to pay before the product exists. This is the strongest signal. Money is the ultimate filter for real demand. If people won't part with cash for a promise, they won't pay for the product either.

**When to use:** You have a clear value proposition and a reachable audience.
**Watch out for:** Small sample sizes. Friends and family buying out of kindness.

#### 2. Fake Door / Smoke Test (Pretotyping)

Create something that *looks* like the product exists. A landing page. A menu item. A button in an app. Then measure who clicks, signs up, or takes action.

This comes from Alberto Savoia's pretotyping work at Google. The principle: test demand with real behaviour before you build anything. A landing page with a sign-up form can tell you more in a weekend than months of planning.

**When to use:** You want to test demand quickly and cheaply.
**Watch out for:** Clicks are not commitment. Layer in deeper signals (email sign-up, waitlist, deposit).

**Conversion benchmarks (what "good" looks like):**

| Traffic Source | B2B SaaS | Consumer App |
|---|---|---|
| Cold traffic (search/ads) | 2–5% | 4–8% |
| Warm traffic (email/social) | 6–12% | 10–15% |
| Waitlist → paid conversion | >20% (excellent) | 10–15% |

A low signup rate with high eventual conversion (e.g., 2% sign up but 60% convert to paid) can still be a strong signal. Quality beats quantity.

#### 3. Concierge MVP

Deliver the service by hand. No code. No automation. You personally do the work for early customers. This teaches you what users actually need — not what you assume they need.

**When to use:** You need to learn the workflow before automating it.
**Watch out for:** It does not scale. That is the point. Learn first, build later.

#### 4. Problem Interviews (The Mom Test)

Talk to 20–25 people about their problems. Not your idea. Their problems. Rob Fitzpatrick's "Mom Test" has three rules:

1. **Talk about their life, not your idea.** Ask about real past behaviour.
2. **Ask for specifics, not opinions.** "When did you last face this?" beats "Would you use this?"
3. **Listen more than you talk.** The customer should do 80% of the talking.

**The filter:** If they haven't tried solving the problem themselves, it's a complaint — not a validated need. Look for workarounds, hacks, and money spent.

**When to use:** Always. This is the foundation of all validation.
**Watch out for:** Compliments are not data. "That's a great idea!" means nothing.

#### 5. Workaround Analysis

Look at what people have already built to solve the problem. Spreadsheets. Scripts. Cobbled-together tools. Manual processes. These are gold. They prove the problem is real enough that someone invested effort to solve it.

**When to use:** Before building anything. Check if the problem is already being "solved badly."
**Watch out for:** If no workarounds exist, the problem may not be painful enough.

#### 6. Market Research (Desk Research)

Study the market from your desk. Industry reports. Competitor analysis. TAM/SAM/SOM sizing. Search trends. This answers: "Is the market big enough to sustain a business?"

**When to use:** After you've confirmed the problem is real. Market size determines if it's worth pursuing commercially.
**Watch out for:** Big market ≠ good opportunity. A crowded market with entrenched players may be worse than a small niche with no competition.

#### 7. Surveys

Surveys measure attitudes — what people *say* they think. They are the weakest form of evidence because people filter, forget, and tell you what sounds good.

**When to use:** Only for quantitative, attitudinal questions. "What percentage of users feel confident after filing taxes?" is a good survey question. "Why do users abandon their carts?" is not — use observation for that.

**Surveys are the hardest research method to do well, yet the easiest to launch.**

Good reasons to survey:
- Quantify something you've already observed qualitatively.
- Measure attitudes at scale (not behaviour).
- Supplement interview findings with numbers.

Bad reasons to survey:
- "We need data" (what kind?).
- "It's quick and cheap" (bad data is expensive).
- "The CEO wants numbers" (give them analytics instead).

> Sources: NN/g (Rohrer, 2022; Brown, 2024; Kohler, 2023; Nielsen, 2004), Rob Fitzpatrick (The Mom Test), Alberto Savoia (Pretotyping), Eric Ries (Lean Startup), Steve Blank (Customer Development).

### Problem Classification

Not all problems are equal. Use this grid to classify the problem early:

| | **High Frequency** | **Low Frequency** |
|---|---|---|
| **High Pain** | Unicorn Zone — Build here | Enterprise Zone — Big contracts, long sales cycles |
| **Low Pain** | Vitamin Zone — Hard to monetise | Dead Zone — Walk away |

### B2B vs B2C: Adapt Your Approach

The validation approach must change based on who you're selling to. Determine this early in discovery.

| | **B2B** | **B2C** |
|---|---|---|
| **Buying motivation** | ROI, efficiency, risk reduction | Convenience, enjoyment, personal value |
| **Decision maker** | Committee (multiple stakeholders) | Single person |
| **Sales cycle** | 2–6 months | Minutes to days |
| **Strongest validation signal** | Letter of Intent (LOI) | High engagement (DAU, Day-1 retention) |
| **Churn rate** | 5–10% annually | 5–10% monthly |

**Agent rule for B2B:** Push the user toward getting a Letter of Intent. An LOI is a non-binding document where a potential customer says they'd buy the product. It is the strongest B2B validation signal — stronger than interviews or surveys.

**Agent rule for B2C:** Focus on engagement and virality signals. Can the user describe how people will discover the product? What's the referral loop? B2C products die from acquisition cost, not from lack of interest.

### Reframing the Problem

Before you validate, make sure you are solving the right problem. Thomas Wedell-Wedellsborg ("What's Your Problem?") identifies three traps:

1. **Pain point → jump to solution.** "Sales are down. We need more marketing." Maybe. Or maybe the product is wrong.
2. **Goal you can't reach.** The goal itself may have a false assumption baked in.
3. **Fell in love with a solution.** "We should build an app!" — with zero evidence that an app solves anything.

**The slow elevator story:** Tenants complained the elevator was slow. Engineers proposed faster motors. Building managers proposed mirrors next to the elevator. Complaints dropped. The real problem wasn't speed — it was boredom.

**Agent rule:** When a user describes their problem, check if they have already jumped to a solution. If so, pull them back to the problem. Ask: "What is the actual pain? What happens if this problem is never solved?"

---

## When the User Runs `/startup`

They should send **`/startup "problem slug"`** (optional label) and a brief description of the problem or idea they want to validate. The slug is for naming context in `progress.md` only — **all files still go in `startup/`**, not in a subfolder. If they only send a slug, ask what the problem is before proceeding.

## Where Files Go

| Location | What Goes There |
|---|---|
| Skill directory (`startup/` in this repo) | SKILL.md, templates, references — **not** where outputs go |
| **Project root** | `startup/` — all generated files live here, flat (no subfolders) |

## Output Files (One Per Phase)

Each phase produces its own file. The agent creates a **`startup/` folder at the project root** (if missing) and writes every file there. **Do not use `startup/<task>/` or any nested folder.** One flat `startup/` per project.

| # | File | Phase | Description |
|---|------|-------|-------------|
| 1 | `01-problem-statement.md` | Phase 1 | Problem statement, hypothesis, four assumption types |
| 2 | `02-market-research.md` | Phase 2 | Competitors, market size, trends, failed attempts |
| 3 | `03-survey.md` | Phase 3 | Survey decision + survey questions (if applicable) |
| 4 | `04-research-plan.md` | Phase 4 | Interview guide for customer conversations |
| 5 | `05-key-insights.md` | Phase 5 | 10+ insights from reputable sources |
| 6 | `06-opportunity-statement.md` | Phase 6 | HMW statement + Go/No-Go assessment |
| 7 | `07-monetisation.md` | Phase 7 | Revenue model, pricing strategy, unit economics |
| 8 | `08-legal-review.md` | Phase 8 | Legal risks and regulatory considerations |
| 9 | `09-feature-plans.md` | Phase 9 | High-level feature breakdown, bridge to `/feature` |
| — | `progress.md` | All | Tracks which phases are done, in progress, or pending |
| — | `findings.md` | All | Running index of everything learned across all phases |

**Create `progress.md` and `findings.md` first**, then add each numbered file as you complete each phase. Update `findings.md` after every 2 search or research operations.

---

## Phase 0: Discovery Questions (BEFORE Creating Files)

**Ask exactly one question per turn.** Wait for the answer before asking the next. Do not list all questions at once.

**Flow:**

1. Ask the first question.
2. User responds in one of three ways:
   - **Answer** — Record it and move to the next question.
   - **Skip** — Treat "skip", "next", "pass", or blank as valid. Move on.
   - **Question the question** — Clarify briefly, then move to the next.
3. Repeat until all questions are done.
4. Only then create the `startup/` folder and add `progress.md` and `findings.md`.

**Question order (ask in this sequence):**

1. **The Problem:** "What problem are you trying to solve? Describe it in plain language."
2. **Who Has It:** "Who experiences this problem? Be specific — not 'everyone' or 'businesses.'"
3. **The Job (JTBD):** "What is this person trying to get done when they hit this problem? What outcome do they need?" *(This reframes from demographics to motivation. People don't buy products — they hire them to do a job.)*
4. **Current Solutions:** "How do these people solve this problem today? What workarounds exist?"
5. **Evidence:** "How do you know this problem exists? Have you seen it, heard about it, or experienced it yourself?"
6. **Frequency & Pain:** "How often does this problem occur? How painful is it when it does?"
7. **Willingness to Pay:** "Would someone pay to make this problem go away? How much, roughly?"
8. **Your Assumptions:** "What are you assuming to be true that you haven't tested yet?"

### Agent Behaviour During Discovery

- **Push back on vague answers.** "Everyone has this problem" is not an answer. Ask for a specific person or group.
- **Challenge assumptions.** If the user says "people would definitely pay for this," ask how they know.
- **Flag solution-jumping.** If the user describes a solution instead of a problem, redirect: "That sounds like a solution. What is the underlying problem it solves?"
- **Use the Mom Test lens.** Would this answer survive the Mom Test? If it's based on opinions or hypotheticals, flag it.

---

## Phase 1: Problem Statement → `01-problem-statement.md`

After discovery, ensure `startup/` exists at the project root and write the first file there.

### 1.1 Build the Problem Statement

Turn the user's answers into a structured problem statement:

```
[Target user] needs a way to [user's need] because [insight/pain point].
```

### 1.2 Form a Hypothesis

Write a testable hypothesis:

```
We believe that [target user] struggles with [problem]
because [root cause].
We will know this is true when [measurable evidence].
```

### 1.3 Map Assumptions to Four Hypotheses

Every idea rests on four types of assumption. Extract them from the user's answers and rank by risk.

**Problem Hypothesis:** Does this problem actually exist? Is it painful enough to solve?

| Assumption | Risk (High/Med/Low) | How to Test |
|---|---|---|
| [assumption] | [risk level] | [test method from the 7 methods above] |

**Solution Hypothesis:** Does the proposed approach actually solve the problem?

| Assumption | Risk (High/Med/Low) | How to Test |
|---|---|---|
| [assumption] | [risk level] | [test method] |

**Price Hypothesis:** Will people pay enough to sustain a business?

| Assumption | Risk (High/Med/Low) | How to Test |
|---|---|---|
| [assumption] | [risk level] | [test method] |

**Go-to-Market Hypothesis:** Can we reach these people affordably?

| Assumption | Risk (High/Med/Low) | How to Test |
|---|---|---|
| [assumption] | [risk level] | [test method] |

Start with the highest-risk assumptions. If the Problem Hypothesis fails, nothing else matters.

**Update `progress.md`:** Mark Phase 1 complete.

---

## Phase 2: Market Research → `02-market-research.md`

The agent does desk research for the user. This is not optional — do the work.

### What to Research

- **Competitors:** Who else solves this problem? How? What do they charge?
- **Market Size:** TAM (Total Addressable Market), SAM (Serviceable), SOM (Obtainable). Use real numbers from reports, government data, or industry sources.
- **Trends:** Is this problem growing or shrinking? Search trends, industry reports, news.
- **Failed Attempts:** Has anyone tried this and failed? Why?

### Research Standards

- Use reputable sources: peer-reviewed papers, government data, industry reports, established publications.
- Do not cite random blog posts unless they have citations.
- Provide URLs for every claim.
- Find at least 5 competitor or alternative solutions.

**Update `progress.md`:** Mark Phase 2 complete.

---

## Phase 3: Survey Decision → `03-survey.md`

### Survey Decision Framework

Before creating a survey, run this check (from NN/g):

| Question | Answer | Result |
|---|---|---|
| Is the research question **quantitative**? | No → Skip survey | Use interviews or observation |
| Is the research question **attitudinal** (what people think/feel)? | No → Skip survey | Use analytics or usability testing |
| Both yes? | → Survey may be appropriate | Proceed with caution |

**If a survey is NOT appropriate:** Write the decision and reasoning into `03-survey.md` so the user understands why. Then move on.

**If a survey IS appropriate**, create one that follows these rules:
- Keep it short. Under 10 questions. Ideally 3–5.
- Use even-numbered scales (no neutral midpoint — force a lean).
- Avoid leading questions.
- Randomise option order where possible.
- Include a "Not applicable" option for questions people may not be able to answer.
- Test the survey with 3 people before sending it.

**Format the survey so the user can paste it into Google Forms, Typeform, or similar.** Include the question text, response type (multiple choice, scale, open text), and options.

**Update `progress.md`:** Mark Phase 3 complete.

---

## Phase 4: Research Plan → `04-research-plan.md`

Create an interview guide for 5–10 problem interviews.

### Interview Structure

1. **Warm-up** (2 min): Build rapport. Explain there are no right or wrong answers.
2. **Current behaviour** (10 min): "Walk me through the last time you experienced [problem]."
3. **Pain & frequency** (5 min): "How often does this happen? What does it cost you?"
4. **Workarounds** (5 min): "What have you tried to solve this?"
5. **Ideal outcome** (3 min): "If this problem vanished tomorrow, what would change?"
6. **Wrap-up** (2 min): "Is there anything I didn't ask that I should have?"

### Interview Rules

**Apply the Mom Test:** No pitching. No leading. No hypotheticals. Ask about the past.

**Use the Five Whys:** If an answer is vague or surface-level, ask "why?" up to five times. The first answer is usually a symptom. The root cause hides deeper.

### Who to Interview

Describe the ideal participant profile. Include where to find them (online communities, LinkedIn, customer lists, etc.).

**Update `progress.md`:** Mark Phase 4 complete.

---

## Phase 5: Key Insights → `05-key-insights.md`

The agent goes and finds real insights. This is not optional. Do not be lazy.

### Requirements

- Find **at least 10 useful insights** relevant to the problem space.
- Sources must be peer-reviewed, government-backed, from reputable organisations, or from publications with citations.
- Do not get insights from random blogs unless they have citations.
- Each insight must include: the finding, the source, and a URL.
- Do not stop at surface-level findings. Dig into the data.

### Output Format

| # | Insight | Source | URL | Relevance |
|---|---------|--------|-----|-----------|
| 1 | [finding] | [source name] | [link] | [why it matters to this problem] |

**Update `progress.md`:** Mark Phase 5 complete.

---

## Phase 6: Opportunity Statement + Go/No-Go → `06-opportunity-statement.md`

### Opportunity Statement

Synthesise everything into a clear opportunity statement using the HMW format:

```
How might we [action verb] for [target user] so that [desired outcome]?
```

Support the statement with:
- Problem evidence (from discovery + interviews)
- Market evidence (from research)
- Key insights that reinforce or challenge the opportunity

### Go / No-Go Assessment

Give an honest recommendation. Use this framework:

| Signal | Strong Go | Weak / Unclear | No-Go |
|---|---|---|---|
| **Problem evidence** | Multiple people describe the same pain | Some anecdotal evidence | Nobody has this problem |
| **Workarounds exist** | People built hacks to solve it | Some awareness, no action | No workarounds, no effort spent |
| **Willingness to pay** | People have paid for alternatives | "Maybe" or "it depends" | "I wouldn't pay for that" |
| **Market size** | Large or fast-growing market | Niche but viable | Tiny, shrinking, or saturated |
| **Competition** | Gaps in existing solutions | Crowded but beatable | Dominant player with no gaps |
| **Unit economics (LTV/CAC)** | Projected ratio ≥ 3:1 | Ratio 1:1–2:1 (narrow path) | Ratio < 1:1 (losing money per customer) |
| **Insight strength** | Data-backed, peer-reviewed evidence | Mixed signals | No supporting data |

**LTV/CAC explained simply:**
- **LTV** = how much money one customer brings in over their lifetime.
- **CAC** = how much it costs to get that customer.
- **3:1 ratio** is the benchmark for a healthy business. Below 1:1 means you lose money on every customer.

### Agent Rules for Go/No-Go

- **Be honest.** If the evidence is weak, say so. Do not cheerleader.
- **Recommend "No-Go" when warranted.** Killing a bad idea early saves months.
- **Flag "Pivot" opportunities.** Sometimes the validated problem is adjacent to the original idea.
- **Never say "this will definitely work."** You are reducing uncertainty, not predicting the future.

**If the recommendation is No-Go**, skip Phases 7–9. Explain why and stop.

**Update `progress.md`:** Mark Phase 6 complete.

---

## Phase 7: Monetisation Strategy → `07-monetisation.md`

**Only proceed if Phase 6 resulted in "Go" or "Conditional Go."**

### What to Cover

- **Revenue model:** How does this product make money? (Subscription, one-time, freemium, marketplace fees, advertising, licensing, etc.)
- **Pricing strategy:** Based on competitor benchmarks and discovery answers. If pricing is unclear, use the Van Westendorp method below.
- **Unit economics:** Projected LTV, estimated CAC, and LTV/CAC ratio.
- **Revenue projections:** Conservative, moderate, and optimistic scenarios for Year 1.

### Pricing Validation (Van Westendorp Method)

Use this when the user is unsure what to charge. Skip if competitors set a clear price anchor.

Ask four questions to find the acceptable price range:

1. **Too Expensive:** "At what price would you not even consider buying?"
2. **Too Cheap:** "At what price would you question the quality?"
3. **Expensive but acceptable:** "At what price does it feel expensive, but you'd still consider it?"
4. **A bargain:** "At what price does it feel like a great deal?"

The sweet spot sits between answers 2 and 3. Add these questions to the interview guide or run them as a short standalone survey.

### Agent Rules for Monetisation

- Ground pricing in evidence. Competitor pricing, interview data, or Van Westendorp results.
- Flag unrealistic revenue projections. If the user expects $1M ARR with 10 users, say so.
- Consider the B2B vs B2C distinction. B2B can charge more but sells slower. B2C needs volume.

**Update `progress.md`:** Mark Phase 7 complete.

---

## Phase 8: Legal Review → `08-legal-review.md`

**Act as a legal expert with 30 years of experience in the digital space.** Review the product concept for legal risks and regulatory issues.

### What to Cover

- **Data privacy:** GDPR, CCPA, and any region-specific data protection laws. Does the product collect personal data? How is it stored? Who has access?
- **Terms of service:** What terms does the product need? What liability disclaimers?
- **Intellectual property:** Any patent, trademark, or copyright risks? Is the product too close to an existing patented solution?
- **Industry-specific regulation:** Healthcare (HIPAA), finance (PCI-DSS, FCA), education (FERPA, COPPA), food/drink (FDA), etc.
- **Consumer protection:** Advertising standards, auto-renewal laws, refund policies.
- **Content liability:** User-generated content risks, moderation requirements, DMCA.
- **Accessibility:** ADA, WCAG, EAA (European Accessibility Act) compliance requirements.

### Output Format

| Risk Area | Issue | Severity (High/Med/Low) | Action Required |
|---|---|---|---|
| [area] | [specific issue] | [severity] | [what to do about it] |

### Agent Rules for Legal Review

- **Be thorough.** Cover every relevant area. Do not skip risks because they seem unlikely.
- **Be specific.** Name the law or regulation. Provide jurisdiction where it applies.
- **Include a disclaimer:** "This is not legal advice. Consult a qualified lawyer before making legal decisions."
- **Flag deal-breakers.** If a legal requirement makes the product unviable in its current form, say so.

**Update `progress.md`:** Mark Phase 8 complete.

---

## Phase 9: Feature Plans → `09-feature-plans.md`

Create a high-level feature breakdown for the product. This bridges validation into building.

### What to Cover

- **Core features:** The minimum set of features needed for the product to deliver value. Map each feature back to the problem statement and opportunity.
- **Nice-to-have features:** Features that add value but are not essential for launch.
- **Feature priority:** Rank features by impact on the validated problem.

### Output Format

| Priority | Feature | Solves | Effort (S/M/L) | Notes |
|---|---|---|---|---|
| 1 | [feature name] | [which part of the problem] | [size] | [dependencies, risks] |

### Integration with `/feature`

If the `/feature` skill is available, use it to create detailed plans for each core feature. Create a separate `/feature` session for each one.

If `/feature` is not available, ask the user: "Would you like me to install the `/feature` skill so I can create detailed plans for each feature?"

**Update `progress.md`:** Mark Phase 9 complete.

---

## Critical Rules

1. **Ask one question at a time.** Never dump all questions on the user.
2. **Push back on weak evidence.** Opinions are not validation.
3. **Do the research.** Phases 2, 5, and 8 are agent-driven. Do not ask the user to do them.
4. **Cite everything.** No unsourced claims in any file.
5. **Be a skeptic, not a cheerleader.** Your job is to stress-test the idea.
6. **Kill bad ideas early.** A "No-Go" recommendation is a valid and valuable outcome.
7. **Short sentences.** Keep all written output under 20 words per sentence where possible.
8. **Plain English.** Target 6th–8th grade reading level. No jargon without explanation.
9. **Update progress.md after every phase.** The user (and future agents) must be able to see what's done.
10. **One file per phase.** Do not combine phases into a single file.
11. **Flat `startup/` only.** Never create `startup/<anything>/` nested folders. Every output file sits directly in `startup/`.

## Writing Standards

All output must follow these readability targets:

| Metric | Purpose | Target |
|---|---|---|
| Flesch-Kincaid Grade Level | Measures word and sentence length | 6th–8th Grade |
| Flesch Reading Ease | Scores text from 1–100 | 60–70 (Plain English) |
| Sentence Length | Prevents "wall of text" fatigue | 15–20 words max per sentence |

## Resuming After Context Loss

1. Read `startup/progress.md` first — it tells you where you are.
2. Read `startup/findings.md` — it tells you what you've learned.
3. Read the most recent numbered file to pick up context.
4. If unsure, ask the user: "Where did we leave off?"

## When to Use

**Use for:** Early-stage ideas — testing whether a problem space exists and whether the venture is worth pursuing before building anything.

**Skip for:** Features within an existing product (use `/feature` instead), technical questions, or quick lookups.
