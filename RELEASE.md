# Release Checklist

Quick path from this directory to a viral launch.

## 0. Pick the canonical repo slug

Before pushing, replace the remaining publishing placeholders with your final GitHub slug:

```bash
# from project root
grep -rl 'bettercallsundim/vibechecks' . --exclude-dir=.git | xargs sed -i 's|bettercallsundim/vibechecks|your-org/your-repo|g'
```

The static site infers the repo automatically on GitHub Pages, but README curl commands and issue contact links still need the real slug.

## 1. Initialize repo

```bash
git init
git add .
git commit -m "Add LLM coding failure field guide"
git branch -M main
git remote add origin git@github.com:your-org/your-repo.git
git push -u origin main
```

## 1b. Regenerate OG image (optional)

`og-image.png` is committed. To regenerate after editing `og.html`:

```bash
bash scripts/generate-og.sh        # needs system Chromium/Chrome
# or
npm i -D playwright && npx playwright install chromium && node scripts/generate-og.js
```

## 1c. Verify plugin manifests

After find-replace:

```bash
# Should both print valid JSON, no errors:
python3 -m json.tool .claude-plugin/plugin.json > /dev/null && echo "plugin.json OK"
python3 -m json.tool .claude-plugin/marketplace.json > /dev/null && echo "marketplace.json OK"
```

Smoke-test the plugin locally before pushing:

```text
# In any Claude Code session:
/plugin marketplace add /absolute/path/to/this/repo
/plugin install vibechecks@vibechecks
/vibechecks:vibechecks
```

If `/vibechecks:vibechecks` responds and the skill is listed in your active skills, you're good.

## 2. Enable GitHub Pages

Settings → Pages → Source: `main` / `(root)` → Save.
Site goes live at `https://your-org.github.io/your-repo/` in ~60s.

## 3. Set repo topics

`claude`, `llm`, `ai-coding`, `cursor`, `claude-code`, `prompt-engineering`, `anthropic`, `agentic-coding`

(Settings → topics, top of repo page.)

## 4. About / description

> One file. 11 principles. A field guide for 12 ways AI coding agents fail.

Website: https://bettercallsundim.github.io/vibechecks/

## 5. Launch sequence

Order matters. Each tier feeds the next.

1. **GitHub** — Pin to profile. Add star-history badge once you have 50 stars.
2. **X / Twitter** — Post the hook tweet with the site link and a screenshot of the Failure Zoo grid. Tag @karpathy. Reply with each failure mode as a thread (12 tweets over 12 days keeps it alive).
3. **Hacker News** — `Show HN: A CLAUDE.md for 12 named LLM coding failure modes`. HN loves named taxonomies. Post Tuesday or Wednesday 8–10am PT.
4. **Reddit** — r/ClaudeAI, r/LocalLLaMA, r/ChatGPTCoding, r/programming. Different framing each.
5. **Dev newsletters** — Pitch TLDR, Console.dev, Pointer.io with the same one-liner.

## 6. Hook variants (pick one per channel)

- **Taxonomy:** "We gave LLM coding failures names. Here's the field guide."
- **Practical:** "One file. 11 principles. Targets the 12 most common ways AI coding agents fail."
- **Credibility:** "Karpathy called out the core problems with AI coding. We turned them into a 12-mode field guide."
- **Pain:** "'The tests pass.' — said AI, without running them. Here's the file that stops this."

## 7. After launch

- Open issues for the first 3 community-submitted failure modes within 24h. Momentum compounds.
- Add a "Used by" section to the README the moment any known repo adopts it.
- Watch for the screenshots people share — the Failure Zoo grid is the unit of virality.
