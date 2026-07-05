# Role Landing Page Prompt

> A Cursor Agent prompt for building a focused landing page at `halferello.com/[slug]` tailored to a specific role or opportunity. The page shares the existing design system but lives outside the main nav — you send the URL directly to prospects or hiring managers.

---

## How to use it

1. Fill in every `[VARIABLE]` in the **Variables** section below.
2. Copy the completed prompt block and paste it into Cursor Agent chat.
3. The agent will build two files: `src/pages/[slug].astro` and, if not already present, `src/components/cards/Cards.ProjectHorizontal.astro`.
4. Run `npm run build` to verify no errors before publishing.

Re-run the prompt for every new role. Tailoring beats reuse.

---

## Variables to fill in

| Variable | What to put here |
|---|---|
| `[ROLE]` | The role label shown on the page, e.g. `Design Consultant`, `Web Designer`, `Design Lead` |
| `[SLUG]` | URL path, kebab-case, e.g. `consultant`, `web-designer`, `design-lead` |
| `[HEADLINE]` | 1–2 sentence positioning statement written for this specific role |
| `[SKILLS]` | 5–8 comma-separated skills most relevant to the role |
| `[PHOTO]` | `/images/photo-of-hal-2.jpg` (portrait, outdoors) or `/images/hal-presentating.jpg` (presenting to a team) |
| `[CV_URL]` | Path to the CV file, e.g. `/hal-ferello-cv.pdf` (place file in `public/`) |
| `[PROJECT_1_ID]` | `id` field from `src/data/work-projects.ts`, e.g. `atlassian-x-teams` |
| `[PROJECT_1_STAT_A]` | First stat label, e.g. `Completion rate` |
| `[PROJECT_1_STAT_A_VALUE]` | First stat value, e.g. `+140%` |
| `[PROJECT_1_STAT_B]` | Second stat label, e.g. `Annual revenue growth` |
| `[PROJECT_1_STAT_B_VALUE]` | Second stat value, e.g. `$16M` |
| `[PROJECT_2_ID]` | Same pattern — second project |
| `[PROJECT_2_STAT_A]` | … |
| `[PROJECT_2_STAT_A_VALUE]` | … |
| `[PROJECT_2_STAT_B]` | … |
| `[PROJECT_2_STAT_B_VALUE]` | … |
| `[PROJECT_3_ID]` | Same pattern — third project |
| `[PROJECT_3_STAT_A]` | … |
| `[PROJECT_3_STAT_A_VALUE]` | … |
| `[PROJECT_3_STAT_B]` | … |
| `[PROJECT_3_STAT_B_VALUE]` | … |
| `[ABOUT_PROFESSIONAL]` | 2–3 sentences: years of experience, key clients/companies, type of impact |
| `[ABOUT_PERSONAL]` | 2–3 sentences: interests, personality, what makes you human beyond the work |
| `[EXP_N_ROLE]` | Job title for experience entry N (max 5 entries total) — pick roles most relevant to [ROLE], not necessarily the 5 most recent |
| `[EXP_N_COMPANY]` | Company name for entry N |
| `[EXP_N_DATES]` | Date range for entry N, e.g. `Jun 2022 – Mar 2023` |
| `[EXP_N_LOGO]` | Path to company logo for entry N, e.g. `/clients/huemor.svg` — place SVG/PNG in `public/clients/`. Rendered monochrome (same filter as client grid). |
| `[EXP_N_BULLETS]` | 3–5 bullet points for entry N — select bullets that are most relevant to [ROLE]. Copy verbatim from CV. **Minimum 3. Do not invent.** |

---

## Project quick-reference (pick 3 that best match the role)

| Project ID | Company | Best for |
|---|---|---|
| `atlassian-x-teams` | Atlassian × Microsoft Teams | Product, growth, enterprise, B2B SaaS |
| `atlassian-growth` | Atlassian Growth | Growth, experimentation, data-driven roles |
| `atlassian-exco` | Atlassian ExCo | Collaboration tools, strategy, leadership |
| `reejig-ai` | Reejig AI | AI products, 0→1 launches, design leadership |
| `tfl` | Transport for London | Public sector, service design, scale |
| `sky-q` | Sky Q | Consumer products, design systems, TV/media |
| `play-hopper` | Play Hopper | Marketplaces, solo builds, AI-assisted work |
| `dublcheck` | Dublcheck | Cybersecurity, AI, product thinking |
| `when-and-where` | When & Where | Travel, consumer, brand + product combo |

**Stats to pull from:**

- `atlassian-x-teams`: +140% completion rate · $16M annual revenue growth · 300K new MAU in 6 months
- `atlassian-growth`: +550% expand rate · 50K MAU from a single experiment · 29% PEU increase
- `atlassian-exco`: +25% sharing across Confluence · Led across 4 international teams
- `reejig-ai`: 0→1 launch · ARR doubled in 6 months · Design system built from scratch
- `tfl`: 1bn+ journeys impacted · Live prototype trialled at multiple London stations
- `sky-q`: System designed to last a decade · Delivered across TV, web, mobile, iPad
- `play-hopper`: Live v1.0.6 · 50+ releases · Solo build with AI

---

## The prompt

```
Build a role-specific landing page for halferello.com. This is a static page I send directly to prospects and hiring managers — it is NOT linked from the main nav.

================================================================
ROLE AND PAGE DETAILS
================================================================

Role label:            [ROLE]
URL slug:              /[SLUG]     →  src/pages/[SLUG].astro
Page title (meta):     [ROLE] — Hal Ferello
Page description:      (write a concise meta description ~155 chars based on the role and skills below)
Photo:                 [PHOTO]

Positioning headline:
[HEADLINE]

Skills (rendered as tags):
[SKILLS]

================================================================
PROJECTS (3 horizontal cards, image-left layout)
================================================================

Project 1:
  id:      [PROJECT_1_ID]
  stat a:  [PROJECT_1_STAT_A] — [PROJECT_1_STAT_A_VALUE]
  stat b:  [PROJECT_1_STAT_B] — [PROJECT_1_STAT_B_VALUE]

Project 2:
  id:      [PROJECT_2_ID]
  stat a:  [PROJECT_2_STAT_A] — [PROJECT_2_STAT_A_VALUE]
  stat b:  [PROJECT_2_STAT_B] — [PROJECT_2_STAT_B_VALUE]

Project 3:
  id:      [PROJECT_3_ID]
  stat a:  [PROJECT_3_STAT_A] — [PROJECT_3_STAT_A_VALUE]
  stat b:  [PROJECT_3_STAT_B] — [PROJECT_3_STAT_B_VALUE]

================================================================
EXPERIENCE (vertical timeline, most recent first)
================================================================

List your 5 most relevant roles for this specific [ROLE] (most recent first — maximum 5).
Do NOT default to chronological history — pick the roles whose responsibilities and
achievements best support the case you're making for this particular role.
Bullet points must also be chosen with the role in mind: highlight what a
[ROLE] hiring manager or client cares about most. Copy bullets verbatim from
your CV; do NOT invent, paraphrase, or reorder them outside of selection.

Entry 1:
  Role:     [EXP_1_ROLE]
  Company:  [EXP_1_COMPANY]
  Dates:    [EXP_1_DATES]
  Logo:     [EXP_1_LOGO]   ← path to company logo, e.g. /clients/huemor.svg (place in public/clients/)
  Bullets:
    - [EXP_1_BULLET_1]
    - [EXP_1_BULLET_2]
    - [EXP_1_BULLET_3]
    - [EXP_1_BULLET_4]   ← optional, delete if unused
    - [EXP_1_BULLET_5]   ← optional, delete if unused

Entry 2:
  Role:     [EXP_2_ROLE]
  Company:  [EXP_2_COMPANY]
  Dates:    [EXP_2_DATES]
  Logo:     [EXP_2_LOGO]
  Bullets:
    - [EXP_2_BULLET_1]
    - [EXP_2_BULLET_2]
    - [EXP_2_BULLET_3]
    - [EXP_2_BULLET_4]   ← optional
    - [EXP_2_BULLET_5]   ← optional

Entry 3:
  Role:     [EXP_3_ROLE]
  Company:  [EXP_3_COMPANY]
  Dates:    [EXP_3_DATES]
  Logo:     [EXP_3_LOGO]
  Bullets:
    - [EXP_3_BULLET_1]
    - [EXP_3_BULLET_2]
    - [EXP_3_BULLET_3]
    - [EXP_3_BULLET_4]   ← optional
    - [EXP_3_BULLET_5]   ← optional

Entry 4:
  Role:     [EXP_4_ROLE]
  Company:  [EXP_4_COMPANY]
  Dates:    [EXP_4_DATES]
  Logo:     [EXP_4_LOGO]
  Bullets:
    - [EXP_4_BULLET_1]
    - [EXP_4_BULLET_2]
    - [EXP_4_BULLET_3]
    - [EXP_4_BULLET_4]   ← optional
    - [EXP_4_BULLET_5]   ← optional

Entry 5:
  Role:     [EXP_5_ROLE]
  Company:  [EXP_5_COMPANY]
  Dates:    [EXP_5_DATES]
  Logo:     [EXP_5_LOGO]
  Bullets:
    - [EXP_5_BULLET_1]
    - [EXP_5_BULLET_2]
    - [EXP_5_BULLET_3]
    - [EXP_5_BULLET_4]   ← optional
    - [EXP_5_BULLET_5]   ← optional

================================================================
ABOUT ME (2-column section)
================================================================

Professional (text left, photo right):
[ABOUT_PROFESSIONAL]

Personal (same section, below professional):
[ABOUT_PERSONAL]

Social links to include: LinkedIn, Medium, GitHub

================================================================
CODEBASE CONTEXT
================================================================

Stack: Astro 6 static site, Tailwind CSS v4, TypeScript in frontmatter only.
Layout: src/layouts/BaseLayout.astro — wrap everything in this.
Design tokens: defined in src/styles/global.css under @theme.
  Colors: bg-bg, bg-surface, bg-surface-hover, text-primary, text-secondary,
          text-accent, text-muted, border-border, border-border-subtle
  Radius: rounded-default (16px)
  Fonts: font-body (neue-haas-grotesk-text), font-heading (neue-haas-grotesk-display)
  Never use raw hex or magic spacing values — Tailwind token utilities only.

Existing components to reuse (do NOT recreate them):
- src/components/ui/FadeIn.astro             — scroll-reveal wrapper
- src/components/buttons/PrimaryButton.astro — primary CTA button
- src/components/buttons/GhostButton.astro   — bordered ghost button (props: href, size, download, ariaLabel)
- src/components/EmailLink.astro             — obfuscated mailto link (props: name, ariaLabel, class)
- src/components/TablerIcon.astro            — icon component
- src/components/ui/Tag.astro                — tag pill
- src/components/ui/Label.astro              — uppercase eyebrow label
- src/components/ui/containers/SiteWidth.astro — max-w-7xl px-6 wrapper
- src/components/home/Home.Clients.astro     — client logo grid (12 logos, monochrome, tooltip on hover)

Project thumbnail images are auto-resolved from:
  src/pages/projects/[id]/assets/thumbnail.*
Use the same import.meta.glob pattern as src/components/cards/Cards.Project.astro.

================================================================
PAGE STRUCTURE TO BUILD
================================================================

--- SECTION 1: HERO ---
Layout: two columns on desktop (md:grid-cols-2), stacked on mobile.
Left column:
  - Label.astro showing the role label
  - h1: "Hal Ferello"
  - Positioning headline (2 sentences, text-secondary, leading-loose)
  - Skills: flex-wrap row of Tag components, one per skill
  - Button row (flex, gap-3, flex-wrap):
    - EmailLink (src/components/EmailLink.astro) name="hal" → "Let's talk"
      with TablerIcon name="mail" — style identically to PrimaryButton size="lg":
      class="inline-flex items-center gap-2 rounded-lg bg-accent px-8 py-3.5
             text-xl font-medium text-white cursor-pointer scale-up-on-hover
             hover:opacity-90 w-full md:w-auto justify-center md:justify-start"
    - Ghost download button: GhostButton (src/components/buttons/GhostButton.astro)
      href="[CV_URL]" size="lg" download={true} → "Download CV"
      with TablerIcon name="download"Right column:
  - Photo image, full height, object-cover, rounded-default
  - Use the photo path provided above

--- SECTION 2: CLIENTS ---
Directly include <Home.Clients /> with no modifications.
This provides immediate social proof after the hero.

--- SECTION 3: SELECTED WORK ---
Heading: "Selected work"
Create or reuse src/components/cards/Cards.ProjectHorizontal.astro:
  - Interface: ConsultantProject extends ProjectCard (from Cards.Project.astro)
    with stats?: { label: string; value: string }[]
  - Layout per card: flex flex-col md:flex-row, rounded-default, bg-surface,
    border border-border, hover:-translate-y-0.5, hover:shadow-lg
  - Image side: md:w-3/5, aspect-video, object-cover, rounded-l-default
    on desktop / rounded-t-default on mobile
  - Content side: md:w-2/5, p-8, flex-col, gap-4
    - Company name (text-muted, text-sm)
    - Title (text-2xl font-bold text-primary)
    - Stats row: each stat as label (text-secondary text-sm) + value
      (text-accent font-bold text-2xl) — display stats in a flex row with gap
    - "Read case study →" link (text-accent, underline on hover)
  - If Cards.ProjectHorizontal.astro already exists, reuse it without changes.
Render three ConsultantProject cards using the projects and stats above.
Resolve thumbnails the same way Cards.Project.astro does (import.meta.glob).

--- SECTION 4: EXPERIENCE ---
Heading: "Experience"
Layout: full-width vertical list inside SiteWidth.
Each entry is a <li> inside a <ul role="list">, separated by a
border-b border-border-subtle divider (last entry has no border).

Per entry layout (desktop: flex flex-row justify-between items-start,
mobile: flex-col), py-8 top/bottom padding per entry:
  Far left — logo column (shrink-0, w-12, mr-6):
    - <img src={logo} alt={company} /> — w-10 h-10 object-contain
    - Apply the same monochrome filter as Home.Clients.astro:
        dark mode: brightness(0) saturate(100%) invert(1)
        light mode: brightness(0) saturate(100%)
      Wrap in a <div class="logo-mono"> and use a <style> block scoped to this
      section (same pattern as the client logo grid).
  Middle — text block (flex-1):
    - Role title: text-2xl font-heading text-primary with a trailing
      <span class="text-accent">.</span> (matches the site's heading style)
    - Company: text-sm uppercase tracking-widest text-muted (below title, mt-1)
  Right side (desktop: text-right shrink-0 ml-8, mobile: hidden on mobile,
  show date below company instead):
    - Date range: text-sm text-muted

Below the title/date row (full width, mt-4):
  - <ul class="list-disc pl-5 space-y-1"> of 3–5 bullet points
    Each <li class="text-secondary"> is one concise achievement or responsibility.

No card backgrounds — entries sit directly on bg-bg with only the divider line.
Wrap each entry in FadeIn.astro for scroll reveal.

Render the 5 experience entries from the EXPERIENCE data block above.
These have been pre-selected to be most relevant to the [ROLE] — render them
exactly as provided, in the order given.
After the last entry, render a "View full experience on LinkedIn" link:
  <a href="https://www.linkedin.com/in/halferello/details/experience/"
     target="_blank" rel="noopener noreferrer"
     class="inline-flex items-center gap-2 text-accent hover:underline mt-8">
    <TablerIcon name="brand-linkedin" class="w-4 h-4" />
    View full experience on LinkedIn
  </a>

--- SECTION 5: ABOUT ME ---
Heading: "About me"
Layout: md:grid-cols-2, gap-16, same pattern as src/pages/about.astro.
Left column:
  - Professional paragraph
  - Personal paragraph
  - Social links row: PrimaryButton links to LinkedIn, Medium, GitHub
    using TablerIcon (brand-linkedin, brand-medium, brand-github)
Right column:
  - Image src="/images/hal-presentating.jpg", rounded-default, object-cover

================================================================
CONSTRAINTS (non-negotiable)
================================================================

- No new hardcoded hex colors or magic spacing — Tailwind token utilities only.
- No SSR adapters, server endpoints, or Node runtime APIs.
- Zero client JS unless strictly necessary (FadeIn uses IntersectionObserver,
  that's fine — it's already in the component).
- All new markup must work in both dark (default) and light (prefers-color-scheme)
  modes using the existing token system.
- Semantic HTML: use section, h1, h2, h3, figure, ul/li where appropriate.
- Every image needs an alt attribute.
- Run ReadLints on both new files after writing them and fix any errors.
- Run `npm run build` mentally — do not emit patterns that break Astro's
  static build (no dynamic imports outside of import.meta.glob, no top-level await).

================================================================
OUTPUT
================================================================

1. src/pages/[SLUG].astro — the full page
2. src/components/cards/Cards.ProjectHorizontal.astro — the horizontal card
   component (skip if it already exists)

No other files. No changes to nav, BaseLayout, global.css, or existing components.
```

---

## Pre-filled example — Design Consultant

Copy this block to use immediately for the `design-consultant` or `consultant` role:

```
Role label:            Design Consultant
URL slug:              /consultant
Photo:                 /images/photo-of-hal-2.jpg
CV:                    /hal-ferello-cv.pdf

Positioning headline:
I help companies figure out the real problem — then design the experience, build the
system, and grow the team to solve it. 15 years. $100M+ in measurable impact.

Skills:
Design strategy, Experience design, Design systems, Product design, Team leadership, AI-augmented design

Project 1:
  id:      atlassian-x-teams
  stat a:  Completion rate  — +140%
  stat b:  Annual revenue   — $16M

Project 2:
  id:      reejig-ai
  stat a:  Time to launch   — 0→1 in 6 months
  stat b:  ARR impact       — Doubled

Project 3:
  id:      tfl
  stat a:  Journeys impacted — 1bn+
  stat b:  Deployment        — London-wide

About — professional:
I help companies figure out the real problem, then design the experience, build the
system, and grow the team to solve it. Clients include Atlassian, Sky, Transport for
London, Reejig, and Lloyds Bank. $100M+ in measurable business impact across
15+ years. I still push pixels, but the work that matters most is usually invisible:
reframing the brief, setting a quality bar that holds after I leave, growing the
designers who carry it forward.

About — personal:
Metaphysics, philosophy, photography, long walks where the natural world does most
of the talking. I sell landscape photographs through Getty Images and Adobe Stock.
An avid traveller — 20+ countries and still curious about the next one. Vegetarian
for 15 years and still the person asking what's actually in the side dish.
```

---

## Notes

- **One page per role.** Reuse the prompt but swap the variables. A `/design-lead` and a `/consultant` page can coexist — they just get different headlines, skills, and project selections.
- **Experience must be role-relevant, not chronological.** For each new role page, re-select which 5 experience entries to show and which bullets to include. A consultant page should foreground strategy and client impact. A design engineer page should foreground systems, code, and delivery. The same CV, curated differently — that's the point.
- **Stats must be real.** Do not use numbers you can't back up in a conversation. Every stat above comes directly from the project case studies on the site.
- **Don't add the page to the nav.** This is a direct-link page. The main nav links are: Projects, Design, AI, About. Keep it that way unless you decide to make this a permanent portfolio hub.
- **OG image.** After the page is live, add a screenshot as `/public/images/[slug]-og.jpg` and reference it in `BaseLayout`'s `ogImage` prop for clean social previews.
