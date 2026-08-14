# Pattern-Guided Workflow Skills

Load this reference only when a skill's value depends materially on accumulated experience patterns or recurring-case recognition. Do not apply it to every skill.

Typical fits include diagnosis, audit, retrospective, adaptive review, operational playbooks, and other workflows where prior cases improve attention and judgment. Deterministic transformations, narrow tool operations, fixed schemas, and straightforward artifact generation usually do not need this model.

## Treat Patterns As Experienced Priors

Preserve evidence-backed patterns from real work. Their purpose is to help an agent notice signals that a context-free model might miss and avoid relearning the same lesson.

Use a pattern to generate a candidate interpretation or inspection path, not an automatic conclusion:

```text
known pattern -> relevant signal -> current evidence -> calibrated finding
```

It is valid to search for signals suggested by known patterns. Do not require every invocation to assess or report every stored pattern.

A useful pattern record may contain a name, recognizable signals, evidence that confirms or weakens it, common false positives, likely impact, and known correction directions. Treat this as an internal experience format, not a mandatory user-facing report template.

## Calibrate With Current Evidence

Separate confirmed findings, reasonable hypotheses, proposals, and unknowns. A pattern match without current evidence remains a hypothesis.

Do not suppress a material but unconfirmed signal when a cheap probe could resolve it. Label the uncertainty and propose the probe. Do not convert model plausibility into a fact, probability, financial value, or historical claim.

Store false-positive guards alongside patterns when real experience shows that superficially similar cases have different causes.

## Decide Whether The Library Is Closed Or Evolvable

Choose this from the target workflow rather than assuming that every pattern library should expand.

- Use a closed library when the taxonomy is authoritative, compliance-bound, externally defined, or intentionally finite.
- Use an evolvable library when novel recurring evidence should improve future recognition and the workflow has a safe way to review additions.

If the library is evolvable, define how a provisional pattern is evidenced, distinguished from existing entries, and approved for retention. Do not require every task to produce a new pattern.

## Separate Pattern Storage From Output

It is appropriate to enumerate patterns comprehensively inside conditional references. It is usually inappropriate to make every pattern a required output slot.

Let the case determine the response shape. Do not produce negative findings or speculative content merely to complete a template. Use a fixed output schema only when an external consumer, machine interface, compliance rule, or fragile coordination contract actually requires it.

Keep broad pattern libraries behind conditional references and route to the smallest relevant material when the target workflow benefits from selective loading.

Observation ranges, ROI analysis, correction authority, and open-ended discovery procedures belong in the target skill only when that workflow specifically needs them. Do not import those control-loop decisions into pattern-guided skill design by default.
