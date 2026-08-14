# Result Integration

## Verify Before Accepting

For each high-impact finding:

1. locate the cited artifact and confirm the claim;
2. distinguish a current defect from a future scaling concern;
3. assess impact on the user outcome, data, privacy, paid usage, or schedule;
4. identify whether the recommendation changes a user-owned decision;
5. classify it in the decision ledger.

Do not accept unsupported architectural claims because they are elegant. Do not reject a larger redesign merely because it creates work. Compare the expected user and engineering outcome against migration cost and evidence.

## Convert To Execution

For accepted findings, produce implementation work that states:

- the user-visible or system outcome;
- canonical source and affected boundaries;
- current evidence;
- smallest complete implementation scope;
- provider-safe or deterministic tests;
- production or browser evidence required;
- explicit exclusions.

Assign implementation, code review, and acceptance independently when practical. Preserve the original Fable report so downstream agents can distinguish its advice from approved requirements.

## Escalate To The User

Require user decision before acting when a recommendation changes:

- product promise or target user;
- privacy, data ownership, or memory visibility;
- monetization or material provider cost;
- core architecture with non-trivial migration;
- deletion, publication, or production mutation authority.

Present the finding, evidence, options, consequence, and a recommended default. Do not forward the entire report as a question.
