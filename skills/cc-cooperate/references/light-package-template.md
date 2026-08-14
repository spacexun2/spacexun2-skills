# Light Package Template

Use this for bounded, low-risk tasks where cc cooperation is still worth the handoff. Omit empty optional sections instead of filling them ceremonially.

~~~markdown
# CODEX_CC_PACKAGE

## Current Batch

- Timestamp:
- Mode: light
- Reason cooperation is worthwhile:
- Project path:
- Package path:
- Objective:
- User-visible outcome:

## Sources And Alignment

- Canonical source or acceptance anchor:
- Still-valid prior decisions:
- Resolved user wording:
- Material conflict between sources: none | details

## Active Brief

- Task:
- Files to read first:
- Allowed files:
- Forbidden files:
- Write boundaries:
- Out of scope:
- Stop and escalation conditions:

## Material Unknowns

Omit this section when there are no material unknowns. Keep implementation details agent-facing; mark any item needing user alignment explicitly.

- Known knowns and evidence:
- Known unknowns and cheap probes:
- Unknown knowns that may require the user's unstated preference or prior decision:
- Likely unknown unknowns, possible drift, and cheap probes:
- User alignment required: none | natural-language question and recommendation

## Validation

- Commands:
- Runtime/manual evidence:
- Evidence cc must report:
- Evidence Codex will verify independently:

## CC Delivery Format

```text
CC_DELIVERY
Batch:
Status: COMPLETE | PARTIAL | BLOCKED
Files intentionally modified:
- ...
Work completed:
- ...
Validation:
- <check>: pass | fail | not run
Material discoveries or deviations:
- none | details
Scope expansion proposed but not performed:
- none | details
Stop conditions triggered:
- none | details
```

## Current CC Delivery

- Status: pending

## Latest Codex Acceptance

- Status: pending
- Independently verified evidence:
- Accepted outcome:
- Remaining gap:
- Attribution note:
- Commit/deploy decision:
~~~

Before refreshing this package for another batch, archive the completed delivery and acceptance. Carry forward only still-valid decisions, unresolved material unknowns, attribution facts, and acceptance constraints.
