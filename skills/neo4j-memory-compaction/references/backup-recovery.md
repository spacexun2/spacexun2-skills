# Backup And Recovery

Load for destructive compaction or recovery. Backup scope follows consequence, not a fixed ceremony.

## Choose The Smallest Recoverable Scope

- **Read-only audit:** no backup.
- **Bounded deletion or merge:** export the affected induced subgraph, candidate list, intended transformation, and before counts.
- **Broad deletion, cross-label identity change, relationship-family rewrite, or uncertain blast radius:** export the full graph plus schema and plan.

Do not reduce backup scope merely to save effort when the deleted meaning cannot be reconstructed from canonical files or stable provenance.

## Recovery Package

A bounded package should contain enough information to reconstruct affected semantics:

- labels, stable application ids, and properties for affected nodes;
- relationship type, properties, and stable start/end identifiers;
- candidate ids and reasons;
- intended merge, archive, deletion, or downgrade operations;
- before counts and target database identity;
- compaction run id and creation time.

A full package additionally records constraints/indexes, all nodes and relationships, and graph-wide counts. Element ids may change across imports; do not rely on them as the only restoration key.

## Validate Before Mutation

- write strict UTF-8 and re-read it strictly;
- parse every JSON/JSONL artifact;
- compare exported node and relationship counts with the planned scope;
- confirm stable ids are sufficient to reconnect relationships;
- keep credentials and connection secrets out of the package;
- store the package outside source repositories and other public/synced locations unless the user explicitly chose that destination.

An export is `created`, `validated`, or `restore-tested`; these are different states. Claim only the state proved.

## Recovery

Before restoring, compare the backup target and schema with the current graph. Preview collisions and relationship remaps, restore in bounded transactions, then read back restored nodes and representative retrieval paths. Do not overwrite newer valid state merely because an older backup exists.
