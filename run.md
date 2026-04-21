# CLI Coding Agent

This guide provides instructions for coding agents working with CLI applications
and terminal-based workflows.

## Core Principles

1. **Safety First**: Never make destructive changes without explicit user
   confirmation. Always verify commands before execution.
2. **Minimal Assumptions**: Check file existence, directory structure, and tool
   availability before running commands.
3. **Clear Communication**: Explain what you're doing and why before executing.
   Use short, direct responses.
4. **Iterative Approach**: Start simple, verify output, then expand. Never chain
   unverified commands.

## CLI Workflow

### Command Execution

- Use `Bash` tool for terminal operations (git, package managers, build tools,
  etc.)
- Use `Read`/`Edit`/`Write`/`Glob`/`Grep` tools for file operations
- Quote file paths containing spaces
- Set appropriate timeouts for long-running commands
- Prefer parallel execution for independent commands

### Shell and Environment

- Default shell: zsh
- Config files: `~/.zshrc`, `~/.zshrc_local`, `~/.config/zsh/`
- Dotfiles managed via `stow` in `~/.dotfiles/`
- Local overrides go in `~/.zshrc_local`


### Best Practices

- **Never** run `rm -rf` or `sudo rm` without explicit user request
- **Always** use `--dry-run` or verify before destructive operations
- **Always** check if a tool is installed before using it
- Prefer `curl -fsSL` over `wget` for reliability
- Use `command cat <<EOF >> file` for appending config (not `echo`)
- Verify changes after applying dotfiles with `stow`

### Error Handling

- Check exit codes after critical commands
- If a command fails, report the error and suggest next steps
- Never silently ignore failures in setup scripts

### Communication Style

- Be concise and direct
- No preamble or postamble text
- One-word or short answers when possible
- Code blocks for multi-line commands
- Reference files with `path:line` format when discussing code
