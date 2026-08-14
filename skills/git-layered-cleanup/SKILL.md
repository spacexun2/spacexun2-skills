---
name: git-layered-cleanup
description: Use for explicit risk-layered Git cleanup of noisy, mixed-ownership, mixed-publication, or multi-repository worktrees, especially when changes combine source with generated, local, secret-like, or uncertain content; cross nested Git boundaries; include ahead commits; or have unclear commit and push scope. Protect user work by separating ownership, publication intent, authority, and evidence. Do not use for a read-only status check or a clearly scoped single-repository commit with no unresolved risk boundary.
---

# Git Layered Cleanup

Protect user work and publication truth. Classify first, mutate second. This skill is a decision and authority contract, not a general Git tutorial.

## Scope

Begin with read-only triage. If the task resolves to one repository, one clearly owned change set, and no unresolved secret, publication, destructive, history, or remote boundary, exit layered mode and use an ordinary narrow Git flow with a concise result.

## Decision Model

Judge every change by:

1. **Ownership**: Which repository, task, person, or process owns it?
2. **Publication intent**: Commit and push, commit only, keep local, ignore, untrack while preserving locally, or ask?
3. **Authority and reversibility**: Is the action read-only, locally reversible, remotely visible, destructive, or history-rewriting?
4. **Evidence**: What current diff, validation, or remote result supports the claim?

Classify by role, not extension. A PNG may be source or temporary evidence; a JSON may be fixture, export, package, or machine state.

## Authority

- Inspect and classify freely when the request permits read-only work.
- Stage or commit only within the requested scope or an established automation contract.
- Treat push, upstream creation, and remote configuration as separate authority from commit.
- Require explicit confirmation for deletion, user-change reversion, reset, rebase, force operations, history rewrite, or secret mutation.
- Before an authorized history rewrite or destructive state change, create or confirm a recovery reference appropriate to the risk.

Load `references/fragile-operations.md` only when the task involves untracking, stash, reversal, reset, rebase, history rewrite, or force operations. Its commands and recovery options do not grant authority.

## Repository Boundaries

Resolve every Git top-level in scope and check branch, upstream, ahead/behind, status, and applicable local instructions live. Never infer a child repository's state, authentication, or publication result from its parent.

Distinguish repository shapes before acting:

- Treat an independent nested repository as its own Git and publication domain.
- Treat a submodule as both child-repository state and a parent gitlink; inspect and report both. Do not initialize, update, deinitialize, or rewrite it unless that scope is authorized.
- Treat a subtree as parent-owned files unless current metadata proves another Git boundary.

Use machine-readable status such as `git status --porcelain=v1 -z` for spaces, Chinese paths, and rename records.

When broad or nested workspace knowledge affects ownership or publication, inspect the nearest applicable instructions and resolve repository boundaries live. Keep machine- and project-specific workspace profiles outside a published skill repository. If the user supplies such a profile at runtime, treat it only as routing context and verify current Git state independently.

## Preservation

- Keep commits coherent by repository, task, and publication purpose.
- Avoid broad staging while ownership or scope is uncertain.
- Separate publishable source, docs, approved assets, and required evidence from generated output, caches, archives, backups, and machine state.
- Use narrow ignore rules; do not hide active or unrelated user files to manufacture a clean status.
- Keep local config and secret-like content local unless the user authorizes that exact publication.

Treat existing secrets as user-owned content. You may identify the path, exclude it, or ask, but do not print, publish, delete, blank, rotate, scrub, relocate, convert, or hide the value without authority. A private repository is not permission to publish or modify a secret.

## Evidence

Before commit, inspect staged names, status, statistics, and relevant content; run the smallest validation that supports the changed promise. Prefer repository-defined checks, then change-specific checks, then diff or file-integrity checks. If no meaningful validation exists, report that instead of inventing one.

After commit, verify HEAD and remaining status. After push, verify upstream and ahead/behind. Report missing upstream, rejection, or authentication failure separately from local success.

Verify important Chinese text with strict UTF-8 when terminal rendering is suspicious. Mojibake alone is not corruption evidence.

## Red Lines

Stop and align when:

- ownership, task scope, or publication intent remains unclear,
- independent repositories or unrelated user work would be mixed,
- content may be deleted, overwritten, reverted, hidden, or exposed beyond authority,
- secret, history, force, or remote risk exceeds the authorized boundary, or
- current evidence cannot support a clean, committed, or published claim.

## Result Contract

Report each repository separately:

```text
Repository / branch / upstream:
Committed:
Pushed:
Left local or untracked:
Ignored:
Validation:
Blocked or needs decision:
Scope or attribution limits:
```

Never collapse committed, pushed, left-local, and remote-blocked states into one completion claim.
