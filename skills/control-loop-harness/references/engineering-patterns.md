# Engineering And Process Patterns

Load this reference when the concrete question or an evidenced candidate concerns architecture, abstraction, process, reliability work, or suspected over-design.

Ask what current need each disputed layer protects. Useful anchors include an approved requirement, a necessary part of the present product effect, an observed failure, a high-impact safety boundary, an explicit acceptance condition, or a demonstrated reduction in current complexity.

## Experienced Patterns

- **Architecture inflation**: generalized layers are added for hypothetical future variants without a present anchor.
- **Harness displacement**: planning, orchestration, validation, or reliability infrastructure receives effort while the intended product effect remains unfinished.
- **Defensive sprawl**: fallbacks, retries, adapters, gates, or state machines protect no current need, observed failure, or high-impact boundary.
- **Source duplication**: an existing prompt, rule, schema, or workflow is copied into another canonical-looking place and creates drift risk.
- **Premature extensibility**: providers, tenants, plugins, abstractions, or migrations are supported before a current requirement justifies them.
- **Evidence bureaucracy**: the cost of matrices, checkpoints, or review artifacts exceeds their value for the decision.
- **Blocker capture**: a real blocker is fixed, then the fix and surrounding infrastructure replace the original target.

Treat these as candidates, not verdicts. Inspect actual cost, coupling, current use, and removal consequence. Do not call justified engineering over-design merely because it is complex.

Recommend the minimum-sufficient architecture for the approved effect. When excess engineering and shallow product work coexist, preserve justified layers, trim unsupported structure, and restore missing product depth.

If the evidence reveals a recurring engineering failure or success not covered here, describe it as a provisional new pattern and explain its future decision value.
