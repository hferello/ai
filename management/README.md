# Managing AI agents: Data, Guardrails, Skills

Data. Guardrails. Skills. Skip them and you are not using AI, you are hoping.

Give the agent a problem without them and it fills the gaps itself, with assumptions you never see. Sometimes it guesses right. Often it produces something plausible that is not quite right, and the further it drifts from your intent without correction, the harder it becomes to pull back.

Once you have all three in place, the quality of what the agent produces stops being a surprise. It becomes predictable. That predictability is what lets you actually ship.

This folder is a set of worked examples for each layer. Read them, then copy the shape for your own project.

## The three layers

### [Data](data.md)

The information you give the agent so it understands what you are trying to achieve. Mission, principles, constraints, what you are making and what you are not. A context file for the project. A brief for each piece of work. Give it enough and the agent builds to your intent rather than its best guess.

See worked examples by domain — generic, software, business, everyday, resume — in [data.md](data.md).

### [Guardrails](guardrails.md)

Constraints that prevent drift. Rules that tell the agent what is out of scope, what not to add, and what to check before touching existing logic. AI does not drift because it is bad. It drifts because you never told it what staying on course looks like.

See a filled `AGENTS.md` you can adapt in [guardrails.md](guardrails.md).

### [Skills](skills.md)

Targeted prompts for specific types of work. A skill for planning a feature. A skill for reviewing code quality. A skill for writing a spec. They prime the agent before it starts, the way a brief primes a team before a project kicks off.

See the skills built here plus recommended tools for designers in [skills.md](skills.md).

## Where to start

1. Read [data.md](data.md) and write your own `docs/context.md`.
2. Read [guardrails.md](guardrails.md) and add an `AGENTS.md` to your repo.
3. Read [skills.md](skills.md) and install `/context` and `/feature`.

Start small. One context file and a short guardrails file already change how the agent works. Add the rest as the project grows.
