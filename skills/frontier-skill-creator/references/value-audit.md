# Skill Value Audit

Use this reference for substantial skill review or modernization. It is a set of probes, not a mandatory questionnaire. Inspect current artifacts first and omit questions already resolved by evidence.

## Trigger Truth

- Which realistic user prompts should trigger this skill?
- Which adjacent prompts must not trigger it?
- Is explicit invocation necessary because the workflow is costly, intrusive, adversarial, or specialized?
- Does the description overlap another skill strongly enough to cause double-loading or ambiguous ownership?
- Can the skill recognize when a triggered task has become simple enough to exit its specialized mode?

## Intelligence Density

- Which facts could not be reconstructed safely from the current task or repository?
- Which user preference, vocabulary, source priority, environment quirk, or historical failure changes the result?
- Which current statements are volatile facts that should be checked live rather than stored?
- Which generally known concept earns its place because it is a shared decision lens or coordination language?
- Are hypotheses labeled and paired with a cheap probe instead of being promoted to facts?

## Interference Scan

- Which instructions teach general reasoning that the current model already performs?
- Which fixed steps, question counts, formats, or length requirements produce ceremony rather than better decisions?
- Which examples have accidentally become mandatory behavior?
- Which rules duplicate system instructions, `AGENTS.md`, another skill, or a canonical source?
- Which defensive branches protect only imagined failures while obscuring the main outcome?
- Does the skill ask for hidden reasoning instead of observable decisions and evidence?

## Authority And Consequence

- What can the agent inspect without mutation?
- Which local writes, external writes, publication actions, destructive changes, paid usage, or security effects require separate authority?
- Where must the agent stop because a discovery changes product promise, data ownership, architecture, cost, or acceptance?
- Are red lines exact enough for the risk without prescribing ordinary implementation choices?
- Does the output distinguish local work, committed state, published state, and unverified claims when relevant?

## Progressive Disclosure

Classify each retained item by its cheapest correct home:

| Content | Home |
|---|---|
| Always-needed outcome, authority, decision model, evidence | `SKILL.md` |
| Stable private context or low-frequency domain knowledge | `references/` |
| Repeated deterministic or fragile transformation | `scripts/` |
| Material copied into the final artifact | `assets/` |
| Generic knowledge the model can infer | omit |

Every reference should be linked directly from `SKILL.md` with a loading condition. Avoid duplicating the same rule across the main file and references.

## Behavioral Evidence

Use behavioral evidence only when the change can plausibly affect triggering, transfer, the core outcome, or a material risk boundary. Choose the smallest probe that can resolve the actual uncertainty; do not assemble a full suite by default.

Possible probes include:

- positive trigger: an authentic task that should use the skill,
- negative trigger: a nearby simple task that should not use it,
- core outcome: a case that proves the skill changes the result usefully,
- risk boundary: the most consequential permission or stop condition,
- transfer case: a different but related task that reveals overfitting.

Judge whether the skill improves decisions and outcomes, not whether the agent reproduces its wording.

## Review Result

Use natural prose when it is clearer. When structured labels improve the decision, select only the relevant labels below, omit empty categories, and do not invent findings to complete the structure:

```text
Keep in core:
Move to conditional reference or script:
Remove as generic, ceremonial, duplicated, or stale:
Add now because evidence or risk justifies it:
Useful later but not justified now:
Missing evidence:
Trigger or authority change needing user alignment:
```
