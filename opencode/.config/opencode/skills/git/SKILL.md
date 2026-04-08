---
name: git
description: commit local change and push to remote
---

# Git Commit and Push Skill

## Workflow

### Step 1

use `git status` to check for repo changes

### Step 2

use `git add .` to add all files to staging

### Step 3

Generate a commit message using the Conventional Commit Rules
use `git commit -m"<message>"` to commit changes to local repo

### Step 4

use `git push` to push commits to remote repo

## Notes

### Conventional Commit Message

Format:

`<type>(<optional scope>): <short imperative summary>`

Rules:

- type: one of feat | fix | docs | style | refactor | perf | test | chore | ci | build | revert
- scope: the module, package, or area affected (e.g. auth, api, cli) — omit if repo-wide
- summary: imperative mood, lowercase, no trailing period, ≤ 72 characters

Examples:

`feat(auth): add OAuth2 login support`
`fix(api): return 404 instead of 500 for missing resources`
`chore: update dependencies to latest patch versions`
