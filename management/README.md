# Managing AI agents: Structure, Guardrails, Skills

Three layers of AI agent management. Most people building with AI use zero of them.

Without these layers, you give the agent a problem and hope it reads your mind. Sometimes it does. Often it produces something plausible that is not quite right, and the further it gets from your intent without correction, the harder it is to pull back.

With all three in place, the quality of what the agent produces stops being a surprise. It becomes predictable. That predictability is what lets you actually ship.

This folder is a set of worked examples for each layer, built around a small SaaS todo list app. Read them, then copy the shape for your own project.

## The three layers

### [Structure](structure.md)

The document you write before the first line of code. A context file covering mission, principles, tech stack, and constraints. A PRD for each feature. The agent reads these and builds to your intent rather than its best guess.

See a filled context file and a filled feature PRD in [structure.md](structure.md).

### [Guardrails](guardrails.md)

Constraints that prevent drift. Rules that tell the agent what is out of scope, what not to add, and what to check before touching code that already works. AI does not drift because it is bad. It drifts because no one told it what staying on course looks like.

See a filled `AGENTS.md` you can adapt in [guardrails.md](guardrails.md).

### [Skills](skills.md)

Targeted prompts for specific types of work. A skill for planning a feature. A skill for reviewing quality. A skill for writing a spec. They prime the agent before it starts, the way a brief primes a team before a project kicks off.

See the skills built here plus recommended tools for designers in [skills.md](skills.md).

## Where to start

1. Read [structure.md](structure.md) and write your own `docs/context.md`.
2. Read [guardrails.md](guardrails.md) and add an `AGENTS.md` to your repo.
3. Read [skills.md](skills.md) and install `/context` and `/feature`.

Start small. One context file and a short guardrails file already change how the agent works. Add the rest as the project grows.
