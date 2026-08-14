# Task Modes

Use this reference to decide whether Fable 5 is warranted and what kind of judgment to request.

## Worth-It Lens

Fable is justified when most of these are true:

- a wrong decision would redirect weeks of product or engineering work;
- the problem crosses several systems or disciplines;
- current framing may itself be wrong;
- source material is rich enough to support independent investigation;
- the expected output is a decision, target architecture, or recovery direction;
- depth is worth more than low latency and predictable cost.

Use ordinary agents when the task is a bounded implementation, known bug, mechanical documentation update, routine code review, or a decision already fixed by the user.

## Modes

### Independent Review

Use for a project, product, or system that needs an external model of reality. Give the north star, evidence package, authority boundary, and requested decision artifact. Do not enumerate every suspected defect.

### Architecture Adjudication

Use when two or more materially different approaches exist. Include actual constraints and current-state evidence. Present candidate solutions only if they are genuine options the user wants compared; explicitly permit a better alternative.

### Blind-Spot Pass

Use before a consequential plan is frozen. Supply the intended outcome, current plan, and assumptions. Ask for missing questions, invalid assumptions, and evidence that would reverse the plan. Do not ask for implementation.

### Product Strategy

Use when positioning, user outcome, scope, monetization, or sequencing is uncertain. Separate user-owned values from current tactics. Include user evidence when available; do not substitute feature inventories for user outcomes.

### Design Critique

Use approved visual artifacts and actual interaction requirements. Mark screenshots as current evidence, reference, or acceptance baseline. Ask for judgment about information architecture and user behavior before visual taste.

### Project Recovery

Use when implementation has drifted from the original outcome. Include the original promise, current runtime evidence, irreversible commitments, and cost already incurred. Ask what to preserve, stop, replace, and sequence next.

### Implementation Handoff

Use only when Fable itself is intentionally chosen to implement. Define repository scope, tests, mutation authority, paid-call limits, stop conditions, and commit behavior. This is not the default for high-cost use.
