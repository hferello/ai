# Data

Data is the information you give the agent so it understands what you are trying to achieve. The mission, the principles, the constraints, what you are making and what you are not.

That cannot live in a chat window. It has to be structured into files the agent can read. Give it enough and the agent works to your intent rather than its best guess.

## The two parts

1. **A context file** for the whole project. Mission, principles, standards, constraints. You write this once.
2. **A brief** for each piece of work. One short doc per deliverable, written just before the agent starts.

The shape is the same in every domain. What changes is the vocabulary — a software team says "feature" and "PRD"; a marketing team says "campaign" and "brief"; someone planning a trip says "must-dos" and "itinerary". Pick the example closest to your work and copy the structure, not the labels.

## Worked examples

Each file below includes a filled **context file** and a filled **work brief** for one deliverable.

| Domain | Example | File |
| ------ | ------- | ---- |
| Generic (marketing, content, creative) | Harbor & Honey — summer product launch | [data/generic.md](data/generic.md) |
| Software | TidyList — shared todo lists for small teams | [data/software.md](data/software.md) |
| Business (strategy, ops, consulting) | Ridgewell Partners — client onboarding improvement | [data/business.md](data/business.md) |
| Everyday (personal, home, life admin) | Okonkwo family — two-week Portugal trip | [data/everyday.md](data/everyday.md) |
| Resume writing (job search) | Marcus Chen — tailored resume for one role | [data/resume.md](data/resume.md) |

---

## How to use this

1. Open the example closest to your domain.
2. Write your own context file first — once, for the whole project. A stable path like `docs/context.md` works well.
3. For each deliverable, write a short brief before the agent starts.
4. Point the agent at the right file: `@briefs/launch-email.md write the launch email from this brief`.

Keep both files short. A page each is plenty. The goal is shared intent, not a contract.

For software projects, skills like `/context` and `/feature` in [skills.md](skills.md) can help you produce these files by asking questions first. The Data layer is the same idea no matter what you are making.
