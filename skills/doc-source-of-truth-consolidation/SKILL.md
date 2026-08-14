---
name: doc-source-of-truth-consolidation
description: Consolidate a noisy, conflicting, or agent-polluted documentation set into explicit sources of truth. Use when several documents compete over product promise, business rules, technical direction, execution scope, or current decisions; when original user intent and agent output are mixed; or when the user asks to design or repair documentation authority. Do not use for a simple rewrite, summary, translation, or isolated document edit.
---

# Doc Source Of Truth Consolidation

Reduce judgment conflicts, not merely file count. Preserve provenance and make it clear which artifact governs each decision domain.

## Decision Model

Judge each claim through four lenses:

1. **Domain**: product promise, business rule, technical architecture, execution stage, research, decision history, or navigation?
2. **Normative authority**: what has the user or accepted canonical source decided should be true?
3. **Descriptive evidence**: what do current code, runtime, tests, prototypes, and delivery artifacts prove is true now?
4. **Provenance and role**: who produced the statement, for which phase, and is it active, historical, exploratory, or superseded?

Do not let current implementation silently redefine product intent. Conversely, do not report a promised capability as implemented when runtime evidence contradicts it.

## Authority And Preservation

- A request to inspect, map, review, or recommend is read-only.
- A request to consolidate or reorganize authorizes scoped documentation edits, not deletion, unrelated code/config changes, Git publication, or product-rule invention.
- Archive disputed or superseded material rather than deleting it unless deletion is explicitly requested.
- Preserve user-originated ideas as user-originated ideas; do not polish them into confirmed agent conclusions.
- Preserve Obsidian wikilinks and existing encoding unless the project requires a migration.

## Source Map

Choose one governing source per decision domain. Overviews should normally route to authoritative sources rather than restating them. Keep:

- durable product and business rules outside stage-bound demo or UI specs,
- research and inspiration separate from commitments,
- implementation and QA instructions linked to, not copied from, permanent rules,
- historical records searchable but visibly non-authoritative.

The newest file does not automatically win. A newer agent summary may be less authoritative than an older accepted decision. A newer runtime artifact may prove current behavior without proving intended behavior.

## Conflict Handling

Load `references/conflict-arbitration.md` when two sources disagree, their authority is unclear, or migration would promote one statement over another.

Resolve a conflict directly only when current evidence and authority agree. Ask the user when the answer changes product promise, business logic, data ownership, technical direction, research route, scope, or acceptance.

## Migration And Evidence

When edits are authorized:

- keep the live source map current-state oriented,
- merge only claims with clear authority,
- label archived material and historical citations explicitly,
- repair active links that still treat archived files as current,
- search for superseded names and duplicated authoritative claims,
- verify important Chinese text with strict UTF-8 when rendering is suspicious.

Report the resulting source map, conflicts resolved, decisions still needing the user, archived material, validation evidence, and any remaining local or publication boundary. Do not commit or push unless separately authorized.
