# spacexun2 Skills

[中文](README.md) | **English**

After upgrading to GPT‑5.6 Sol, I rebuilt the Skills I use in my daily work. They grew out of hands-on experience with complex projects, cross-agent handoffs, and repeated course corrections.

Skills written during the GPT‑5.5 era often drifted toward over-engineering. Defensive rules accumulated, workflows became increasingly detailed, and the result started to resemble an operating manual that the Agent had to follow line by line. Stronger models can already handle many of those generic steps. The most valuable additions now are the user intent, project facts, experience patterns, authority boundaries, and completion criteria that the model cannot know on its own.

This iteration combines my long-term practice with a growing body of shared experience in the Agent community. I rebuilt the Skills with `$frontier-skill-creator`: spend less context prescribing generic reasoning, provide more high-value context, reduce mechanical constraints, and clarify the real objective and decision boundaries. The goal is to help the Agent understand more accurately, exercise stronger judgment, and complete the full task reliably.

These lessons currently come primarily from my daily use of GPT‑5.6 Sol, with more limited evidence for other models. Adapting this methodology starts by examining the target model's capabilities, behavior, and recurring failure modes, then deciding which instructions to remove, retain, or add.

Each Skill responds to a problem I have encountered repeatedly: an Agent starts acting before it understands the intent, silently narrows the objective, over-engineers a simple problem, repeatedly reloads context for complex work, substitutes verification for the user-visible outcome, crosses a human decision boundary while being proactive, or loses previously established experience in a new session.

## Quick Start

The repository works with the open Agent Skills CLI. List all 13 Skills directly:

```powershell
npx skills add spacexun2/spacexun2-skills --list
```

Or install only the Skill you need:

```powershell
npx skills add spacexun2/spacexun2-skills --skill control-loop-harness -g -a codex -y
npx skills add spacexun2/spacexun2-skills --skill frontier-skill-creator -g -a codex -y
npx skills add spacexun2/spacexun2-skills --skill codex-grill-me -g -a codex -y
```

These commands install the canonical Codex Skills from the repository. Use `install.ps1` below when you also want the Codex global instructions and the adapted Claude Code versions.

### Three Good Places to Start

| Situation | Skill | How it intervenes |
| --- | --- | --- |
| The Agent has started working, while adding unapproved architecture and validation machinery and shrinking the full feature into a minimum loop | [`control-loop-harness`](skills/control-loop-harness/SKILL.md) | Returns to the original objective, checks current evidence read-only, and reports drift, judgment, and recommendations before any correction. This project-neutral composite condenses a recurring pattern from daily use. |
| A Skill has grown into a defensive, exhaustive operating manual | [`frontier-skill-creator`](skills/frontier-skill-creator/SKILL.md) | Reassesses which instructions carry irreplaceable intelligence value and removes generic reasoning, procedural ceremony, and low-frequency material from the core context. |
| Important work has not started, and you want the Agent to inspect evidence, understand the real intent, and reduce your decision burden | [`codex-grill-me`](skills/codex-grill-me/SKILL.md) | Produces an alignment brief in language suited to human understanding and decisions, states the Agent's own judgment and recommendation, and leaves only material choices to the user. |

## Skill Catalog

### 1. [`control-loop-harness`](skills/control-loop-harness/SKILL.md)

- **When to use:** Work is already underway, but the Agent seems to have misunderstood the original intent, started doing extra work, over-engineered the solution, reduced the full objective, or needs to review the entire development history.
- **How to invoke:** `Use $control-loop-harness. Stop the affected work and perform a read-only check of whether <specific direction> has drifted from my original request. Do not modify anything.` Ask for a “global retrospective” when you want the full history reviewed; otherwise it inspects only the local issue you named.
- **What it can do:** Recover the objective from the original request, approved changes, and current file or runtime evidence; examine scope reduction, over-design, Agent initiative and authority, ROI, or multi-capability completion; and provide an evidence-backed independent judgment and recommendation. In focused correction, it actively traces causes, connected consequences, and new issues within the requested observation range. In a panoramic retrospective, it uses experience patterns and then makes an open pass for consequential evidence outside the library. At the same time, it promotes only evidence-supported candidates to findings and reports its judgment and recommendation before any scope expansion or correction.

### 2. [`frontier-skill-creator`](skills/frontier-skill-creator/SKILL.md)

- **When to use:** Create a personal or project Skill, refactor one that has become long or template-driven, or review whether it still suits a frontier model.
- **How to invoke:** `Use $frontier-skill-creator. Back up and review <Skill path>, remove workflows the model can already infer, and move low-frequency experience into on-demand references. Do not overwrite a system Skill.` Continue using the official Skill tools for packaging, metadata, and validation.
- **What it can do:** Review trigger accuracy; decide what belongs in `SKILL.md`, references, scripts, and assets; remove generic tutorials, duplicated sources of truth, fixed question counts, and speculative completeness; and validate structure and encoding. It is a “Skill for creating Skills,” built around frontier-model capability, context cost, and probabilistic behavior. Its goal is higher intelligence density with more context available for model judgment.

### 3. [`codex-grill-me`](skills/codex-grill-me/SKILL.md)

- **When to use:** Important work has not started and you suspect the Agent understands the literal request but has missed the outcome you actually want. It is especially useful when the context is extensive: the Agent digests available evidence and briefs you, leaving you to confirm only the material choices.
- **How to invoke:** `Use $codex-grill-me. Read the available project evidence first, then brief me in language suited to human understanding and decision-making: the necessary background, your understanding of the real objective, verified facts, likely points of drift, your judgment and recommendation, and the few decisions that genuinely require my confirmation. Stay read-only and wait for approval before starting.`
- **What it can do:** Read discoverable files, documents, screenshots, and runtime evidence; synthesize complex context into a decision-ready alignment brief; extract the material needed for judgment; and state the Agent's own judgment, recommendation, reasoning, and consequences of each option. The user can usually respond with `OK`, `mostly OK, but...`, or a few corrections, while the Agent carries the preceding requirements analysis and solution framing.
- **How it differs from the original popular `grill-me`:** Early versions focused on whether the Agent asked enough questions and often used a questionnaire to make the user complete the requirements. This version asks the Agent to investigate and reason first, then report the necessary context and its own view in language suited to human decisions. Question count and treatment of unknowns adapt to the available evidence. The Agent carries the burden of fact gathering, context synthesis, option comparison, and an initial recommendation; the user receives only the decisions that materially affect the product promise, architecture, data ownership, cost, scope, or acceptance criteria.

### 4. [`goal-prompt-builder`](skills/goal-prompt-builder/SKILL.md)

- **When to use:** Draft, compress, or correct a Codex Goal or `/goal` objective, especially for long-running work, cross-agent continuation, an existing handoff, or a context-heavy task.
- **How to invoke:** `Use $goal-prompt-builder. Build a copyable /goal from the current handoff and accepted baseline. Preserve the full outcome, stop conditions, and completion boundary; do not rewrite existing specifications.`
- **What it can do:** Choose between a context-bound and self-contained Goal; inherit the accepted baseline plus Remaining delta; route project detail through reliable sources of truth; define stop-and-ask conditions, path-specific stops, and completion blockers; keep the completion denominator stable; and append the Goal runtime-usage reporting line.
- **What changed in this version:** A Goal takes the form suited to its context while preserving the full outcome and a stable completion boundary. New discoveries are reported with their scope impact, and history is loaded through the accepted baseline plus Remaining delta.

### 5. [`cc-cooperate`](skills/cc-cooperate/SKILL.md)

- **When to use:** Codex should own objective understanding, scope, and acceptance while Claude Code / cc executes a bounded, verifiable implementation task.
- **How to invoke:** `Use $cc-cooperate. Prepare a light / strict collaboration package and a short prompt for cc for <task>. Do not start cc yet.` If cc has already delivered, ask for an independent review against the same package.
- **What it can do:** Choose direct execution, a light package, or a strict package based on risk; create or maintain the project's single `docs/CODEX_CC_PACKAGE.md`; specify sources of truth, Git baseline, allowed and forbidden files, unknowns, stop conditions, verification, and the `CC_DELIVERY` format; then compare the actual diff, scope, and self-reported results. Codex returns pass, partial pass, or fail and owns the commit or deployment decision.

### 6. [`doc-source-of-truth-consolidation`](skills/doc-source-of-truth-consolidation/SKILL.md)

- **When to use:** Product, technical, or execution documents conflict; the user's intent is mixed with Agent output; or the current authority is unclear.
- **How to invoke:** `Use $doc-source-of-truth-consolidation. Perform a read-only review of source authority and conflicts in <directory>. After confirmation, consolidate the current SOT, archive history, and repair links.`
- **What it can do:** Build a source map across product promises, business rules, architecture, execution phase, research, and history; separate normative authority (“what should be true”) from descriptive evidence (“what is currently implemented”); record both sides of a conflict, its phase, contamination source, and recommended ruling; and, after authorization, consolidate accepted conclusions, mark archives, and repair active links that still point to an obsolete source.

### 7. [`codex-handoff-retro`](skills/codex-handoff-retro/SKILL.md)

- **When to use:** A phase has ended, another Agent or session will take over, a formal handoff is needed, or verified lessons from the work should be preserved.
- **How to invoke:** `Use $codex-handoff-retro to write a Handoff for <project / phase>`, or explicitly request a `Retrospective`. It writes a persistent file only when one is needed.
- **What it can do:** A Handoff records the current objective, phase, sources of truth, runtime method, important artifacts, completed evidence, remaining gaps, next step, and do-not-touch boundaries. A Retro records effective decisions, causes of rework, assumptions corrected by implementation, reusable patterns, and lessons that should remain project-local. The handoff stays focused on actionable state and durable experience, while full chats and routine status reports remain in their original records.

### 8. [`git-layered-cleanup`](skills/git-layered-cleanup/SKILL.md)

- **When to use:** A worktree is noisy and mixes user changes, generated files, media, sensitive content, nested repositories, ahead commits, or unclear commit and push intent.
- **How to invoke:** `Use $git-layered-cleanup. Perform a read-only inventory of ownership, publication intent, and risk for every repository and file under <path>. Do not delete or push anything; present a layered plan first.` Stage, commit, push, and fragile operations can then be authorized separately.
- **What it can do:** Identify independent repositories, submodules, and subtree boundaries; classify files for commit, local-only retention, ignore, untracking, or user decision; protect secrets and existing user work; create intentionally scoped commits after authorization; and verify HEAD, remaining status, upstream state, and remote publication separately. History rewrites, reset, force push, deletion, and stash each require explicit authority and a recovery path.

### 9. [`prototype-user-journey-audit`](skills/prototype-user-journey-audit/SKILL.md)

- **When to use:** Determine whether a prototype, demo, or implemented path actually lets the target user complete the promised outcome, beyond visual polish, the existence of a backend, or a passing build.
- **How to invoke:** `Use $prototype-user-journey-audit. Walk the real user loop for <target user> from <entry> to <expected outcome>. Stay read-only and do not expand the review to the entire product.` Provide the runnable entry point and approved prototype or specification when available.
- **What it can do:** Follow `user intent → visible action → product handling / judgment → visible result → state / record → return or next step`; identify consequence-free controls, decorative AI, fake persistence, context loss, fixture leakage, and evidence substitution; and report whether the loop closes, the decisive evidence, the highest-leverage correction, and the remaining unverified boundary. Mock data may replace the data source, but it cannot replace the business rules or visible consequences.

### 10. [`fable5-delegation`](skills/fable5-delegation/SKILL.md)

- **When to use:** Project context is distributed across code, documents, and historical decisions, and you want Fable 5 to perform an independent product, architecture, design, strategy, or project-recovery review. It can also assess whether the high-cost call is worthwhile.
- **How to invoke:** `Use $fable5-delegation. Read the current project evidence and prepare a low-anchoring review package and one-shot prompt for Fable 5. Do not pre-decide its conclusion and do not call Fable.`
- **What it can do:** Select an independent review, architecture ruling, blind-spot review, product strategy, design critique, or project-recovery mode; prepare a `Fable 5 Task Brief` with code, documentation, evidence entry points, and authority boundaries; scan a directory or ZIP for credential risk, duplicates, and oversized files; and, after Fable responds, re-check high-impact claims and classify them in a decision ledger as accepted, needs-decision, needs-evidence, rejected, or later before converting them into low-cost execution tasks.
- **Why the roles are separated:** Codex recovers the facts and prepares the review package; Fable 5 spends its scarce capacity on global judgment; routine implementation and document collection stay with the execution path best suited to them. Fable 5's advice then returns to canonical sources and evidence for verification.

### 11. [`neo4j-agent-memory`](skills/neo4j-agent-memory/SKILL.md)

- **When to use:** Store important facts, preferences, decisions, project state, artifacts, and next actions in an external graph memory; recall them across devices or sessions; or ingest a high-value thread or topic into retrievable relationships.
- **How to invoke:** Configure Neo4j AuraDB through environment variables or a machine-local profile, then say: `Use $neo4j-agent-memory. Recall the current decisions and next actions for <topic> from AuraDB. This request is read-only.` For writes, explicitly request Remember or Ingest and specify the allowed scope.
- **What it can do:** **Recall** targeted Topic, Conversation, SessionMemory, Decision, Fact, Preference, NextAction, Artifact, and related nodes with source, recency, and uncertainty; **Remember** one structured item through a stable id and relationships; **Ingest** a thread or session into Conversation, MemoryChunk, facts, decisions, artifacts, and the necessary raw evidence. Every external write is read back. The public repository includes only AuraDB configuration templates, with no instance identifiers or credentials.

### 12. [`neo4j-memory-compaction`](skills/neo4j-memory-compaction/SKILL.md)

- **When to use:** Agent memory in AuraDB contains duplicates, stale actions, short-lived artifacts, raw conversation noise, or harmful over-compression and needs auditing, planning, cleanup, or recovery.
- **How to invoke:** `Use $neo4j-memory-compaction. Connect to the current Neo4j memory and perform a read-only audit of compaction candidates within <scope>. Do not delete anything.` Execute begins only after the candidate scope is accepted; recovery requires an identified recovery package.
- **What it can do:** Preview candidate nodes, relationships, semantic coverage, and before counts; create an affected-subgraph or full-graph recovery package proportional to the impact; establish a summary, provenance, or stable recovery path before deletion; merge, archive, downgrade, or delete through small transactions; and prove through exact counts, read-back, and representative retrieval that the current state, decision rationale, and real next steps remain usable. The objective is better retrieval semantics, not zero nodes or zero Message records.

### 13. [`enfp-writing`](skills/enfp-writing/SKILL.md)

- **When to use:** Turn travel, outdoor experience, relationships, retrospection, letters, first-person stories, or character monologues into Chinese writing with a vivid subjective presence and layered feeling; it also supports diagnosis and local revision of an existing draft.
- **How to invoke:** `Use $enfp-writing. Write a first-person piece from these materials. Preserve factual boundaries and my confirmed lines, then let the people, feelings, and concrete connections of the moment unfold naturally.`
- **What it can do:** Organize material around people and what matters to the narrator, letting scenery, action, spoken words, and association move both feeling and understanding. Lyrical language grows from what is actually present, while the author's judgment, humor, and complex affection keep their own provenance. It also provides nonfiction boundaries and a method for collaborative revision. ENFP is a creative lens for feeling, connection, people, and open possibility—not a fixed personality voice.

## Design Principles

- Preserve intent, experience, protocols, and risk boundaries that the model cannot safely infer; remove generic tutorials and process theater.
- Keep information needed on every invocation in `SKILL.md`; move low-frequency methods and environment differences to on-demand references.
- Let the Agent discover and propose better options. Before changing the product promise, data ownership, cost, destructive scope, or acceptance criteria, explain the finding to the user.
- Choose the smallest correct architecture that delivers the current outcome. Keep the full objective intact and avoid abstractions, process, or fallbacks for imagined requirements.
- Treat edited, tested, committed, deployed, published, and live-verified as distinct facts.
- Let current evidence determine the response shape, and let the complete user outcome set the boundary for a minimal implementation.

## Codex and Claude Code

`skills/` is the canonical source for the public Skills. Claude Code reuses the same content by default; files appear in `claude-overlays/` only when platform semantics genuinely differ.

- `cc-cooperate` belongs to the Codex coordination and acceptance role and is not migrated to Claude Code.
- `goal-prompt-builder` depends on Codex Goal and `/goal` semantics and is not migrated to Claude Code.
- `agents/openai.yaml` is used only by the Codex Skill UI and is not copied to Claude Code.
- All other adaptation and retirement mappings are recorded in `manifest.json`.

## Installation and Validation

`install.ps1` installs the Codex Skills listed in the manifest and synchronizes the corresponding Claude Code adaptations.

```powershell
pwsh -File .\scripts\validate.ps1
pwsh -File .\scripts\install.ps1 -WhatIf
pwsh -File .\scripts\install.ps1
pwsh -File .\scripts\status.ps1
```

`install.ps1` manages only the items listed in the manifest. Before replacement, it backs up affected content to `harness-backups/<timestamp>` under the corresponding runtime directory. Other unmanaged Skills are left untouched.
