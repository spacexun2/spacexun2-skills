---
name: frontier-skill-creator
description: Use only when the user explicitly names `$frontier-skill-creator` or asks to apply the frontier-model, intent-first, intelligence-dense method to create, refactor, or evaluate a personal or project Claude Code skill. Preserve the current supported skill structure and validation while removing generic procedure, ceremony, duplicated knowledge, and speculative completeness. Do not use for ordinary skill installation, plugin creation, or routine use of an existing skill.
---

# Frontier Skill Creator

Create living skills that give a capable model the right context, judgment boundaries, authority, and evidence contract without teaching it ordinary reasoning.

Use the currently installed official `$skill-creator` for current packaging, scaffolding, metadata, and validator mechanics when available in Claude Code. This skill governs content design. Do not modify or shadow a system-managed or plugin-provided skill by default; create a distinctly named personal or project skill so upstream updates remain available.

## Core Standard

Optimize for leverage, not completeness or minimum length:

```text
skill value
= non-inferable intelligence
+ durable user intent and preferences
+ authority and risk boundaries
+ cross-agent or cross-human protocols
+ decision lenses proven to change outcomes
- generic task instructions
- ceremonial process
- duplicated context
- speculative edge-case coverage
```

A good skill behaves like a local constitution, field briefing, and collaboration protocol—not an employee handbook for the model.

## Provenance And Scope

Inspect the current target before changing it. Identify whether it is system-managed, plugin-provided, global personal, project-local, archived, or generated, and which source owns its format and behavior.

- Treat system-managed and plugin-provided skills as updateable upstream assets. Preserve them and prefer a personal overlay, complementary skill, or distinct fork unless the user explicitly accepts overwrite and collision risk.
- Back up a user-owned skill before substantial refactoring and verify the backup independently.
- Recheck current files, bundled references, metadata, and applicable local instructions. Prior chat and memory are routing hints, not proof of current state.
- Avoid duplicate skill names and overlapping implicit triggers unless precedence is known and the collision is intentional.

## Instruction Value Test

Keep content when it provides at least one of these:

- **Intent or completion contract**: the user-visible outcome, canonical source, or claim the skill must protect.
- **Private intelligence**: stable project, environment, tool, historical, or preference knowledge the model cannot safely infer.
- **Authority or red line**: what the agent may inspect, change, publish, spend, delete, or escalate.
- **Coordination protocol**: responsibility, handoff, evidence, or state semantics shared across people or agents.
- **Decision lens**: a compact model that repeatedly exposes consequential blind spots or prevents known drift.
- **Fragile deterministic behavior**: exact handling required because mistakes are destructive, expensive, security-sensitive, or difficult to reverse.

Remove, derive, or relocate content that merely restates general model knowledge, forces ordinary step order, requires fixed question counts or padded formats, duplicates another source, exposes hidden reasoning, or catalogs hypothetical cases without evidence of value.

For each disputed instruction, ask:

1. Could a capable model infer this from the request and current evidence?
2. Does it encode user authority, non-obvious local truth, a stable protocol, a known failure, or a high-impact boundary?
3. Must every invocation know it, or is it conditional?
4. Is natural-language freedom appropriate, or does the risk justify a deterministic script or exact guardrail?

## Skill Architecture

- Put precise positive and negative trigger conditions in frontmatter. Use explicit invocation when the workflow is expensive, intrusive, adversarial, or likely to collide with ordinary work.
- Keep `SKILL.md` to the always-needed outcome, source priority, decision model, authority, evidence, user communication, and reference routing. Brevity is a consequence of relevance, not a target by itself.
- Put stable private profiles, question banks, templates, variants, and low-frequency playbooks in directly linked references with clear loading conditions.
- Put repeated deterministic transformations or fragile mechanics in tested scripts. Do not copy upstream scripts merely to make a personal philosophy self-contained.
- Include assets only when they are used in the produced artifact. Avoid auxiliary README, changelog, and process-history files.
- Keep each fact in one canonical place. If runtime behavior derives from a skill or reference, preserve a stable source anchor or drift check.

Load `references/value-audit.md` only for substantial review, modernization, or when it is unclear what should stay in the main file.

Load `references/pattern-guided-workflow-skills.md` only when the skill derives material value from accumulated experience patterns, retrospective judgment, diagnosis, audit, adaptive review, or recurring failure recognition.

## Design Loop

Use a compact control loop:

```text
real task or failure -> current behavior -> smallest durable intervention
-> realistic evidence -> remaining gap -> correction
```

Start from working examples, actual drift, repeated coordination needs, private context, or high-impact risk—not an imagined need to cover every possibility. Add a rule only when it protects the core outcome, preserves authority, captures non-inferable intelligence, or responds to meaningful evidence.

Clarify user-owned choices only when they change trigger scope, product promise, mutation authority, cost, evidence, or the intended output. Give a recommended default and explain the consequence in natural language. Unknown lenses may be used internally to find blind spots, but never force the taxonomy into the user's chat or fill it for ceremony.

Do not run independent-model forward tests by default. Prefer deterministic validation, current artifacts, and real user feedback. Run an independent-model forward test only when the user explicitly requests it; if an exceptional high-risk or uncertain behavior makes one worth recommending, explain the reason and obtain approval before starting. When authorized, use realistic raw tasks and compare transfer behavior rather than compliance with the intended answer.

## Validation Contract

Validate package integrity for every change. Add behavioral evidence only when the changed surface or consequence justifies it:

- Confirm folder name, frontmatter, direct reference paths, scripts, assets, and any Claude Code metadata against the current supported format.
- Run the installed validator and execute added scripts on representative inputs.
- Verify important text with strict UTF-8 and check line endings, replacement characters, and whitespace when relevant.
- Test a positive and nearby negative prompt when creating or changing trigger conditions, or when collision risk is material. Do not require trigger tests for changes with no plausible effect on invocation.
- Compare representative behavior before and after only when instruction changes can materially affect decisions or outcomes. For risky changed behavior, test the authority or stop boundary most likely to fail.
- Do not manufacture behavioral tests for formatting, packaging, or other changes without a plausible transfer risk. Do not equate fewer lines with improvement.
- Report provenance, backup, validation evidence, known gaps, and whether the result depends on an upstream system skill that may update.

## Living Maintenance

Treat review findings as hypotheses, not automatic additions. Incorporate them when real usage, repeated failure, non-inferable local knowledge, or high-impact risk justifies the context cost. Retire instructions that capable models reliably internalize, archive superseded versions, and keep the live skill focused on current truth.
