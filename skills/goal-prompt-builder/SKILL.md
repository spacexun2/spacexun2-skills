---
name: goal-prompt-builder
description: Draft, review, refine, or compress a Codex Goal objective or copyable `/goal` prompt. Use when the user explicitly asks for a Goal, goal objective, or `/goal` text. Build the smallest complete execution contract for the available context; preserve the full outcome, inherit valid baselines for continuation work, prevent unreported over-design or scope expansion, keep stop and completion semantics explicit, and append the required runtime-usage footer. Do not trigger merely because work is long-running, the user says to keep working, or the task involves ordinary planning, implementation, automation, or runtime correction.
---

# Goal Prompt Builder

Draft an execution contract, not a project dossier:

```text
Goal
= irreducible outcome
+ reliable context and source routing
+ valid inherited baseline and remaining delta, when applicable
+ prompt-primary authority
+ scope-evolution and stop boundaries
+ stable completion boundary
```

## Recover The Contract

- Preserve every distinct user-visible outcome, named capability, and material boundary. Do not reduce a full request to an MVP, thin slice, backend path, document, build, or safest engineering subset without approval.
- Separate outcomes from prerequisites and evidence. Tests, deployment, smoke checks, and blocker fixes may support completion; they do not replace a broader promised result.
- Preserve ownership of exact behavior. Point to an accessible specification, prototype, prompt contract, schema, API contract, capability matrix, or runtime module instead of rewriting it into a second source of truth.
- Keep current-user facts visible when their authority does not come from durable context: overrides, temporary scope, destructive or publication authority, paid usage, security or data decisions, stop conditions, and completion blockers.
- Do not freeze architecture, libraries, workflow details, or defensive mechanisms unless the user or a canonical source requires them.
- Ask only when a missing answer changes the outcome, source ownership, baseline trust, material authority, scope evolution, stop behavior, or acceptance. Infer ordinary implementation details from current evidence.

## Fit The Available Context

- Use a **context-bound Goal** when the executor can reliably access the current workspace, governing sources, Handoff, execution brief, evidence ledger, or decision records. Route to those sources instead of reproducing them.
- Treat a continuation or handoff as a context-bound Goal with an inherited baseline, not as a fresh independent audit.
- Use a **self-contained Goal** only when it must cross a boundary without its governing context, source availability is uncertain, or the user explicitly requests a standalone package.
- Self-contained does not authorize plausible reconstruction. Inline only supported behavior and authority; request an essential missing source or mark it unresolved rather than inventing detail.
- Inspect accessible context instead of asking the user to classify what current files already establish.

## Inherit Baselines And Validate The Delta

For continuation, handoff, migration, deployment, or post-acceptance work:

- Start from the narrowest current execution brief, Handoff, evidence ledger, and live repository or environment state that establish the baseline and Remaining delta. Load deeper specifications only when the delta requires their exact contract.
- Check whether evidence is bound to the relevant commit or tree, environment, configuration, and product contract. If the production surface relevant to that evidence has not changed, inherit it as current.
- Revalidate only the affected surface when relevant code, environment, configuration, or contract changed; evidence lacks a trustworthy binding or has become stale; a regression is observed; or an explicit target-environment gate requires it.
- A new agent, a desire for independence, low test cost, or a new commit that changes only unrelated surfaces is not sufficient reason to reread all sources, search history, rerun every gate, or repeat accepted user journeys.
- Preserve unresolved or searched-without-evidence states until a new evidence source appears. Do not turn handoff into repeated archive, prior-thread, memory, or raw-log searches.
- If no trustworthy baseline exists, require only the minimum verification needed to establish one; do not default to exhaustive reconstruction.

## Govern Discovery And Scope Evolution

The core principle is to prevent over-design from being implemented before it is reported and aligned with the user.

- Discover actively, challenge the plan, and recommend candidly. Discovery is not execution authority and does not automatically expand the Goal or its completion denominator.
- Handle ordinary defects inside the approved outcome autonomously.
- A newly found issue becomes a completion blocker only when it directly violates the approved outcome or acceptance, creates a material security, data-loss, uncontrolled-cost, or destructive risk, or the user promotes it into scope.
- Before updating the Plan or implementing a proposal that adds capabilities, blockers, acceptance items, reliability levels, generalized infrastructure, or material schedule, cost, architecture, data-ownership, or completion-boundary changes, report the evidence, impact, expected benefit, material cost, and recommendation, then obtain user alignment.
- Pause only the affected expansion path. Continue unrelated in-scope work.

## Preserve Stop And Completion Semantics

Distinguish only the effects the task actually needs:

- **Stop and ask**: continuing requires new user authority or a material decision.
- **Stop the current path**: one route may not continue or be silently replaced; unrelated work may proceed.
- **Completion blocker**: other work may proceed, but the Goal cannot be declared complete.

Render every applicable condition explicitly and separately from ordinary autonomy prose. Omit empty categories, but do not compress supported conditions into “ask when needed.” Do not turn ordinary bugs, failed tests, investigation, reversible choices, or rough edges into stop conditions.

When a Goal may reach a required action that only the user or an external operator can perform, such as Pull, deployment, authorization, publication, or an environment transition, render the wait behavior explicitly:

- Finish all independent in-scope work before yielding. When the Remaining delta depends only on that external action, pause the Goal before returning control if the runtime supports Goal pause.
- Do not let automatic Goal continuations poll, repeat the same confirmation request, or reopen accepted work while waiting.
- If Goal pause is unavailable, follow the runtime's blocker rules; do not fabricate a pause directive or mark the Goal blocked earlier than those rules allow.
- After confirmation, resume from the accepted baseline and Remaining delta. Do not restart source loading, historical searches, or unaffected acceptance.

Keep the completion denominator stable. Completion means the approved outcome and acceptance boundary are satisfied with evidence appropriate to their claims; it does not mean that repeated audits can no longer find any possible improvement.

## Keep Goal, Plan, And Control Loop Distinct

- The Goal defines outcome, authority, inherited baseline, scope evolution, stops, and completion.
- The Plan chooses and updates the implementation route.
- The control loop compares evidence with the original objective and corrects drift.

Remove source inventories, Wave mechanics, command order, retry policy, routine document maintenance, and intermediate checklists from a context-bound Goal unless the route itself is a prompt-primary constraint. Do not copy an existing capability matrix into the Goal; keep it current when it is the established evidence surface.

## Use Conditional References

- Read [references/goal-patterns.md](references/goal-patterns.md) for complex, multi-capability, continuation, handoff, audit-like, batch, source-driven, or failure-prone Goal requests. Treat patterns as hypotheses, not output slots.
- Read [references/compact-goals.md](references/compact-goals.md) only when the user requests extra compression, a short copyable command, or an explicit character or token limit.

## Render And Act

- Match the requested artifact: objective text, structured Goal, review notes, revised prompt, or copyable `/goal` command. Do not force a heading order, question count, acceptance count, score, or stop-condition count.
- Prefer direct, copyable output and explain only consequential choices or unresolved assumptions.
- Preserve user syntax when revising an existing command. Verify inspectable runtime mechanics rather than hardcoding a remembered Codex version, hidden file, command, or repository state.
- Include a numeric token budget only when the user explicitly requests one or the current interface requires it; do not guess from task type.
- End every executable Goal objective or copyable `/goal` prompt with this exact final line: `请汇报当前 Goal 的 tokensUsed、timeUsedSeconds 和 token budget。` Address it to the future executing thread; do not answer it while drafting. Count it under an explicit length limit.
- Draft or review by default. Create or start a Goal only when the user explicitly asks for that state change.

## Adjacent Skills

- Use `control-loop-harness` for explicit runtime correction or retrospective review against the original request.
- Use `codex-grill-me` for adversarial pressure-testing before execution.
- Do not absorb their workflows merely because the Goal may later be executed through them.
