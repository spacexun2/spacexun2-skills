---
name: codex-grill-me
description: Explicit, user-invoked, evidence-backed alignment brief and pressure test for business, product, plan, workflow, or architecture decisions. Report the necessary context and the agent's own judgment in language suited to human understanding and decision-making, so the user can correct only the material decisions before execution. Use only when the user explicitly names `$codex-grill-me` or says “grill me”, “stress-test this”, “pressure-test this”, “deeply align”, “ask me the hard questions”, “先别执行，挑战一下”, “深度对齐”, “拷问我”, or “完整问题清单”. Do not activate from ambiguity, complexity, customer exposure, or high cost alone.
---

# Codex Grill Me

Create a deliberate, read-only pressure test and alignment brief before execution. Use language suited to human understanding and decision-making: introduce the necessary context, state the agent's own judgment and recommendation, and make the material user-owned decisions easy to accept or correct in one response.

## Non-Negotiable Boundary

- Treat invocation as permission to inspect and interview, not to mutate project or external state.
- Inspect current repo files, documents, screenshots, data, and runtime evidence when they can answer factual questions. Do not ask the user to repeat discoverable facts.
- Treat prior chat and memory as routing hints rather than current evidence. If sources conflict, explain the conflict; do not assume the newest source automatically wins.
- You may present provisional framing, options, recommendations, and a proposed next artifact. Do not implement, edit files, start runners, send messages, or freeze an implementation plan until the user accepts the alignment or explicitly asks to proceed.
- Do not turn pressure-testing into adversarial performance. Challenge ambiguity to protect the user's real outcome.

## One-Pass Contract

Default to one substantial, human-facing alignment brief rather than a slow one-question interview. Cover:

```text
我对目标的理解
做决定所需的关键事实与证据
可能走偏或需要推翻的假设
我对方向的判断与推荐默认值
我建议采用的执行偏好
需要你确认或纠正的关键决策
确认后进入的下一项产物或行动
```

Write for human understanding and decisions, not for internal completeness. Synthesize rather than dump source material, internal taxonomies, or raw investigation. Explain enough necessary context for the user to understand why the judgment follows, then state the agent's recommendation and the consequence of choosing differently. The user should not need to reopen the underlying files, reconstruct the analysis, or design the solution merely to respond.

Set no minimum question count. Ask every material user-owned decision once, grouped by the underlying product, business, or scope choice rather than by a generic questionnaire category. If evidence already resolves a branch, state the conclusion and do not ask it again.

For every important decision, include the agent's recommendation and the consequence of choosing differently. Make it easy to answer with `OK`, `mostly OK, but...`, numbered corrections, or a rewritten goal.

## Internal Unknowns Lens

Use the four lenses internally to find blind spots:

- **Known knowns**: explicit requirements, accepted constraints, current evidence, and canonical anchors.
- **Known unknowns**: unresolved facts or decisions already visible to the user or Claude Code.
- **Unknown knowns**: likely user-held preferences or prior decisions that are not captured clearly, including choices that may be easier to judge from a concrete variant.
- **Likely unknown unknowns**: plausible blind-spot hypotheses about historical traps, domain rules, data ownership, tool limits, hidden cost, or a smaller/better path; attach why each is plausible, the drift it could cause, and the cheapest useful probe.

Do not mechanically print the taxonomy unless the user asks for it. Translate material unknowns into natural language:

```text
我目前理解，你真正要的是……
这里还有一个可能改变方向的口径……
如果理解错了，工作可能会偏向……，导致……
我的建议是……，因为……
需要你确认的是……
```

Keep agent-resolvable implementation unknowns out of the question list. Ask the user when the answer changes product promise, architecture, data ownership, user-visible loop, irreversible or destructive scope, paid cost, schedule, or acceptance.

## Execution Bias

State the delivery bias when it changes the plan:

- **Full-effect first**: close the complete visible product loop first, then rank bugs and reliability gaps separately.
- **Reliability first**: stabilize a smaller accepted slice before expansion.
- **Evidence first**: inspect, research, or prototype before implementation.

When the user says “完整产品级”, “全量”, “先看到效果”, “后面 bug 再修”, “今晚开干”, or equivalent, recommend **Full-effect first** unless it risks irreversible data loss, uncontrolled paid usage, credential/security exposure, destructive unrelated changes, or a broken main user loop. Do not silently shrink a full-effect request into a safer engineering proxy.

## Pressure Method

Start with the decision that most changes the promise or implementation direction. Challenge feature-shaped answers until the user outcome is clear:

- Distinguish the feature from the pain or desired change.
- Distinguish a polished screen from the state or record that actually changes.
- Distinguish AI presence from the judgment AI must make and the action its output enables.
- Distinguish demo evidence from production capability.
- Distinguish the current non-negotiable outcome from useful later improvements.

Use `references/deep-question-bank.md` only when the task spans several of business viability, product workflow, data/trust, AI judgment, full-effect delivery, or acceptance—and current evidence does not already expose the material questions. Load only the relevant sections; never use the reference to pad the interview.

## Multi-Round Mode

Use multiple rounds only when the user explicitly requests step-by-step questioning, the first response exposes a major contradiction, or a remaining decision materially changes architecture, data ownership, customer promise, cost, or acceptance. Ask the smallest remaining decision cluster, not one question by habit.

## Decision Record And Exit

After the user responds, synthesize:

```text
Confirmed:
-

Corrections applied:
-

Still open:
- none | material decisions

Accepted defaults and execution bias:
-

Acceptance checks:
-

Next artifact or action:
-
```

Exit when the user accepts the alignment, explicitly asks to stop and proceed, or remaining unknowns no longer change product promise, architecture, data ownership, user-visible loop, cost, schedule, or acceptance. Proceed only when the user's original request or latest reply authorizes execution; otherwise stop with the decision record.

## Quality Check

Before sending the alignment brief, confirm:

- Discoverable facts were inspected instead of asked.
- Questions are tied to real decision consequences, with no minimum-count filler.
- Blind-spot hypotheses are labeled as hypotheses, not facts.
- Necessary context, the agent's judgment, and the recommendation are reported in language suited to human understanding and decision-making.
- Recommended defaults let the user correct only what is wrong.
- No project or external state was changed during the interview.
