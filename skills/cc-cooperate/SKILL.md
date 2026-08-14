---
name: cc-cooperate
description: Use when the user wants Codex to prepare, run, or review a scoped execution package for cc, Claude Code, or another executor, especially “Codex 规划/口径对齐/验收，cc 执行/交付”. Preserve rich agent-facing unknowns while translating product, scope, and decision ambiguities into natural-language user alignment before handoff. Codex owns objective framing, scope, baseline attribution, acceptance, and deploy/commit decisions; cc executes bounded, verifiable tasks.
---

# cc-cooperate

Coordinate a Codex -> cc -> Codex loop through one project-level package, usually:

```text
docs/CODEX_CC_PACKAGE.md
```

Do not start cc or another runner unless the user explicitly asks for that operational step.

## Core Contract

- Codex owns objective framing, source-of-truth judgment, user alignment, allowed mutation scope, Git attribution, acceptance, and commit/deploy decisions.
- cc owns bounded implementation, relevant investigation, local self-checks, factual delivery, and surfacing discoveries.
- cc may inspect related files and propose a scope change, but may modify only allowed files unless Codex or the user expands the boundary.
- Stop and return to Codex when a discovery may change the product promise, canonical contract, data ownership, API/schema/auth/provider behavior, paid usage, deployment, major architecture, user-visible loop, scope, cost, or schedule.
- Do not accept work because the executor reports success. Acceptance belongs to Codex and requires current evidence.

## Choose Proportionate Cooperation

| Signal | Mode |
|---|---|
| Codex can finish and verify faster than preparing a handoff | `direct` |
| User explicitly wants cc to execute a bounded local task | `light` |
| Multiple files, low product risk, clear acceptance | `light` |
| Cross-module behavior, data writes, API/schema/auth/provider/deployment risk | `strict` |
| Product promise, customer-facing demo, paid calls, difficult rollback, or visual/user-journey risk | `strict` |

`direct` means Codex handles the task without creating a cc package. Use the smallest package that preserves the real risk boundary.

## Align Meaning Before Execution

Snapshot current files, commands, runtime evidence, and Git state before planning. Treat prior chat and memory as routing hints, not current proof. When sources conflict, do not assume the newest document is correct; align with the user when the conflict changes product meaning or rules.

Maintain the four unknown lenses inside the package when they expose useful blind spots:

- **Known knowns**: current facts, fixed constraints, and their evidence or canonical source.
- **Known unknowns**: unresolved facts or decisions and the cheapest useful probe.
- **Unknown knowns**: likely user preferences or prior decisions that are not captured clearly enough to execute safely.
- **Likely unknown unknowns**: plausible blind-spot hypotheses, why they matter, what drift they could cause, and the cheapest way to test them.

Do not fill categories for ceremony. Keep material items detailed enough for the next agent to investigate. Label hypotheses as hypotheses; do not promote them to facts without evidence.

Before handoff, translate an unknown into natural language for the user when it may change the product promise, canonical source, data ownership, user-visible loop, architecture, scope, cost, schedule, or acceptance. Explain:

1. What Codex currently believes the user is trying to achieve.
2. Which interpretation remains unsettled.
3. How the work could drift or require rework if the interpretation is wrong.
4. Codex's recommended interpretation and why.

Use product and user language rather than internal taxonomy. Give enough context for the user to decide without opening the package. A useful pattern is:

```text
我目前理解，你真正要的是……
这里还有一个没有定下来的口径……
如果理解错了，工作可能会偏向……，导致……
我的建议是……，因为……
需要你确认的是……
```

Do not mechanically dump the four-category register into chat. Group related technical questions under the underlying product or scope decision. Keep implementation-level unknowns in the package when Codex or cc can resolve them through cheap, reversible investigation.

If material alignment is required, do not hand work to cc until the user resolves it. Write the resolved wording back into the active package. Update the canonical source only when it is in scope or the user authorizes that edit.

## Live Package Contract

Use one live package per project. Preserve an established project control file when one already exists.

The live package should contain:

- Current objective and user-visible promise.
- Canonical sources and resolved alignment decisions.
- Mode and reason cooperation is worthwhile.
- Project path, package path, allowed files, forbidden files, and write boundaries.
- Stop and escalation conditions.
- Material four-lens unknowns, assumptions, and cheap probes.
- Validation and evidence requirements.
- Delivery format and the current cc delivery.
- Latest Codex acceptance.

Keep the live package current-state oriented. Before starting a new batch, archive completed batches, old deliveries, superseded assumptions, and old acceptance records. Carry forward only still-valid context, decisions, unresolved material unknowns, attribution facts, and acceptance constraints.

Do not create a separate `implementation-notes.md` by default. Avoid duplicating delivery information in both a report and a round log.

## User-Facing Chat Contract

The package is the agent working surface. Chat is the user's control surface.

The user should be able to understand the consequence and make any required decision from chat without reading the package. The package remains the detailed working and audit record, not required user reading.

Before handoff, chat should contain only:

- The outcome Codex believes the user wants.
- Any material interpretation that needs alignment, explained in natural language.
- Codex's recommendation and the consequence of choosing differently.
- If already aligned: mode, bounded task, mutation boundary, Codex acceptance responsibility, and the short cc prompt.

Do not summarize the full package, repeat known knowns, or expose every implementation hypothesis. Detail should follow decision consequence, not template size.

After acceptance, lead with outcome and report only independently verified evidence, material deviations or remaining gaps, and decisions requiring the user. Keep detailed checks and unknowns in the package unless the user asks for them.

## Execution Loop

1. Establish current evidence, Git baseline, original objective, and source priority.
2. Choose `direct`, `light`, or `strict`; build the material unknowns map.
3. Translate and resolve user-owned ambiguities before freezing the active brief.
4. Refresh the live package, preserving necessary context and archiving the previous completed batch.
5. Give the user a short cc prompt pointing to the project and package; do not duplicate the package in chat.
6. After delivery, inspect actual changes, compare them with allowed and claimed files, run the defined checks, and write the latest acceptance into the package.

## Progressive Loading

Load only the reference needed for the current step:

- Low-risk package: `references/light-package-template.md`.
- High-risk package: `references/strict-package-template.md`.
- Post-cc review: `references/acceptance-checklist.md`.

If no package is warranted, work directly and do not load the templates. Do not invoke another specialized audit merely because it is mentioned in a template; follow that skill's own trigger rule and confirm it is currently available. If a previously referenced audit has been archived or is unavailable, use risk-proportionate built-in checks and do not claim that specialized skill was used.

## Minimal Handoff Prompt

After the package is ready and material alignment is resolved, give the user a concise prompt:

```text
请在项目目录 <absolute project path> 执行当前 Codex / cc 协作包里的 active brief。

先读：
1. docs/CODEX_CC_PACKAGE.md
2. <latest handoff/context path, if any>

请只按 active brief、修改边界、停止条件和交付格式执行。可以调查相关文件并提出范围调整，但不要修改允许范围之外的文件。完成后把本轮 CC_DELIVERY 写入 package 指定位置并返回简短结果；Codex 负责独立验收。
```
