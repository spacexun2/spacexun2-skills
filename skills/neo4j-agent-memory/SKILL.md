---
name: neo4j-agent-memory
description: Use Neo4j-backed agent memory for targeted recall, durable structured memory writes, or high-value thread/topic ingestion across sessions. Use when the user explicitly asks for Neo4j, graph-backed persistent memory, a Neo4j memory update, or an established Neo4j memory workflow. Do not use for ordinary local Codex memory, generic Neo4j application development, full transcript dumping by default, or graph cleanup/compaction covered by `$neo4j-memory-compaction`.
---

# Neo4j Agent Memory

Use the shared graph to preserve durable, retrievable context that improves future decisions. The graph is an external state system, not a transcript archive or secret vault.

## Choose The Operation

- **Recall**: query existing memory and report source, freshness, and uncertainty. This is read-only.
- **Remember**: write a bounded fact, preference, decision, artifact, project state, or next action when the user asks to preserve it.
- **Ingest**: reconstruct a high-value thread or topic into structured graph state; include message evidence only when explicitly useful.

If the request only needs current files or the built-in local memory system, do not use Neo4j merely because persistent memory could be helpful.

## Target And Authority

Resolve the Neo4j target from the current environment variables or an external machine-local profile. When the task targets AuraDB from Windows, load `references/windows-aura-profile.md` for the public configuration contract and safe routing guidance; it is a template, not a working instance or proof of connectivity.

- A recall request authorizes relevant graph reads, not writes or maintenance.
- Remember, update, relationship creation, and ingestion are external writes and require the user's request or an established memory-update contract.
- Do not switch from AuraDB to local Docker, create containers, install server components, or change credentials without explicit direction.
- Graph deletion, deduplication, archival, TTL cleanup, or broad consolidation belongs to `$neo4j-memory-compaction` and requires its backup-first contract.
- Never store passwords, API keys, access tokens, or authentication secrets. Preserve thread/session identifiers only when they are necessary provenance inside the user-authorized memory scope; minimize sensitive personal or third-party data and keep its purpose explicit.

## Memory Contract

Default to structured memory that answers: **What should a future agent know to make a better decision or continue the work?**

Prefer bounded `SessionMemory`, `MemoryChunk`, `Fact`, `Preference`, `Decision`, `NextAction`, `Artifact`, `Project`, `Topic`, and `Conversation` nodes. Load `references/graph-contract.md` when choosing labels, properties, relationships, or ids.

For ordinary writes:

- preserve the current state, decision reason, artifact path, next action, source, and verification time,
- distinguish current, historical, superseded, and stale facts,
- follow the user, project, or current conversation language for human-readable prose while keeping schema keys and controlled machine values stable,
- avoid tool trivia, memory-management meta, transient frustration, and unfiltered chat logs.

## Thread And Topic Ingestion

Load `references/thread-ingestion.md` only when the user gives a thread/session id, asks to fill a graph gap, requests conversation preservation, or needs topic-to-thread retrieval.

Structured state is always written first. High-density message ingestion is reserved for key threads or explicit requests. Preserve user language before assistant language; summarize assistant output into decisions, artifacts, facts, and next actions unless exact wording is needed as evidence.

Treat active-thread ingestion as a timestamped snapshot, not a final record. Keep the source thread id and original rollout path so future agents can recover high-fidelity evidence without bloating active recall.

## Retrieval And Evidence

Load `references/retrieval.md` for topic lookup, replay, session consolidation, or freshness rules. Start with targeted nodes and relationships rather than graph dumps or full message replay.

After every write, run a read-back query that proves the expected nodes and relationships exist. Command completion, an HTTP success, or a driver process exiting without error is not write evidence.

When answering from the graph:

- identify whether the claim is current, historical, stale, inferred, or supported by original message evidence,
- prefer file-backed canonical artifacts for exact implementation details,
- disclose when graph data has not been reverified against current files or runtime state.

Load `references/troubleshooting.md` only for routing, certificate, driver, quoting, MCP, or local-fallback failures. Do not retry a disproven connection path repeatedly.

## Result Contract

Report, when relevant, the target and operation type, what was read or written, source/freshness, read-back evidence for writes, excluded sensitive or low-value material, and any remaining staleness, capacity, fallback, or user-decision boundary.
