---
name: prototype-user-journey-audit
description: Use only when the user explicitly invokes `$prototype-user-journey-audit`, names `prototype-user-journey-audit`, or asks for `真实用户闭环走查`. Audit whether a prototype, demo, or implemented product path delivers credible end-to-end product causality from a real user's perspective. Do not use for generic UX review, visual polish, prototype readiness, implementation, or delivery QA.
---

# Prototype User Journey Audit

Audit the journey a real user believes they are taking, not the completeness of a screen list. Find where a polished interface promises an action, judgment, state change, or continuation that the product does not actually deliver.

> Mock data may be fake. Product causality must not be fake.

## Protect The Audit Boundary

Start from the user-named journey, target user, promised outcome, and current observation range. Use the approved prototype, product specification, running surface, or other current canonical source as the baseline; do not silently redesign it.

- Do not shrink a requested full journey into its easiest screen, backend route, document, build, or smoke test.
- Evidence may justify inspecting the adjacent context needed to resolve a causal link, but it does not expand the verdict boundary. Before materially widening that boundary, report the reason, impact, and recommended range and obtain the user's decision; otherwise label the wider area as unexamined.
- Distinguish a prerequisite from the promised outcome. A repaired build or API can enable a journey without proving that the journey works.
- Treat the audit as read-only unless the user separately authorizes implementation. Recommend changes; do not edit product files merely because a defect is clear.
- Default probe authority covers non-mutating inspection and low-risk reversible interaction in an isolated test environment. Obtain separate authority before a probe writes production data, publishes or sends externally, invokes a paid provider, changes security state, or causes destructive or difficult-to-reverse effects. Without that authority, describe the probe and preserve the evidence gap.
- Report before adopting a discovery that changes product promise, architecture, data ownership, material cost, destructive scope, or acceptance criteria.

If the requested observation range is genuinely unclear and different choices would change the verdict, state the ambiguity and ask only for the decision that matters. Otherwise inspect the smallest evidence set that can resolve it.

## Follow Product Causality

Use this causal chain as a decision lens, adapting it to the product rather than forcing every link into the report:

```text
user intent -> visible action -> product processing or judgment
-> visible outcome -> state or record -> return, feedback, or next action
```

A journey loses credibility when a promised link is absent, contradictory, decorative, or supported only by explanatory copy. A data source may be mocked, but the demonstrated business rule, state transition, and user-visible consequence must still be coherent with the claimed product.

Inspect surrounding context only when it materially affects the path—for example, ownership of saved state, the source of an AI result, navigation continuity, or whether a visible control has a real consequence. Do not scan the whole repository by default.

## Calibrate Evidence

Base findings on current artifacts and observed behavior, not on how prototypes usually fail.

- Static screenshots and Figma frames can prove visible promises, hierarchy, and design drift. They cannot prove interaction, persistence, generation, or return paths.
- For an executable surface, prefer the user's real entry and verify the relevant visible action, resulting UI, state or record, and continuation. Use browser-native evidence for web apps and Computer Use for native or cross-app journeys when available.
- Code, API responses, builds, and tests can support a causal link, but none alone proves the user-visible loop.
- Distinguish confirmed findings, reasonable hypotheses, proposals, and unknowns. If a cheap probe can resolve a material uncertainty, perform or recommend it; do not turn plausibility into fact.
- Reuse existing journey reports or acceptance evidence when current and applicable. Re-observe claims that may have changed.

Load [references/journey-patterns.md](references/journey-patterns.md) for multi-step, stateful, AI-driven, mock-heavy, implemented, or repeatedly failing journeys. Use its patterns as experienced priors for inspection, not as required findings or report sections. Skip it for a narrow single-screen question that current evidence can answer directly.

## Judge Consequence And Trust

Prioritize the gap by its effect on the approved journey:

- **P0**: the primary promised outcome cannot be completed, or its main causal chain is directly contradictory or deceptive inside the current boundary.
- **P1**: materially weakens a product claim or makes an important part feel simulated, while the primary path remains demonstrable.
- **P2**: improves clarity, continuity, or fidelity without repairing a broken product claim.
- **Later / out of scope**: requires a new promise or a separately approved expansion.

Use severity only when it helps the decision. Omit empty categories and do not invent lower-priority issues to make the review look complete.

Recommend the smallest correction that restores a credible causal link, not automatically the smallest amount of engineering. Removing or visually demoting a control may be correct when no consequence is intended; when the capability is part of the approved promise, preserve the capability and restore its visible loop rather than shrinking it away.

## Communicate The Result

Let the case determine the response shape. Lead with:

- whether the requested journey currently closes,
- the strongest evidence for the main trust-breaking gap or pass,
- the highest-leverage correction or next probe,
- material uncertainty and the boundary not examined.

Use a compact journey map or capability matrix only when several independent steps or capabilities could disappear behind an aggregate verdict. Otherwise write natural findings tied to the user's intent, expected consequence, observed consequence, evidence, impact, and correction direction.

Do not claim the audit is complete merely because screenshots look right, a build passes, or a backend exists. A complete audit means the requested observation range has enough current evidence for an honest verdict; it does not mean the product has no possible improvements.

A current-boundary journey may be reported as credible only when it has a coherent primary causal path, no unresolved P0, no unresolved P1 that materially contradicts a user-named promise, explicit treatment of material unknowns, and no named outcome silently removed from scope. When the primary path closes but such a P1 remains, report that the main path closes with material gaps rather than calling the journey fully credible or acceptable.
