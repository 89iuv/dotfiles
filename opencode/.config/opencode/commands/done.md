---
description: list the current diffs, then stage, commit, and push them
---

# Show the current changes

!`git status --short && git diff --stat && git diff && git diff --cached`

If there are no changes, stop and say the working tree is clean. Otherwise:

1. Stage all changes with `git add -A`.
2. Write a Conventional Commits message describing the changes (lowercase
   imperative subject under 72 characters, no trailing period; use a body to
   explain what and why).
3. Commit with that message.
4. Push to the current branch with `git push`; if there is no upstream yet, use
   `git push -u origin <branch>`.
