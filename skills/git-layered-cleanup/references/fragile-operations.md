# Fragile Git Operations

Load only the section relevant to an authorized operation. This reference explains risk and recovery semantics; it never expands mutation or remote authority.

## Untracking While Preserving Locally

When future copies should stay untracked, add a narrow ignore rule, use `git rm --cached -- <path>`, then verify the local file and staged scope. The next committed tree omits the file; earlier commits still contain it unless a separately authorized history rewrite occurs.

## Reversal And Recovery

Before reversing a completed mutation, inspect publication state, available recovery references, and work created afterward.

- Prefer non-rewriting reversal for published or shared history.
- Consider reset only for authorized local history after proving it will not overwrite newer work.
- Treat force push as separate remote authority and explain its effect on collaborators and remote history.
- Verify the recovered tree, index, branch position, and remaining work before reporting success.

## Temporary Isolation With Stash

Do not use stash merely to make the worktree look clean. When temporary isolation is authorized:

- record the stash reference, message, repository, and intended scope,
- verify what it actually preserved before switching, resetting, or cleaning,
- never assume it includes untracked, ignored, or nested-repository changes, and
- restore without overwriting newer work; retain the stash until recovery is verified.
