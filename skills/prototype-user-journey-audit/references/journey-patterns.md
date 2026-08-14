# Journey Failure Patterns

Use these patterns to direct attention in complex prototype audits. They are experienced priors, not a checklist. Search for a pattern only when the current journey presents a relevant signal, confirm it with current evidence, and report only what affects the case. Stay open to new failure modes. Any suggested interaction remains subject to the probe authority in `SKILL.md`.

## Affordance Without Consequence

**Signals:** A button, chip, card, tab, filter, save, publish, collect, or comment control looks actionable, but the next state is absent, generic, purely cosmetic, or unrelated.

**Confirm with:** Perform the action and observe navigation, content, state, records, persistence, and the return path. Inspect implementation only as needed to explain the observed behavior.

**False-positive guard:** A deliberately disabled, preview-only, or decorative element is not deceptive when its presentation and approved specification make that boundary clear.

**Correction direction:** Restore the promised consequence. If no consequence belongs in the current product, remove or visually demote the affordance rather than explaining away the mismatch.

## Explanatory Copy Substituting For Product State

**Signals:** A page says what the product would generate, remember, compare, save, or recommend, but does not show a result or state transition.

**Confirm with:** Trace the input and intended output. Determine whether the copy is onboarding content or a substitute for the claimed capability.

**False-positive guard:** Honest explanatory or empty-state copy is appropriate before a user has supplied the input required to produce a result.

**Correction direction:** Show the actual demonstrated result or state, including a coherent mocked transition when the data source is intentionally mocked.

## Decorative AI

**Signals:** The interface uses AI language or visual treatment, while outputs are fixed, appear before meaningful input, ignore changed inputs, or provide no observable judgment or generation trail.

**Confirm with:** Vary relevant user input and inspect whether the output, state, rationale, or next action changes coherently with the claimed AI role.

**False-positive guard:** A curated fixed sample can be legitimate when clearly presented as an example rather than live intelligence.

**Correction direction:** Demonstrate the smallest real or coherently simulated input-to-judgment loop that protects the product claim. Do not add model infrastructure merely to make a prototype technically impressive.

## Phantom Persistence

**Signals:** Save, publish, collect, submit, or generate appears successful, but the item cannot be found, revisited, distinguished from fixtures, or observed after navigation or reload when persistence is implied.

**Confirm with:** Follow creation through its intended record surface and return path. Check the correct state owner only when visible evidence is insufficient.

**False-positive guard:** Transient preview state is acceptable when the product never promises persistence.

**Correction direction:** Make the new or changed item visibly addressable in the place a user would expect, with the appropriate persistence boundary.

## Context Loss At A Boundary

**Signals:** Entering a detail, editor, generator, or secondary page loses the selected item, user intent, prior input, category, or route back.

**Confirm with:** Enter from the real upstream context and return or continue as the user would. Compare what the interface implies should survive.

**False-positive guard:** Intentional reset is not a defect when it is explicit, reversible where needed, and consistent with the product contract.

**Correction direction:** Preserve only the context needed to continue the journey; avoid inventing a generalized state system when a current route or record link suffices.

## Fixture Or Persona Leakage

**Signals:** Content, counts, categories, names, records, or recommendations contradict the selected persona, domain, filter, or earlier user action.

**Confirm with:** Trace the displayed fixture or state to the active context and test the relevant variant.

**False-positive guard:** Cross-domain examples may be intentional discovery content when labeled and consistent with the product.

**Correction direction:** Make fixtures and transitions obey the same state and business boundaries the real product claims.

## Premature Or Input-Insensitive Result

**Signals:** A personalized, generated, or analyzed result exists before required input or remains unchanged after material input changes.

**Confirm with:** Identify the minimum claimed input dependency and compare at least the variants needed to establish whether the dependency is real.

**False-positive guard:** Stable components of a result may be product defaults; judge only the portion promised as responsive.

**Correction direction:** Align result timing and variation with the claimed dependency. Do not force artificial variability where the product rule is deterministic.

## Secondary Surface Without A Job

**Signals:** A detail page, dashboard, or child view repeats the parent summary, adds decorative density, or lacks a user decision, action, record, or return role.

**Confirm with:** Ask what becomes possible on this surface that was not possible before, then observe the actual continuation.

**False-positive guard:** A focused reading or presentation view can be valuable even without mutation when that purpose is clear.

**Correction direction:** Give the surface a concrete role in the journey or collapse it into the upstream surface.

## Evidence Substitution

**Signals:** A screenshot proves a button exists, a build proves code compiles, an API response proves data exists, or a test proves an isolated rule—and this is reported as proof that the whole user journey works.

**Confirm with:** Locate the missing causal links between the supplied evidence and the claimed user outcome.

**False-positive guard:** Narrow evidence is sufficient when the audit question is equally narrow.

**Correction direction:** Add only the next evidence needed to close the claim; do not create a ceremonial full test suite.

## Full-Outcome Shrink

**Signals:** A user-named multi-step capability is declared ready after only its easiest screen, backend, documentation, or smoke path is checked; missing UI, state, or continuation is reframed as later polish.

**Confirm with:** Compare the approved outcome with the demonstrated causal path and identify which named link disappeared.

**False-positive guard:** A narrower audit is valid when the user explicitly bounded it or accepted staged completion.

**Correction direction:** Restore the omitted link to the verdict and recommended work. Do not use audit pragmatism to renegotiate product scope silently.

## Correction Overgrowth

**Signals:** Repairing a local trust gap is used to justify new platforms, generalized abstractions, backend systems, workflow gates, or unrelated redesign.

**Confirm with:** Ask which current causal link requires each proposed addition and what evidence makes the simpler correction insufficient.

**False-positive guard:** A broader change may be necessary when the current contract, repeated failure, or material risk proves the local fix cannot hold.

**Correction direction:** Recommend the least expansive change that credibly restores the approved journey, and report any broader opportunity before treating it as audit scope.

## Evolving The Library

Notice new patterns that current evidence supports; do not force them into an existing label. Suggest retaining a new pattern only when it is meaningfully distinct, likely to recur, and includes a recognizable signal plus a false-positive guard. A single plausible case may justify a current finding without yet justifying a durable pattern.
