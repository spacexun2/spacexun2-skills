---
name: neo4j-memory-compaction
description: Use only when the user explicitly asks to audit, plan, execute, or recover Neo4j agent-memory compaction, cleanup, deduplication, archival, or graph-size reduction. Improve retrieval and reduce stale or noisy memory without erasing current state, provenance, or recovery paths. Do not use for ordinary Neo4j recall/writes, generic database optimization, or implicit cleanup.
---

# Neo4j Memory Compaction

Make the memory graph easier to retrieve from and less ambiguous while preserving what a future agent still needs to decide or continue work. A smaller node count is evidence only when it follows from better memory semantics; it is not the objective.

Use `$neo4j-agent-memory` for target selection, connection policy, graph schema, ordinary reads/writes, and environment troubleshooting. This skill adds only the authority, recovery, and semantic-preservation rules needed for maintenance.

## Choose The Mode

- **Audit / plan**: inspect the graph, identify candidate classes, and propose a bounded compaction scope. This is read-only.
- **Execute**: mutate only an explicitly requested or already accepted candidate scope, with backup proportional to the consequence.
- **Recover**: inspect a prior run and its recovery artifacts before restoring or correcting it. Do not assume an export is restorable merely because files exist.

If the request is ordinary recall, remembering, ingestion, or schema work, return to `$neo4j-agent-memory`.

## Preserve Decision Value

Judge candidates by whether they improve future retrieval and current-state clarity:

- preserve current project state, durable preferences, accepted decisions and reasons, real next actions, stable artifacts, relationships, provenance, and correction history;
- compress raw conversational flow, repeated observations, stale action semantics, duplicates, and superseded detail only when stronger structured coverage exists;
- keep historical context explicitly historical instead of turning it into a live action or silently deleting its meaning;
- prefer a recoverable evidence pointer over retaining every raw sentence as live graph state.

Load `references/compaction-patterns.md` when selecting or evaluating candidate classes. Its patterns are experienced priors, not a checklist or automatic deletion policy.

## Authority And Backup

A read-only audit or preview does not authorize graph writes. A broad request such as “clean my memory” does not by itself settle ambiguous live status, identity merges, or deletion of sensitive/high-value context. If the user already named a precise destructive scope, do not ask again merely for ceremony.

Before mutation:

- confirm the target database and exact candidate scope;
- preview affected nodes, relationships, and semantic coverage;
- use a bounded affected-subgraph backup for reversible local cleanup;
- require a validated full-graph backup for broad deletion, cross-label identity changes, relationship-family rewrites, or other changes whose impact cannot be isolated cheaply.

Backups can duplicate sensitive graph content. Store them only in an authorized non-repository location, exclude credentials, and do not describe them as recoverable until their structure and restoration anchors have been checked. Load `references/backup-recovery.md` for destructive execution or recovery work.

Stop before mutation when the target is uncertain, backup validation fails, current versus historical status cannot be resolved, a merge would change identity or ownership without authority, or the requested compression would remove the only usable evidence for an important claim.

## Execute Proportionally

Use the smallest change that closes the accepted scope:

1. capture current counts and a candidate preview;
2. create and validate the required recovery artifact;
3. establish summary, merge, or provenance coverage before deleting useful detail;
4. write in bounded transactions and read back each affected class;
5. compare the final graph with the accepted retrieval and preservation goals.

Do not force every conversation into one summary shape, impose a fixed node-id recipe, require every candidate category to appear, or drive `Message`, `Artifact`, or action counts to zero. The current graph decides which patterns exist and what should remain.

Load `references/execution-validation.md` only when executing or validating a compaction run.

## Evidence And Result

Report naturally, in proportion to the request:

- target and mode;
- accepted scope and what was intentionally excluded;
- backup scope, location, and validation status when mutation occurred;
- exact affected counts and semantic changes;
- read-back and representative retrieval evidence;
- remaining ambiguity, restoration boundary, or user decision.

Keep edited, backed up, written, read back, and retrieval-verified states distinct. Never claim completion from a successful command alone.
