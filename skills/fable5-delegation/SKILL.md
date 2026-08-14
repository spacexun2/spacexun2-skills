---
name: fable5-delegation
description: Prepare and integrate high-cost Fable 5 work. Use only when the user explicitly names Fable 5 or asks whether a consequential, high-uncertainty product, architecture, research, design, or project-recovery decision merits Fable 5. Curate minimum sufficient evidence, prevent solution anchoring, define authority and cost boundaries, generate a one-shot task handoff, or turn a Fable 5 report into verified decisions and lower-cost agent work. Do not trigger for ordinary implementation, bug fixing, routine review, document cleanup, or generic prompt writing.
---

# Fable 5 Delegation

Use Fable 5 for scarce global judgment, not routine execution. Preserve this division of responsibility:

```text
user: product direction, north star, non-negotiables
Codex: recover current facts, curate evidence, prepare delegation
Fable 5: independently model the problem, expose blind spots, recommend direction
execution agents: implement, test, debug, and iterate
Codex/reviewer: verify evidence, arbitrate findings, and accept the delivery
```

## Choose The Operation

Infer the operation from the request:

- **Worth-it decision**: decide whether Fable 5's cost buys material judgment unavailable from ordinary agents.
- **Delegation package**: prepare the minimum sufficient artifact set and a low-anchoring prompt.
- **Prompt only**: write the task handoff against an already-prepared package.
- **Result integration**: verify a Fable report and convert accepted findings into decisions and execution work.

Load [references/task-modes.md](references/task-modes.md) only when selecting among task shapes or deciding whether Fable is justified.

## Protect The Judgment Surface

Classify candidate context before writing the prompt:

| Class | Treatment |
|---|---|
| Verified fact | Include or point to evidence. |
| User non-negotiable | State directly and explain its authority. |
| Hypothesis or suspected defect | Label as a hypothesis or omit; never phrase it as established truth. |
| Open question | Give Fable freedom to reframe it. |
| Proposed solution | Omit unless the task is explicitly to compare that solution. |
| History, duplicate docs, process narration | Exclude unless needed to explain an irreversible decision. |

Give Fable the outcome and evidence, not a prepared conclusion. Preserve unknowns that could reveal a better framing. Do not turn every user observation into a review dimension.

Load [references/context-and-anchoring.md](references/context-and-anchoring.md) when the source set is large, contradictory, or already contains strong recommendations.

## Build A Minimum Sufficient Handoff

Inspect current artifacts before describing them. Prefer runtime code, schemas, tests, observed behavior, and current source-of-truth documents over summaries and historical notes.

The external prompt should normally contain only:

1. the consequential outcome;
2. the requested kind of judgment;
3. non-negotiables and decision authority;
4. where evidence begins and its priority;
5. mutation, paid-call, privacy, and time boundaries;
6. the final decision artifact.

Keep implementation detail in the evidence package. With a complete package, do not duplicate its handoff document in the prompt. Use [assets/fable-task-brief.md](assets/fable-task-brief.md) as a drafting surface, deleting unused sections rather than filling them ceremonially.

For expensive one-shot work:

- use a fresh task;
- ask Fable to inspect actual evidence rather than rely on summaries;
- ask it to distinguish verified findings from inference;
- allow it to reject the supplied framing;
- prohibit implementation and live paid calls unless they are the explicit objective;
- request a silent blind-spot and falsification pass without asking for hidden reasoning;
- define a compact final artifact, not an exhaustive checklist;
- set explicit stop conditions when the agent has tool or mutation access.

Before delivery, run `scripts/audit-context-package.mjs <path>` when a local package exists. Treat possible secret findings as a stop condition until resolved. A clean result proves only that the script's matched credential patterns were absent; separately review PII and whether each item of user data is necessary.

## Integrate Fable's Result

Do not treat price or intelligence as authority. Re-open cited evidence and classify each consequential recommendation:

```text
accepted        evidence supports it and it can enter execution
needs-decision  changes product promise, cost, data ownership, or architecture
needs-evidence  plausible but not demonstrated
rejected        conflicts with current evidence or the user's north star
later           useful but not current-stage work
```

Record decisions with [assets/decision-ledger.md](assets/decision-ledger.md). Load [references/result-integration.md](references/result-integration.md) for reports that propose architecture replacement, broad scope changes, or many implementation tasks.

Translate only `accepted` items into scoped work for lower-cost agents. Keep the Fable report intact as advisory evidence; do not rewrite it into source-of-truth language before user-owned decisions are made.

## Evidence Contract

A delegation is ready only when:

- the user outcome and non-negotiables are explicit;
- current artifacts have been inspected rather than remembered;
- facts, hypotheses, and questions are distinguishable;
- the package is free of credentials and unnecessary user data;
- Fable's authority, write boundary, paid-call boundary, and stopping point are clear;
- the requested output supports a real decision;
- another agent can later verify and execute the result.

If these conditions cannot be met, explain the missing evidence or decision instead of padding the prompt.
