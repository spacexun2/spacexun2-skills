# Acceptance Checklist

Use this after cc delivery. Acceptance belongs to Codex and must preserve the aligned objective, not merely produce green checks.

## Baseline And Attribution

- Read the current package and current cc delivery.
- Inspect `git status` and `git diff` before trusting the report.
- Compare the current diff with the pre-handoff baseline when available.
- State attribution limits explicitly when the baseline was dirty or incomplete.

## Scope Diff

Check:

```text
actual changed files - allowed files = scope violations
cc claimed files - actual changed files = report mismatch
actual changed files - cc claimed files = unreported modifications
```

Return for revision when a violation affects behavior, safety, data ownership, the aligned product meaning, or acceptance. A related file may be inspected or proposed for scope expansion; it must not be silently modified outside the allowed boundary.

## Objective And Alignment Preservation

- Re-read the original objective, user-visible promise, canonical anchors, and resolved user wording.
- Confirm that implementation did not turn a current product outcome into a later-stage subsystem, internal harness, or narrower engineering proxy.
- Treat conflicts between current files as evidence to resolve, not a reason to let the newest file win automatically.
- If a discovery changes product promise, architecture, data model, UX loop, cost, schedule, or acceptance, return to the user or re-plan before accepting.

## Unknowns And Discoveries

- Review the four-lens unknowns, assumptions, deviations, and deferred decisions.
- Preserve useful blind-spot hypotheses and their cheap probes; do not require all four categories to be populated.
- Keep agent-resolvable implementation unknowns in the package.
- Translate a material product or scope ambiguity into natural language and align it with the user before accepting work built on that interpretation.
- Do not present an unverified likely unknown unknown as a confirmed defect.

## Evidence

- Run the validation commands from the package when feasible.
- For UI or workflow changes, run risk-proportionate browser, runtime, path, or screenshot checks.
- Load a specialized audit only when the user explicitly names it and it is currently available. Do not activate a token-heavy audit automatically for ordinary visual acceptance; use risk-proportionate built-in checks instead.
- Verify changed Chinese documents or important Chinese UI text with strict UTF-8 reads.
- Do not treat executor self-report as completion evidence.

## Acceptance Record

Replace the package's latest acceptance with the current result:

- Accepted outcome.
- Rejected or incomplete outcome.
- Evidence Codex independently verified.
- Resolved product wording preserved or violated.
- Material discoveries and remaining gaps.
- Attribution note.
- Follow-up action.
- Commit/deploy decision.

Archive the previous completed batch before the next one. Carry forward only still-valid context and unresolved material unknowns.

## User-Facing Report

Lead with `通过`, `部分通过`, or `未通过`, then report:

- The user-visible outcome now achieved.
- The smallest set of independently verified evidence.
- Material deviation or remaining gap.
- A natural-language decision request only when the user must choose.

Do not summarize the full package or dump the unknowns register into chat. Explain product meaning and consequences rather than internal taxonomy unless the user asks for technical detail.
