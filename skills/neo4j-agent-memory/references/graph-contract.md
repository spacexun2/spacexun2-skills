# Agent Memory Graph Contract

Load when selecting graph labels, ids, properties, or relationships. Inspect the existing graph before introducing a new label or relationship family.

## Core Labels

- `Project`, `Topic`
- `Artifact`, `Fact`, `Preference`, `Decision`, `NextAction`
- `SessionMemory`, `MemoryChunk`, `Conversation`, `Message`
- `ConversationCluster`, `ThreadRef`, `ThreadLookup`, `RetrievalRecipe`

Use only the labels needed by the current memory. Do not create parallel synonyms for an existing concept.

Domain entities are extensions, not universal defaults. Reuse an established domain label only when it exists in the authorized graph, or introduce one when the current request actually needs it. Do not preload a domain schema from examples, inferred future usefulness, or the skill author's prior use cases.

## Core Properties

- Stable identity: `id`, `name`, `title`, `aliases`
- Retrieval: `summary`, `detail`, `lookup_text`
- Provenance: `source`, `source_thread_id`, `source_rollout_path`, `path`
- State: `status`, `next_action`, `ingest_status`, `review_status`
- Evidence: `last_verified_at`, `confidence`, `staleness_risk`

Keep ids stable and machine-oriented. Follow the user or current project language for human-readable prose, preserve original titles/paths/URLs, and keep property keys plus controlled status values consistent.

## Relationship Families

- Ownership and structure: `OWNS`, `PART_OF`, `ABOUT`, `HAS_TOPIC`, `HAS_CLUSTER`, `HAS_THREAD`
- Evidence and output: `CAPTURED`, `PRODUCED`, `PRODUCED_OR_UPDATED`, `MADE_DECISION`, `HAS_NEXT_ACTION`
- Continuity and lookup: `RESOLVES_TO`, `CONTINUES_FROM`, `EVOLVES_FROM`, `RELATED_TO`, `SAME_PROJECT_AS`

Use `MERGE` with stable identifiers for repeatable writes. A source thread may capture structured memory and selected message evidence; it should not duplicate the same fact under several labels without a retrieval need.

Domain relationships follow the same extension rule: inspect and reuse the current graph contract, or define only the relationship required by the current memory. Do not make a domain-specific relationship family part of the default ingestion or retrieval workflow.

## Freshness

Represent old claims as historical or superseded rather than overwriting their provenance. A current fact requires recent evidence; a historical thread does not establish present status by itself.
