---
name: git
description: commit and push
---

# Git Commit and Push Skill

You have permission to use git for commit and push to remote repository.

## Workflow

Use `git status` to check for repo changes, abort if no changes are detected.
Use `git add .` to add all files to staging.

Generate a commit message using the Conventional Commit Message Rules.
Use `git commit -m"<message>"` to commit changes to local repo.

Use `git push` to push canges to remote repo.


## Conventional Commit Message Rules

Format:

`<type>(<optional scope>): <short imperative summary>`

Where:

- type: one of feat | fix | docs | style | refactor | perf | test | chore | ci | build | revert
- scope: the module, package, or area affected (e.g. auth, api, cli) — omit if repo-wide
- summary: imperative mood, lowercase, no trailing period, ≤ 72 characters

Examples:

`feat(auth): add OAuth2 login support`
`fix(api): return 404 instead of 500 for missing resources`
`chore: update dependencies to latest patch versions`
