# Contributing

Two ways to contribute:

## 1. Submit a Failure Mode

Spotted a new way an LLM coding agent fails? Open an issue using the **Failure Mode** template.

A good submission has:

- **A name** — memorable, ideally `The X Y` (e.g., *The Confident Fabricator*). Names are how this taxonomy spreads.
- **A one-line tagline** — the smell, in 12 words or less.
- **A bad example** — short code block. The fail in the wild.
- **A good example** — same shape, fixed.
- **Which principle it violates** — or propose a new one.

If accepted, your name goes on the contributors list and the failure mode ships in the next release.

## 2. Sharpen a Principle

Found edge cases where a principle is wrong, ambiguous, or counter-productive? Open an issue using the **Principle Feedback** template. Include:

- The principle.
- A concrete case where applying it produces a worse outcome.
- A proposed refinement.

## Language Variants

`CLAUDE.md` is intentionally language-agnostic. Forks adding language-specific rules are encouraged:

- `CLAUDE.python.md` — no bare `except`, no mutable default args, type hints, etc.
- `CLAUDE.typescript.md` — no `any`, no `!` non-null abuse, etc.
- `CLAUDE.react.md` — no `useEffect` dependency lies, no prop drilling hacks.
- `CLAUDE.sql.md` — parameterized queries only, index awareness.

If you maintain a high-quality variant, open a PR to link it from the README.

## What Won't Be Merged

- Principles that are project-specific rather than universal LLM failure patterns.
- Failure modes that are restatements of existing ones with new names.
- Style or formatting changes that don't change behavior.

## Local Preview

```bash
# Site is a single static file. Just open it.
open index.html
# Or serve to test relative links:
python3 -m http.server 8080
```

No build step. No dependencies. That's the point.
