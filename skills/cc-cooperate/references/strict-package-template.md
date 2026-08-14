# Strict Package Template

Use this for high-risk or high-value cooperation: product promise, workflow behavior, cross-module logic, data writes, customer-facing demos, provider/API/auth/deployment concerns, difficult rollback, or visual/user-journey risk.

Keep the four unknown lenses rich for agents. Translate user-owned product or scope ambiguities into natural-language alignment before cc starts.

~~~markdown
# CODEX_CC_PACKAGE

## Current Batch

- Timestamp:
- Mode: strict
- Reason cooperation is worthwhile:
- Project path:
- Package path:
- Original objective:
- User-visible promise:
- Current state:
- Target state:

## Canonical Sources And Resolved Alignment

- Canonical source or acceptance anchor:
- Source priority and conflict rule:
- Exact product terms or business rules that must not drift:
- Still-valid decisions carried from prior batches:
- User decisions resolved before this handoff:
- Superseded wording or assumptions that must not return:

## Git Baseline

- Captured at:
- Branch:
- HEAD:
- Status summary:
- Pre-existing modified files:
- Pre-existing untracked files:
- Allowed cc files:
- Forbidden cc files:
- Attribution limits and rule:

## Material Unknowns Register

Do not fill for ceremony. Keep each item evidence-aware and actionable.

### Known knowns

- Fact or constraint:
  - Evidence / source:
  - Why it matters to this batch:

### Known unknowns

- Unresolved fact or decision:
  - Impact if unresolved:
  - Cheapest useful probe:
  - Owner: Codex | cc | user

### Unknown knowns

- Likely user preference or prior decision not captured clearly enough:
  - Why Codex believes it may already exist:
  - Product or scope consequence:
  - Natural-language question for the user:
  - Codex recommendation:

### Likely unknown unknowns

- Blind-spot hypothesis:
  - Why it is plausible:
  - Drift or rework it could cause:
  - Cheapest useful probe:
  - User alignment required now: yes | no

## User Alignment Gate

- Natural-language alignment brief sent:
- User-owned ambiguities resolved: yes | no | none
- Resolved wording:
- How the decision changed the brief:
- Canonical source updated or follow-up recorded:

Do not hand off while a user-owned ambiguity that can materially change the objective, product promise, data ownership, user loop, architecture, scope, cost, schedule, or acceptance remains unresolved.

## Active Brief

- Task:
- Files to read first:
- Allowed files:
- Forbidden files:
- Write boundaries:
- Out of scope:
- cc may investigate without modifying:
- cc may autonomously fix inside allowed files:
- Stop and escalation conditions:

## Validation And Evidence

- Commands:
- Runtime/browser checks:
- Visual/user-journey evidence path:
- Evidence cc must report:
- Evidence Codex will verify independently:
- Original-objective check:

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
Material discoveries:
- none | details and evidence
Assumptions or deviations:
- none | details
Scope expansion proposed but not performed:
- none | details
Decisions deferred to Codex or user:
- none | details
Stop conditions triggered:
- none | details
```

## Current CC Delivery

- Status: pending

## Latest Codex Acceptance

- Delivery claim reviewed:
- Actual changed files:
- Diff and scope result:
- Commands run independently:
- Runtime/browser evidence checked:
- Resolved product wording preserved:
- Original objective still satisfied: yes | no | partial
- Material unknowns and discoveries disposition:
- Accepted outcome:
- Rejected or incomplete outcome:
- Remaining gap and next action:
- Attribution note:
- Commit/deploy decision:
~~~

Before starting a new batch, archive the completed batch, delivery, acceptance, resolved hypotheses, and superseded assumptions. Carry forward only current truth, still-valid decisions, unresolved material unknowns, attribution facts, and acceptance constraints.
