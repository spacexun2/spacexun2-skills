# Compaction Patterns

Use these patterns to direct inspection. Confirm a relevant signal in the current graph before treating a pattern as a finding. Stay open to candidate classes not listed here.

## Raw Conversation Noise

**Signals:** many `Message` nodes repeat information already captured by `SessionMemory`, `MemoryChunk`, `Fact`, `Decision`, or `NextAction`; ordinary retrieval must traverse chat flow to find current state.

**Confirm:** structured coverage preserves user intent, current state, corrections, important original wording, and evidence pointers.

**False-positive guard:** exact language may still be required for authorship, consent, dispute resolution, or a high-value decision. Keep selected evidence or a recoverable pointer instead of deleting it blindly.

## Short-Lived Artifact Observations

**Signals:** machine-specific paths, transient commit observations, generated files, or intermediate outputs dominate artifact retrieval after their task has ended.

**Confirm:** the observation is no longer a canonical location, release baseline, recovery marker, or required provenance anchor.

**Correction direction:** delete or downgrade the transient observation; preserve a stable artifact or bounded historical note when it still changes future work.

## Stale Action Semantics

**Signals:** expired, completed, abandoned, or superseded items still appear as active actions or current state.

**Confirm:** current files, later graph state, or user evidence establishes that the item is no longer live.

**Correction direction:** mark it completed/superseded, archive it as historical context, or merge reusable information into a durable summary. Do not infer inactivity from age alone.

## Duplicate Or Superseded Semantic Nodes

**Signals:** several nodes represent the same fact, identity, decision, or project state and compete during retrieval.

**Confirm:** stable identifiers, provenance, and time boundaries show that they are duplicates or revisions rather than distinct entities.

**Correction direction:** retain the strongest canonical node, preserve provenance and correction order, remap necessary relationships, then remove only covered duplicates.

## Over-Compressed Memory

**Signals:** a prior cleanup produced short summaries that lost decision reasons, current status, relationship distinctions, or evidence needed to resolve later contradictions.

**Confirm:** representative retrieval cannot answer what changed, why, what is current, or where the claim came from.

**Correction direction:** restore selected detail from a validated backup or canonical source. Compaction quality can require adding structure, not only deleting nodes.
