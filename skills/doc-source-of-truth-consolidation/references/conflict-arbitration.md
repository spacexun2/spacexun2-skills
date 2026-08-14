# Conflict Arbitration

Use this reference only when sources disagree or a migration would make one claim authoritative.

## Separate Two Kinds Of Truth

- **Normative truth**: accepted user decisions, product promises, business rules, approved prototypes, and explicit acceptance anchors describe what should govern.
- **Descriptive truth**: code, runtime responses, tests, deployed artifacts, and current UI describe what exists now.

Neither automatically replaces the other. A runtime mismatch may be an implementation defect; an accepted decision unsupported by runtime remains unimplemented rather than false.

## Authority Heuristic

Use context rather than a rigid newest-first ranking. Strong signals include:

1. Explicit current user confirmation or an accepted decision record.
2. A maintained canonical source linked from the active overview.
3. Approved prototype or acceptance evidence for the relevant stage.
4. Current implementation and runtime evidence for descriptive state.
5. Agent summaries, handoffs, research, brainstorming, and archived plans as supporting or historical material.

Check whether the evidence addresses the same domain and phase. A demo constraint must not become a permanent business rule; a current implementation must not silently redefine the product promise.

## Roles

Use only the roles needed by the project:

- original idea or requirement,
- accepted decision log,
- product or business baseline,
- technical architecture,
- stage-bound execution or acceptance spec,
- research reference,
- communication or status record,
- archive.

## Conflict Record

```text
Conflict and affected domain:
Sources and exact statements:
Normative authority:
Descriptive evidence:
Phase or timeline difference:
Possible contamination:
Recommended resolution:
User decision required: yes / no
```

Ask the user when evidence cannot distinguish implementation drift from a changed decision, or when choosing a winner changes a commitment.
