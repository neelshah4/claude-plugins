# neel-plugins

Claude Code plugins for academic and clinical work. Each one also lives in its own repository and installs independently.

## Install the marketplace

```
/plugin marketplace add neelshah4/claude-plugins
```

Then install what you want:

```
/plugin install grant-reviewer@neel-plugins
```

## What's here

| Plugin | Version | Does |
|---|---|---|
| [grant-reviewer](https://github.com/neelshah4/claude-grant-reviewer) | 6.2.0 | Nine-reviewer simulated NIH study section, producing a ranked bank of paste-ready edits |
| [icu-clinical-consult](https://github.com/neelshah4/claude-icu-clinical-consult) | 1.0.0 | Four independent critical-care specialists, reconciled by a synthesizer |
| [citation-verification](https://github.com/neelshah4/claude-citation-verification) | 1.0.0 | Checks every PMID, DOI, PMC, arXiv, and NCT identifier against live sources |
| [fabrication-audit](https://github.com/neelshah4/claude-fabrication-audit) | 1.0.0 | Verifies doses, thresholds, percentages, and other retrievable values |
| [prompt-optimizer](https://github.com/neelshah4/claude-prompt-optimizer) | 1.0.0 | Structures a request before Claude produces content, with enforcement hooks |

## The idea behind them

These share one assumption: a language model's confident output looks identical whether it retrieved a fact or invented one, so verification has to be structural rather than a matter of asking nicely.

`fabrication-audit` and `citation-verification` are that verification layer, split by claim type — identifiers in one, everything else in the other. `grant-reviewer` and `icu-clinical-consult` are multi-agent panels whose reviewers cannot see each other's findings, because a single reasoner converges early and defends its first frame. `prompt-optimizer` works the other end of the problem, specifying the task before the model guesses.

## Which to install

**Writing anything with citations** → `citation-verification` + `fabrication-audit`.

**Writing or reviewing NIH grants** → `grant-reviewer`. It bundles the verification gates.

**Critical-care questions** → `icu-clinical-consult`. Read its scope statement first; it is decision support for licensed clinicians, not an autonomous system.

**Everything else** → `prompt-optimizer` is the one with no domain assumptions.

## A note on the bundled dependency

`grant-reviewer`, `icu-clinical-consult`, and `citation-verification` each ship a copy of `fabrication-audit` so they work standalone. If you install several, also install `fabrication-audit` itself — that repo is canonical, and `scripts/sync-fabrication-audit.sh` in this repo keeps the copies aligned before each release.

## Versioning

Each plugin versions independently and its marketplace entry is pinned to a release tag, so a marketplace install is reproducible. Bug reports and pull requests belong on the individual plugin repository, not here.

## License

MIT throughout. Author: Neel Shah, MD, MSc.
