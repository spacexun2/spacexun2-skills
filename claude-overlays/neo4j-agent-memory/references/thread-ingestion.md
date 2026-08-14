# Thread And Topic Ingestion

Use for explicit session/thread ingestion, graph-gap repair, or topic-to-thread retrieval setup.

## Default Shape

```text
Topic -> HAS_THREAD -> Conversation
Topic -> HAS_CLUSTER -> ConversationCluster
Conversation -> CAPTURED -> SessionMemory / MemoryChunk / Fact / Preference / Decision / NextAction / Artifact
ThreadLookup / ThreadRef -> RESOLVES_TO -> Conversation
Conversation -> CONTINUES_FROM / EVOLVES_FROM / RELATED_TO -> Conversation
```

Create a stub `Conversation` only when a referenced upstream thread has not been ingested. Mark it `stub_referenced_only`; do not imply its contents were captured.

## Ingestion Order

1. Read the source JSONL, exported session, or thread through a strict UTF-8 path.
2. Exclude system/developer instructions and raw tool outputs by default.
3. Write a bounded `Conversation` and `SessionMemory` anchor.
4. Add structured facts, decisions, preferences, artifacts, and next actions.
5. Add ordered user `Message` nodes only for key threads, explicit preservation requests, or original-language evidence.
6. Add selected assistant messages only when exact accepted wording is not already represented structurally.
7. Store thread id, source transcript or session path, order metadata, density status, and snapshot time.
8. Read back anchors and counts after each bounded batch.

Use small serial transactions grouped by node/relationship type. Do not launch parallel writers or rely on one monolithic Cypher script. Keep original source paths as the high-fidelity fallback for truncated messages.

## Density

Ordinary updates are structured-only. High-density mode must record its actual coverage, for example `user_messages_ingested_assistant_summarized`. Never label a thread fully ingested when messages were omitted or the thread remained active.

## Topic Lookup

Give a topic human-readable aliases and `lookup_text`, then link related conversations explicitly. Prefer a bounded alias set derived from real user language; do not pad it with speculative synonyms.
