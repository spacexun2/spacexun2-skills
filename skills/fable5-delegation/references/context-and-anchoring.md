# Context Selection And Anchoring

## Minimum Sufficient Context

Always provide:

- one consequential user or business outcome;
- the current stage and decision being made;
- user-owned non-negotiables;
- an evidence entry point;
- source priority when artifacts conflict;
- the model's authority and stopping point;
- the final artifact needed to make a decision.

Provide only when material:

- budget, latency, privacy, regulatory, deployment, or team constraints;
- irreversible technical commitments;
- failed approaches with evidence showing why they failed;
- definitions whose local meaning differs from industry defaults.

Keep in the package rather than the external prompt:

- source code, schemas, tests, screenshots, traces, and detailed handoffs;
- long implementation histories;
- inventories and capability matrices;
- prior agent opinions.

Exclude by default:

- stale and duplicate documents;
- secrets, user data, raw production logs, and paid-provider credentials;
- speculative future requirements;
- the author's preferred answer;
- generic review checklists.

## Anchoring Audit

Before finalizing the prompt, test every prescriptive sentence:

1. Is this a user-owned decision, verified constraint, or merely our current belief?
2. Would removing it allow a materially better diagnosis?
3. Is it already present in the evidence package?
4. Does it ask Fable to inspect, or tell Fable what it should find?

Rewrite suspected findings as neutral investigation targets only when they are central to the user outcome. Otherwise omit them and let Fable discover them.

## Evidence Hierarchy

Set a task-specific hierarchy. A common software order is:

```text
live/runtime evidence
current code and schema
executable tests
current source-of-truth contracts
handoff summaries
historical documents and prior opinions
```

Do not claim live truth from a sanitized review package. Ask the reviewer to mark what cannot be verified.

## Prompt Compactness

With a good package, the external prompt is a routing and authority layer, not a second specification. Prefer a short job handoff over a long sequence of demanded sections. Structure the final deliverable only enough to support decisions and evidence review.
