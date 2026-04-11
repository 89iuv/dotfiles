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

## Tool Usage

- always make the tool call outside of the thinking block
- never make the tool call inside the thinking block

## Skill Usage

- use `git` skill for any git operations
- use `ctx7` skill to search documentation
- use `playwright-cli` skill to interact with browser
