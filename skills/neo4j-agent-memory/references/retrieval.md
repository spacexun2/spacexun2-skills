# Retrieval And Session Consolidation

## Targeted Retrieval

Search `Topic`, `ThreadLookup`, `ThreadRef`, `Conversation`, `SessionMemory`, and `MemoryChunk` first. Traverse known topic relationships before using fuzzy or full-text search. Load ordered `Message` nodes only when summaries and structured state cannot answer the question or original wording matters.

Read in this order:

1. `Conversation` and `SessionMemory`
2. `MemoryChunk`, `Fact`, `Preference`, `Decision`, `NextAction`, `Artifact`
3. selected or full `Message` evidence

Check `last_verified_at`, `staleness_risk`, status, and later correction/supersession links before presenting a claim as current.

## Session Consolidation

Preserve current state, accepted decisions and reasons, project direction, next actions, artifact paths, and stable preferences. Exclude tool-running trivia and meta commentary unless the task itself concerns memory infrastructure.

Use a bounded `SessionMemory` with topic-sized chunks rather than fixed node quotas. The quality gate is whether a future agent can answer: **What is the current state, why, and what should happen next?**

Prefer file-backed artifacts for exact details. Use graph memory for routing, relationships, continuity, and state that has clear provenance.

## Answering

State whether evidence is current, historical, stale, or inferred. When a current-state answer matters, recheck the canonical file or runtime if feasible instead of treating graph memory as final authority.
