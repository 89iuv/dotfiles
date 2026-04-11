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
