# Execution And Validation

Load only for an authorized compaction run or its acceptance.

## Preview

Resolve candidates with read-only queries. Record exact selection predicates and counts so the executed scope can be compared with the accepted scope. Inspect representative properties locally when scalar Cypher conversion would mishandle arrays or multilingual text.

For useful nodes selected for deletion, prove one of:

- stronger structured coverage already exists;
- an archive/summary node has been created and read back;
- a canonical artifact or validated backup provides the intended recovery path.

## Mutate

- use stable ids and idempotent writes where possible;
- remap required relationships before deleting duplicates;
- use small serial transactions grouped by candidate class;
- stop on a failed write or unexpected affected count;
- do not run parallel writers against the same compaction scope.

After each bounded batch, query the expected nodes, relationships, statuses, and counts. A driver exit code or HTTP success is transport evidence, not graph-state evidence.

## Accept The Result

Compare final database counts with the actual graph, not an intermediate snapshot. Validate the properties the cleanup promised:

- current state, accepted decisions, durable preferences, and real next actions remain retrievable;
- archived or superseded material no longer presents as current;
- deleted detail has the intended summary, provenance, or recovery coverage;
- duplicates no longer compete on representative retrieval paths;
- no unexpected orphan relationships or identity splits were introduced.

Use a small set of representative retrieval terms chosen from the affected scope. Do not manufacture a universal smoke suite or require every label to exist in every graph.

When writing a report, distinguish before, planned, executed, repaired, and final states. Include only the evidence needed to understand what changed and how to recover it.
