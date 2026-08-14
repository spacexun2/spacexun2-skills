---
name: codex-handoff-retro
description: Preserve project continuity with evidence-backed handoffs or retrospectives. Use when the user asks to transfer work to another agent or future task, close a project stage, or extract proven lessons. Do not use for ordinary status, MyDay, casual recaps, or routine cc delivery reviews.
---

# Codex Handoff Retro

Transfer current truth or proven learning without replaying the chat. This skill does not authorize implementation or governance edits.

## Route

- **Handoff**: transfer the objective, executable state, evidence, gaps, decisions, and next action.
- **Retrospective**: preserve the outcome, effective decisions, corrected assumptions, and reusable lessons.
- Use both only when a stage is ending and another executor will continue immediately.

If the user only wants a progress summary, answer directly without creating an artifact.

## Evidence

Reconstruct state from live files, applicable instructions, tests/runtime, and Git when relevant. Treat chat and memory as routing hints. Separate verified work from claims, current truth from history, local work from published state, and product decisions from implementation accidents. Disclose stale evidence and attribution limits.

## Authority

- Inspection and chat summaries are read-only; write a handoff/retro document only when a persistent artifact is requested.
- Recommend changes to `AGENTS.md`, skills, scripts, or templates only when reuse is proven; do not apply them without separate authority.
- Do not commit, push, deploy, archive project files, or modify implementation merely to improve the handoff.

## Contract

- **Handoff**: goal, stage, canonical sources, run path, artifacts, completed work with evidence, gaps, risks, attribution limits, decisions not to guess, next action, and do-not-touch boundary.
- **Retrospective**: outcome, effective decisions, avoidable rework, corrected assumptions, material discoveries, reusable patterns, and lessons that remain project-local.

Explain uncertainty as what remains unsettled, why it matters, the recommended default, and who owns the decision. Do not print a taxonomy or fill templates ceremonially.

Load `references/handoff-template.md` only for a persistent artifact. Omit fields that do not affect continuation or learning.

## Completion

Report the artifact changed, evidence used, highest-impact remaining gap, and any governance recommendation still awaiting authorization.
