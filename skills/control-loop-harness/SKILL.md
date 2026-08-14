---
name: control-loop-harness
description: Use only when the user explicitly invokes `$control-loop-harness` for an evidence-backed correction or retrospective. Use a focused observation scope when the user names a direction, and a panoramic scope only when the user asks to review the broader development history. Apply stored experience patterns as hypotheses, calibrate findings with current evidence, remain open to new patterns, and keep the audit read-only unless correction is separately authorized. Do not invoke implicitly for routine status checks, planning, debugging, code review, or delivery QA.
---

# Control Loop Harness

Pause and inspect whether the work is converging on the jointly approved outcome. Use the observation range the user actually requested; do not turn every correction into a full retrospective.

`AGENTS.md` supplies preventive discipline during ordinary work. This skill is the explicit interruption for evidence-backed correction.

## Shared Kernel

Use the same control idea at either observation range:

```text
question or target -> observation range -> current evidence
-> pattern-guided hypotheses -> calibrated findings
-> recommendation and value -> authority-aware next action
```

Treat plans, prompts, and docs as the map. Treat files, runtime, records, tests, user-visible behavior, and current user decisions as the territory. Separate fact, inference, proposal, and unknown.

Do not presume that a named failure exists. Known patterns may guide active signal search, but current evidence decides whether a candidate becomes a finding. Allow material evidence to reveal a new pattern outside the library.

## Choose The Observation Range

### Focused Correction

Use focused correction when the user identifies a feature, decision, behavior, or suspected direction that needs review.

- Start from the user's signal and the nearest governing source and territory evidence.
- Load only the reference material relevant to that question.
- Follow connected consequences when evidence requires it, but do not scan the whole project by default.
- Answer directly; a small correction may need only one paragraph.

### Panoramic Retrospective

Use panoramic retrospective only when the user explicitly asks to revisit the whole project, development history, goal evolution, or overall trajectory.

- Load `references/global-retrospective.md` and `references/pattern-index.md`.
- Reconstruct the history neutrally before judging it.
- Use the known library to inspect recurring signals, then make an open pass for consequential evidence not explained by existing patterns.
- Load detailed pattern references only for candidates that need deeper judgment.

If the request is ambiguous, use the narrowest range consistent with its wording and current context. Ask only when the difference would materially change cost, context, or the decision.

## Experience And Collaboration

Treat stored patterns as experienced priors, not required conclusions or output slots. It is valid to find no supported deviation. It is also valid to surface a provisional new pattern when evidence justifies further attention.

Let the agent own active discovery, independent judgment, explicit recommendations, and ordinary decisions inside the approved direction. Let the user own changes that materially affect product promise, architecture direction, data ownership, cost, schedule, destructive scope, or acceptance.

Do not silently shrink the product or silently implement a material expansion. A minimum user loop is a unit of proof, not a default scope ceiling.

## Reference Routing

- Governing target, approved evolution, or historical divergence is unclear: `references/target-lineage.md`.
- A broad history review is requested: `references/global-retrospective.md` and `references/pattern-index.md`.
- Product scope, depth, fidelity, roughness, or completion is the concrete issue: `references/product-patterns.md`.
- Architecture, process, reliability, abstraction, or over-design is the concrete issue: `references/engineering-patterns.md`.
- Agent initiative, recommendation quality, or user/agent responsibility is the concrete issue: `references/collaboration-patterns.md`.
- A material recommendation needs benefit, cost, opportunity-cost, or ROI judgment: `references/roi.md`.
- A multi-capability completion claim needs layer-by-layer evidence: `references/capability-audit.md`.

Load the smallest useful set. Do not load references merely to manufacture a comprehensive-looking audit.

## Recommendation, Authority, And Output

Give the agent's own recommendation when evidence supports one. Explain the expected benefit of doing it and the material cost or downside; include the consequence of not doing it when relevant. Do not invent probabilities, financial values, reuse, user impact, or historical facts.

Keep the audit read-only by default. Apply a correction only when the request also authorizes mutation or the user approves it afterward. Pause the affected work during the audit without freezing unrelated work unnecessarily.

Use the response shape the case needs. Do not require fixed findings, statuses, matrices, or empty categories. Cite material evidence, name decisive uncertainty, and end with the clearest next action or user-owned decision.
