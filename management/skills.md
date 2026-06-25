# Skills

Skills are targeted prompts for a specific type of work. A skill for planning a feature. A skill for reviewing quality. A skill for writing a spec. They prime the agent before it starts, the way a brief primes a team before a project kicks off.

You install a skill once and call it by name with a slash, like `/feature`. Plugins and MCP servers work the same way: set them up once, then the agent uses them when the task calls for it.

This page lists the ones worth your time as a designer. They are split into three groups:

1. **Built in this repo.** Skills you can install right now.
2. **Recommended skills and plugins.** Popular, well-regarded tools from the wider community.
3. **Copy-paste prompts.** Short prompts for design reviews that do not need a plugin.

---

## 1. Built in this repo

### /context

Builds your product context file. It asks you eight plain questions, one at a time, then writes `docs/context.md`. This is the Structure layer from [structure.md](structure.md). Best run once at the start of a project.

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

### /architecture-flow

Writes architecture notes with simple diagrams and plain language instead of raw code. Useful when you want to see how the pieces fit before building.

Full docs: [arch-flow/README.md](../arch-flow/README.md)

---

## 2. Recommended skills and plugins

These are made by other teams and have strong reviews from designers and developers. Each one is set up once.

### Superpowers (planning and brainstorming)

A popular plugin that makes the agent think before it codes. Describe an idea and it asks clarifying questions, offers a few approaches, then breaks the work into small tasks. Great for the "brief" stage and for planning.

Install in Cursor's agent chat:

```text
/add-plugin superpowers
```

Source: [github.com/obra/superpowers](https://github.com/obra/superpowers)

### Figma MCP (design to code)

Figma's official server. It lets the agent read your Figma file directly, so it builds from real components, variables, and layout instead of guessing from a screenshot. This is the best path from a design to faithful code.

Install in Cursor's agent chat:

```text
/add-plugin figma
```

More: [Figma MCP server guide](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server)

### shadcn MCP (build and refine UI)

The official server from shadcn/ui. The agent can browse and install real components from the registry with plain language, like "add a dialog and a card". Keeps your UI consistent and saves you wiring components by hand.

Set up in your project terminal:

```bash
npx shadcn@latest mcp init --client cursor
```

More: [ui.shadcn.com/docs/mcp](https://ui.shadcn.com/docs/mcp)

### axe MCP (accessibility audits)

Deque's official accessibility server. The agent scans a page against WCAG and gets code-level fixes. Deque is the team behind the axe engine that most accessibility tools are built on. Note: this one needs a paid Axe DevTools subscription.

Source: [github.com/dequelabs/axe-mcp-server-public](https://github.com/dequelabs/axe-mcp-server-public)

Free alternative built on the same axe-core engine: [github.com/Duds/accessibility-mcp](https://github.com/Duds/accessibility-mcp)

### Chrome DevTools MCP (responsive and performance checks)

Google's official server. It lets the agent open your page in a real Chrome browser, resize it, and inspect layout and performance. Use it to check how a design holds up across screen sizes and to catch slow pages.

Add this to your MCP config:

```json
{
  "mcpServers": {
    "chrome-devtools": {
      "command": "npx",
      "args": ["chrome-devtools-mcp@latest"]
    }
  }
}
```

Source: [github.com/ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp)

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
- Building from a design? Use the Figma MCP.
- Building UI? Use the shadcn MCP.
- Reviewing the result? Use the copy-paste prompts, plus axe MCP and Chrome DevTools MCP for the deeper checks.

You do not need all of these on day one. Add them as the work calls for them.
