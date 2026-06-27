# Skills

Skills are targeted prompts for a specific type of work. A skill for planning a feature. A skill for reviewing quality. A skill for writing a spec. They prime the agent before it starts, the way a brief primes a team before a project kicks off.

You install a skill once and call it by name with a slash, like `/feature`. Plugins work the same way: set them up once, then the agent uses them when the task calls for it.

This page lists the ones worth your time as a designer. They are split into three groups:

1. **Built in this repo.** Skills you can install right now.
2. **Recommended skills and plugins.** Community skills with strong reviews, picked for designers.
3. **Copy-paste prompts.** Short prompts for design reviews that do not need a plugin.

---

## 1. Built in this repo

### /context

Builds your product context file. It asks you eight plain questions, one at a time, then writes `docs/context.md`. This is the Data layer — see [data/software.md](data/software.md) for a filled example. Best run once at the start of a project.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-skill && bash /tmp/cursor-skill/context/install.sh && rm -rf /tmp/cursor-skill
```

Full docs: [context/README.md](../context/README.md)

### /feature

Turns a feature idea into a clear plan. It asks questions first, then writes the planning files. Use it before you ask the agent to build anything non-trivial. This covers planning a feature and writing a spec.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-feature-skill && bash /tmp/cursor-feature-skill/feature/install.sh && rm -rf /tmp/cursor-feature-skill
```

Full docs: [feature/README.md](../feature/README.md)

### /arch-flow

Writes architecture notes with simple diagrams and plain language instead of raw code. Useful when you want to see how the pieces fit before building. Optionally creates an editable FigJam diagram when you ask and the Figma plugin is enabled.

```bash
git clone --depth 1 https://github.com/hferello/ai.git /tmp/cursor-arch-flow && bash /tmp/cursor-arch-flow/arch-flow/install.sh && rm -rf /tmp/cursor-arch-flow
```

Full docs: [arch-flow/README.md](../arch-flow/README.md)

---

## 2. Recommended skills and plugins

Skills the wider community rates highly, picked for designers. You set each one up once.

### designer-skills

A community collection of agentic skills made for designers, with 97 skills and 30 commands across nine plugins. It covers the whole flow: research, design systems, UI, interaction, and delivery. This is the closest match to how a designer actually works, rather than a developer tool bent to fit.

Built for Claude Code and Gemini CLI. In Claude Code, add the marketplace, then type `/plugin` and pick the collections you want from the Discover tab:

```text
/plugin marketplace add Owl-Listener/designer-skills
```

For most designers, start with `design-research`, `ux-strategy`, `ui-design`, and `design-ops`.

Source: [github.com/Owl-Listener/designer-skills](https://github.com/Owl-Listener/designer-skills)

### UI UX Pro Max

A skill that gives the agent real design intelligence for building professional UI and UX across platforms. Reach for it when you want output that looks considered, not generic.

Install in your terminal, then call it in chat:

```bash
sudo npm install -g uipro-cli
uipro init --ai cursor
```

```text
/ui-ux-pro-max Build a landing page for my SaaS product
```

Source: [github.com/nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)

### Superpowers

Makes the agent think before it codes. It asks questions, offers a few approaches, then breaks the work into small tasks. Great for the brief and planning stage.

Install in Cursor's agent chat:

```text
/add-plugin superpowers
```

Source: [github.com/obra/superpowers](https://github.com/obra/superpowers)

### agent-skills

A large, well-kept set of production-grade engineering skills for AI agents, maintained by Addy Osmani. Useful to pull from as your project grows past the design stage.

In Cursor, copy any `SKILL.md` from the repo into your `.cursor/rules/` folder. In Claude Code, use the marketplace:

```text
/plugin marketplace add addyosmani/agent-skills
/plugin install agent-skills@addy-agent-skills
```

Source: [github.com/addyosmani/agent-skills](https://github.com/addyosmani/agent-skills)

### andrej-karpathy-skills

A set of guidelines that improve how the agent behaves, based on Andrej Karpathy's notes on where AI models go wrong when coding. A quick win for steadier, more predictable output.

It ships a ready-made Cursor rule. Copy `.cursor/rules/karpathy-guidelines.mdc` from the repo into your own project's `.cursor/rules/` folder.

Source: [github.com/multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills)

### ponytail

Makes the agent think like a lazy senior developer, where the best code is the code you never wrote. It pushes back on over-building and keeps things simple, which is exactly what you want when shipping.

In Cursor, copy the rule from the repo's `.cursor/rules/` folder into your project. In Claude Code, use the marketplace:

```text
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

Source: [github.com/DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail)

### Cursor cookbook

Official examples from the Cursor team: hooks, cloud agents, and SDK projects. This is a reference repo, not a skill to install. Browse it and copy the pieces you need when you want to see the intended way to do something.

Source: [github.com/cursor/cookbook](https://github.com/cursor/cookbook)

### awesome-nanobanana-pro

A big, curated list of prompts for Nano Banana Pro image generation. This is a prompt library, not a skill to install. Browse it and copy the prompts you need for assets or mockup imagery.

Source: [github.com/ZeroLu/awesome-nanobanana-pro](https://github.com/ZeroLu/awesome-nanobanana-pro)

---

## 3. Copy-paste prompts

Some design reviews do not need a plugin. Paste these into the agent when you need them. Tweak the wording to match your project.

### Review UI quality

```text
Review this screen for visual quality. Check spacing against one scale,
type hierarchy, alignment, and consistent use of color and components.
List what is off, why it matters, and the smallest fix for each. Do not
change any code yet.
```

### Accessibility check

```text
Check this page for accessibility against WCAG 2.2 AA. Look at color
contrast, alt text, form labels, focus order, and keyboard access. For
each issue, tell me the rule it breaks and the fix. Do not change code yet.
```

### Responsive check

```text
Check how this page behaves at 375px, 768px, and 1280px wide. Point out
any overflow, broken layout, tap targets that are too small, or text that
gets cut off. List the issues by breakpoint with a fix for each.
```

### Copy review

```text
Review the text on this screen. Make it clear, short, and consistent.
Flag jargon, vague labels, and buttons that do not say what they do.
Suggest a better version for each, and keep the tone calm and plain.
```

---

## How to choose

- Starting a project? Run `/context`.
- Planning a feature? Run `/feature` or use Superpowers.
- Want steadier behaviour from the agent? Add ponytail or the Karpathy skills.
- Designing UI? Use UI UX Pro Max or the designer-skills collection.
- Reviewing the result? Use the copy-paste prompts below.

You do not need all of these on day one. Add them as the work calls for them.
