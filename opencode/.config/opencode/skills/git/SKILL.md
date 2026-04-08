---
name: git
description: commit and push
---

# Git Commit and Push Skill

You have permission to use git for commit and push to remote repository.

## Triggers

Use this skill when asked to: `git commit and push`.

## Workflow

Use `git status` to check for repo changes, abort if no changes are detected.
Use `git add .` to add all files to staging.

Generate a commit message using the **Conventional Commit Message Rules** and
use `git commit -m"<message>"` to commit the changes to the local repo.

Use `git push` to push canges to remote repo.

## Notes

### Conventional Commit Message Rules

Format:

`<type>(<optional scope>): <short imperative summary>`

- type: scan the changed files and infer:

| Signal                                | Type       |
| ------------------------------------- | ---------- |
| Only new feature files                | `feat`     |
| Bug-fix files or issue references     | `fix`      |
| Test files only                       | `test`     |
| Docs / README / comments              | `docs`     |
| Config / tooling / CI changes         | `chore`    |
| Code restructure, no behaviour change | `refactor` |
| Style / formatting only               | `style`    |
| Performance improvement               | `perf`     |

- scope: the module, package, or area affected (e.g. auth, api, cli) — omit if
  repo-wide
  
- summary: imperative mood, lowercase, no trailing period

Examples:

`feat(auth): add OAuth2 login support`
`fix(api): return 404 instead of 500 for missing resources`
`chore: update dependencies to latest patch versions`
