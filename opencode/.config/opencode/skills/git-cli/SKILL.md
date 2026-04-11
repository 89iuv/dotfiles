---
name: git-cli
description:
  Check local changes, generate commit message and commit local changes, push
  commits to remote repo.
---

# Git Commit and Push Skill

You have permission to use git for committing and pushing to remote
repositories.

## Trigger Conditions

Use this skill when explicitly asked to:

- "commit and push"
- "git commit"
- "push changes"
- "create a commit"

## Pre-commit Checks

Before proceeding, ALWAYS:

1. Run `git status` to inspect the repository state
2. Abort if NO changes are detected (no modified, added, or deleted files)
3. Abort if there are uncommitted changes already staged (warn user first)
4. Identify the current branch using `git branch --show-current`

## File Staging

Use `git add .` to stage all changes, OR:

- Use `git add <specific-files>` if only certain files should be committed
- Review staged files with `git diff --cached` before committing

## Commit Message Generation

Generate commit messages following **Conventional Commits** format:
`<type>(<scope>): <imperative-mood-summary>`

### Type Selection Rules

Scan changed files and determine type using this PRIORITY ORDER:

1. **fix** - Bug fixes, error corrections, or issue references (highest
   priority)
2. **feat** - New features or functionality
3. **refactor** - Code restructuring without behavior changes
4. **perf** - Performance improvements
5. **style** - Formatting, linting, missing semicolons (no logic changes)
6. **docs** - Documentation, README, comments
7. **test** - Test files only
8. **chore** - Config, tooling, dependencies, CI/CD (lowest priority)

### Scope Guidelines

- Use scope for: module names, package names, feature areas (e.g., `auth`,
  `api`, `cli`)
- Omit scope when: changes span multiple areas or repo-wide

### Summary Format

- Use imperative mood: "add" not "added" or "adds"
- Lowercase first letter
- No trailing period
- Keep under 50 characters when possible

### Examples

```
feat(auth): add OAuth2 login support
fix(api): return 404 for missing resources
refactor(parser): extract validation logic
docs(readme): update installation instructions
chore(deps): bump lodash to 4.17.21
```

## Commit Execution

1. Generate the commit message based on rules above
2. Run: `git commit -m "<message>"`
3. Verify commit succeeded by checking return code

## Push Execution

After successful commit:

1. Run: `git push`
2. If first-time push to new branch, use: `git push -u origin <branch-name>`
3. Handle authentication errors gracefully (prompt user for credentials if
   needed)

## Error Handling

- **No changes**: Abort with message "No changes to commit"
- **Git errors**: Report specific error message, do not retry blindly
- **Push failures**: Check for conflicts, suggest `git pull --rebase` if
  applicable
- **Hook failures**: Report pre-commit hook errors, do not bypass
  (`--no-verify`)

## Safety Guidelines

- NEVER use `--force` or `--force-with-lease` unless explicitly requested
- NEVER bypass hooks with `--no-verify` unless explicitly requested
- ALWAYS confirm before pushing to shared/production branches
- Prefer descriptive commit messages over vague ones like "update" or "fix"
