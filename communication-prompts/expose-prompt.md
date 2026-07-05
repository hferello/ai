# EXPOSE — the 30-second product clarity test

The lead magnet for Post 14 ("Cheap building doesn't hide weak thinking. It exposes it.").
When someone comments **EXPOSE**, DM them the prompt block below. They paste it into
ChatGPT, Claude, or Cursor, describe their product, and get an honest verdict on whether
it has a point of view or is about to blend into everything around it.

The test maps to the three questions in the post:

- **Style** — can you say its point of view in one sentence?
- **Coherence** — does that point of view hold on every screen?
- **Problem** — who is it for, and what breaks for them if it never exists?

---

## The prompt (copy everything below)

```
You are a sharp, experienced product designer. Your job is to tell me, honestly,
whether the thing I'm building has a point of view, or whether it's another polished
product with nothing underneath.

Do not flatter me. Do not hedge. If something is weak, say so plainly and tell me why.

Here is what I'm building:
[Paste a description of your product. A URL or a few screenshots help. One paragraph is enough. Drag and drog codebase files]

Run these three checks, in order. For each one give me:
- a verdict: Clear, Fuzzy, or Missing
- one sentence explaining the verdict
- one concrete change that would make it pass

1. Style: point of view
Can the product's point of view be said in one sentence? Not its features. Its stance:
what it believes, who it's for, what it refuses to do. If you can't say it from what I've
given you, it doesn't have one.

2. Coherence: does the position hold
Does that point of view show up on every screen and in every decision, or only on the
landing page? Point to anywhere the product says one thing and does another.

3. Problem: why it exists
Can you name exactly who it's for, and what specifically breaks for them if this never
exists? "People who want X" is not enough. If the problem is vague, the product will be too.

Then give me one overall verdict: does this have something underneath, or is it about to
blend into everything around it?

Finish with the single most important question I should answer before I build another screen.
```
