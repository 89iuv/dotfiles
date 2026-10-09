# AGENTS

- [AGENTS](#agents)
  - [Git](#git)
    - [Types](#types)
    - [Rules](#rules)
    - [Examples](#examples)

## Git

When generating commit messages, always use
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) format:

```text
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types

| Type       | Description                                             |
| ---------- | ------------------------------------------------------- |
| `feat`     | A new feature                                           |
| `fix`      | A bug fix                                               |
| `docs`     | Documentation-only changes                              |
| `style`    | Code style changes (formatting, semicolons, etc.)       |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf`     | Performance improvement                                 |
| `test`     | Adding or updating tests                                |
| `build`    | Build system or dependency changes                      |
| `ci`       | CI configuration changes                                |
| `chore`    | Other changes that don't modify src or test files       |
| `revert`   | Reverts a previous commit                               |

### Rules

- The `<description>` must be lowercase, concise, and imperative (e.g., "add
  validation" not "added validation").
- No period at the end of the description.
- Keep the subject line under 72 characters.
- Use the body to explain **what** and **why**, not **how**.
- Separate subject from body with a blank line.
- Use the footer for issue references (e.g., `Closes #123`, `Refs #456`).

### Examples

```text
feat(auth): add OAuth2 login support

Add Google and GitHub OAuth2 providers for third-party authentication.

Closes #42
```

```text
fix(api): resolve null pointer in user profile endpoint

The profile endpoint crashed when optional fields were missing.
Added null checks for all nullable fields.

Refs #87
```

```text
docs(readme): update installation instructions

Clarify Node.js version requirements and add Docker setup steps.
```
