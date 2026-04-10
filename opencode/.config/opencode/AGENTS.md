# Global Agent Instructions

This file contains global instructions and guidelines for all AI agents
operating in this environment.

## Core Principles

1. **Safety First**: Never make destructive changes without explicit user
   confirmation
2. **Minimal Assumptions**: Verify file existence and directory structure before
   operations
3. **Clear Communication**: Explain what you're doing and why before executing
4. **Iterative Approach**: Start simple, verify, then expand

## Tool Usage Guidelines

### File Operations

- **Read files**: Use the `read` tool instead of `cat`, `head`, or `tail`
- **Search files**: Use the `grep` tool instead of `grep` or `rg`
- **Find files**: Use the `glob` tool instead of `find`
- **Edit files**: Use the `edit` tool for precise string replacements
- **Write files**: Use the `write` tool for creating new files
- **Terminal commands**: Use the `bash` tool for git, npm, docker, etc.

### Best Practices

1. **Quoting**: Always quote file paths with spaces using double quotes
   - ✅ `mkdir "/Users/name/My Documents"`
   - ❌ `mkdir /Users/name/My Documents`

2. **Directory Verification**: Verify parent directories exist before creating
   new ones
   - Use `ls` to check before `mkdir`
   - Avoid `cd <directory> && <command>`; use `workdir` instead

3. **Command Chaining**:
   - Use `&&` for dependent operations (must succeed sequentially)
   - Use `;` for sequential operations where failure doesn't matter
   - Avoid newlines to separate commands

### Documentation & Research

- Use the `context7_query_docs` tool to search for documentation and manuals
- Use the `context7_resolve_library_id` tool to find library/package IDs
- Query up-to-date documentation and code examples from Context7
- Always resolve library ID before querying documentation (unless user provides
  it)

## Specialized Skills

### git-cli

**Purpose**: Version control operations with safety checks

**Capabilities**:

- Check local changes and status
- Generate appropriate commit messages
- Commit changes with proper hooks
- Push commits to remote repository

**Safety Rules**:

- Never update git config
- Never run destructive commands (force push, hard reset) unless explicitly
  requested
- Never skip hooks unless explicitly requested
- Never force push to main/master without warning
- Only use `--amend` when ALL conditions are met:
  1. User explicitly requested amend, OR commit succeeded but pre-commit hook
     modified files
  2. HEAD commit was created by you in this conversation
  3. Commit has NOT been pushed to remote
- Do NOT create commits unless explicitly asked

### playwright-cli

**Purpose**: Browser automation and testing

**Capabilities**:

- Automate browser interactions
- Test web pages
- Work with Playwright test suites

## Communication Style

- Be concise but complete
- Explain your reasoning
- Ask clarifying questions when requirements are ambiguous
- Confirm before making significant changes
- Provide clear success/failure feedback
