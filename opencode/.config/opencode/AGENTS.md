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

## Subagent Delegation

- **Delegate complex or multi-step tasks to subagents** using the `task` tool.
  Break large or independent work into parallel subagent calls to speed up
  execution.
- Prefer spawning subagents for:
  - File exploration and codebase investigation (`explore` agent)
  - General multi-step tasks (`general` agent)
  - Any work that can proceed independently of the current conversation
- Keep subagent prompts specific and self-contained so they can complete
  without further input.
- After subagents return, review their results and synthesize findings before
  proceeding.

## Skill Usage

- use `git` skill for any git operations
- use `ctx7` skill to search documentation
- use `playwright-cli` skill to interact with browser
