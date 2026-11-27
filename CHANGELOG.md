# Changelog

All notable changes to this marketplace are documented here.

## [1.4.14] - 2026-11-27

### Changed
- Pinned releases: icu-clinical-consult v1.3.2, citation-verification v2026.11.27, fabrication-audit v2026.11.27. Each skill description now puts its trigger phrases inside the first 300 characters that skill listings show; no trigger, scope or procedure changed. The `citation-verifier` agent's contract block moves its voice rules to a separate line, and the `icu-consult-synthesizer` agent description is shortened. The three bundled `fabrication-audit` copies match the standalone repo. prompt-optimizer unchanged.

## [1.4.13] - 2026-11-20

### Changed
- prompt-optimizer pinned to v2026.11.20: the Stop hook requires a closed `<optimized_prompt>` element with role, inputs and instructions before it counts a block as present.

## [1.4.12] - 2026-11-20

### Changed
- README plugin table shows the pinned versions: icu-clinical-consult 1.3.1, citation-verification 2026.11.16, fabrication-audit 2026.9.24, prompt-optimizer 2026.11.16. The table had stayed at the first-release versions.
- Marketplace description lists only the four plugins it carries.
- No plugin pin changed.

## [1.4.11] - 2026-11-16

### Changed
- Pinned release: citation-verification v2026.11.16. A bundled script now fetches each registry record and assigns every citation its status; the skill, agent and workflow share one 11-status vocabulary. The release also adds a claim-support tier, an eval bank, and an optional Stop hook that the plugin does not register. prompt-optimizer, icu-clinical-consult, and fabrication-audit unchanged.

## [1.4.10] - 2026-11-16

### Changed
- Pinned release: prompt-optimizer v2026.11.16. The closeout rule follows the user's standing format, one merged receipt line replaces two, the nudge hook stays silent on harness events and short status or command prompts, and the Stop hook finds the opening prompt in long transcripts.
- Pinned release: icu-clinical-consult v1.3.1. One intake rule (0 to 3 questions in any mode), one Decision-support rule, a population line, a clinician scope and length override that keeps a whole-patient check in patient scenarios, and a scripted workflow that returns the gated consult and names any gate that did not run.

## [1.4.9] - 2026-11-14

### Changed
- Pinned release: prompt-optimizer v2026.11.14. The skill fires on every typed prompt that carries a task, including follow-ups of 25 words or more, and its hooks ignore turns no person started (agent reports, notifications, compaction summaries). The block gains an `<assumptions>` element, `<eval>` drops to 1–3 checks that run as the last step, and the `/goal` suggestion is removed.

## [1.4.8] - 2026-11-01

### Changed
- Pinned release: icu-clinical-consult v1.2.4. Mode A intake is now acuity-aware: no questions when nothing deciding is missing, one `Assumed:` line when the case is time-critical and the answer holds across plausible values, and otherwise only the one to three values that decide the recommendation. prompt-optimizer, citation-verification, and fabrication-audit unchanged.

## [1.4.7] - 2026-10-16

### Changed
- Pinned release: prompt-optimizer v2026.10.16.1. It states how a capped input, a user override, and the question count rank against each other, classes repo and file-edit tasks as the Document channel, adds a visual-deliverable handoff row, and gives presentation tasks the two fixed prose lines. icu-clinical-consult, citation-verification, and fabrication-audit unchanged.

## [1.4.6] - 2026-10-16

### Changed
- Pinned release: prompt-optimizer v2026.10.16. It adds a depth pass on substantive blocks (expert move, rawest material, methods and tools, outside judge) and requires every eval to name an outside judge. It also releases the long-run harness. icu-clinical-consult, citation-verification, and fabrication-audit unchanged.

## [1.4.5] - 2026-09-28

### Changed
- Pinned release: prompt-optimizer v2026.9.28 (every prompt block now carries a pass/fail eval; repeatable surfaces default to hillclimbing against a held-out test set). icu-clinical-consult, citation-verification, and fabrication-audit unchanged.

## [1.4.4] - 2026-09-24

### Changed
- Pinned releases: icu-clinical-consult v1.2.3, citation-verification v2026.9.24, fabrication-audit v2026.9.24. Each adds an optional Parallel Search MCP fallback for when WebFetch or WebSearch is blocked. prompt-optimizer unchanged.

## [1.4.3] - 2026-09-23

### Changed
- Pinned release: prompt-optimizer v2026.9.23 (three drafting clauses for Claude Opus 5.5: no requests to write out internal reasoning, effort sets depth, name specific patterns to avoid). icu-clinical-consult, citation-verification, and fabrication-audit unchanged.

## [1.4.2] - 2026-09-13

### Changed
- Pinned release: prompt-optimizer v2026.9.13 (two handoff-selector rows for academic-writing-reviewer and casual-writing-reviewer, plus Rule 11 on reviewer ordering). icu-clinical-consult, citation-verification, and fabrication-audit unchanged.

## [1.4.1] - 2026-09-12

### Changed
- Pinned release: prompt-optimizer v2026.9.12 (craft line added to Refine, grant-reviewer reference-name fixes, a residual internal path genericized). icu-clinical-consult, citation-verification, and fabrication-audit unchanged.

## [1.4.0] - 2026-09-08

### Changed
- Pinned releases: icu-clinical-consult v1.2.2, citation-verification v2026.9.8, fabrication-audit v2026.9.8, prompt-optimizer v2026.9.8 (word-budget/audit-rubric trims; the feedback-loop section renamed across all bundled fabrication-audit copies and citation-verification/prompt-optimizer; verified byte-identical bundled fabrication-audit copies via `scripts/sync-fabrication-audit.sh check`, no drift found).

## [1.3.0] - 2026-09-03

### Changed
- Pinned releases: icu-clinical-consult v1.2.1, citation-verification v2026.9.3, fabrication-audit v2026.9.3, prompt-optimizer v2026.9.3 (canonical sync of 2026-09-03).

## [1.2.0] - 2026-08-31

### Removed
- `grant-reviewer` delisted. The plugin is no longer publicly distributed.

### Changed
- README and the `fabrication-audit` sync script updated for the four remaining plugins.

## [1.1.0] - 2026-08-31

### Changed
- All entries repinned to release tags matching each skill's own declared version.
- README expanded with design rationale, requirements, and versioning policy.

## [1.0.0] - 2026-08-31

### Added
- Initial marketplace listing.
