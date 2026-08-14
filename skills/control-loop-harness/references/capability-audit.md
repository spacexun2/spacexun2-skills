# Capability Audit

Load this reference only when a multi-capability or full-effect completion claim cannot be judged reliably as one unit.

Build only the columns needed to expose the disputed layers. A useful starting point is:

```text
Capability | target source | intended effect | implemented layers | current evidence | material gap | status
```

Add UI, logic/API, state/record, trust/control, feedback, or other columns only when they matter to the actual product. Do not make the matrix a universal product schema.

Use current evidence. Do not infer a working layer from a plan, type, interface, adjacent capability, build, or smoke test.

Possible statuses include:

- `complete`: the approved effect exists and current evidence supports it;
- `exists-with-roughness`: the effect works and remaining gaps are outside the current promise;
- `partial`: a required part of the effect is missing;
- `surface-only` or `backend-only`: one visible or technical layer exists without the promised experience;
- `docs-only`, `missing`, or `blocked`: use only when directly supported.

Do not call the whole outcome complete while an approved capability remains materially incomplete. Do not invent additional capabilities merely to make the audit look comprehensive.
