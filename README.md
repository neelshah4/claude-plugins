# neel-plugins

Claude Code plugins for academic and clinical work. Each one also lives in its own repository and installs independently.

---

## Install

```
/plugin marketplace add neelshah4/claude-plugins
```

Then install what you want:

```
/plugin install grant-reviewer@neel-plugins
/plugin install citation-verification@neel-plugins
```

Every entry is pinned to a release tag, so an install is reproducible.

---

## What's here

| Plugin | Version | Does |
|---|---|---|
| [grant-reviewer](https://github.com/neelshah4/claude-grant-reviewer) | 6.2.0 | Nine-reviewer simulated NIH study section producing a ranked bank of paste-ready edits |
| [icu-clinical-consult](https://github.com/neelshah4/claude-icu-clinical-consult) | 1.2.0 | Four independent critical-care specialists reconciled by a synthesizer |
| [citation-verification](https://github.com/neelshah4/claude-citation-verification) | 2026.8.29 | Checks every PMID, DOI, PMC, arXiv, and NCT identifier against live sources |
| [fabrication-audit](https://github.com/neelshah4/claude-fabrication-audit) | 2026.8.29 | Verifies doses, thresholds, percentages, and other retrievable values |
| [prompt-optimizer](https://github.com/neelshah4/claude-prompt-optimizer) | 2026.8.22 | Structures a request before Claude produces content, with enforcement hooks |

Two versioning schemes, deliberately. `grant-reviewer` and `icu-clinical-consult` carry semantic versions because the underlying skills do. The other three are calendar-versioned, because those skills are dated rather than numbered. **Each plugin's version matches its skill's own declared version** — nothing is renumbered for cosmetic tidiness.

---

## The idea behind them

These share one assumption: **a language model's confident output looks identical whether it retrieved a fact or invented one.** There is no tell in the prose. So verification has to be structural rather than a matter of asking the model to be careful.

That assumption produces two families.

**The verification layer.** `fabrication-audit` and `citation-verification` split the claim surface by type — academic identifiers in one, every other retrievable value in the other. They compose deliberately, and neither covers the other's territory. Running one alone leaves half the surface unchecked.

**The adversarial panels.** `grant-reviewer` and `icu-clinical-consult` both solve the same problem: a single reasoner finds a frame early and defends it, so asking for alternatives returns variations. Both dispatch specialists who cannot see each other's findings, then run a cross-check whose actual output is the *disagreements*. Where two reviewers contradict each other is where the real question is.

`prompt-optimizer` works the other end — specifying the task before the model guesses at it.

---

## Which to install

**Writing anything with citations** → `citation-verification` and `fabrication-audit`. Together.

**Writing or reviewing NIH grants** → `grant-reviewer`. It bundles the verification gates already.

**Critical-care questions** → `icu-clinical-consult`. Read its scope statement first: decision support for licensed clinicians, not an autonomous system, and not a medical device.

**Everything else** → `prompt-optimizer` is the one with no domain assumptions.

---

## Requirements

| | Needed for |
|---|---|
| **Claude Code** with the Agent tool | The multi-agent panels. Without it they degrade to a single pass and say so. |
| **Web access** | Every verification path, and guideline/NOFO retrieval. |
| **PubMed MCP** *(optional)* | Improves retrieval in `citation-verification` and `icu-clinical-consult`. |

All five work on any current Claude model. They were developed and tuned on Opus 5; nothing pins a model ID.

---

## The bundled dependency

`grant-reviewer`, `icu-clinical-consult`, and `citation-verification` each ship a copy of `fabrication-audit` so they work standalone on install.

If you install several, also install `fabrication-audit` itself — that repo is canonical, and if the copies drift, it wins.

For maintainers, `scripts/sync-fabrication-audit.sh` checks and repairs drift across the bundles. Clone all six repos into one directory, then:

```bash
./scripts/sync-fabrication-audit.sh check   # report drift, exit 1 if any
./scripts/sync-fabrication-audit.sh apply   # copy canonical over the bundles
```

It fails loudly rather than silently skipping a repo it cannot find, which is the behavior you want from something that runs before a release.

---

## Versioning and releases

Each plugin versions independently and tracks its own skill's declared version. Marketplace entries pin `ref` to a release tag rather than `main`, so:

- an install today and an install next month give the same code
- a version bump requires editing `marketplace.json` in the same change
- you can pin an older version by installing from the repo at that tag

Bug reports and pull requests belong on the individual plugin repository, not here. This repo holds only the listing.

---

## Not published here

`writing-anti-ai`, a de-slopping and AI-tell-removal skill, is deliberately absent. Its threshold calibration is derived from a private corpus that names identifiable third parties in sensitive contexts, and it carries a share-alike encumbrance inherited from an upstream pattern catalog. Publishing it would require rebuilding the calibration from public material. It may appear later; it will not appear as-is.

---

## License

MIT throughout. Author: Neel Shah, MD, MSc.
