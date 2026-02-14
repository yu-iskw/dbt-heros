# 13. Adopt symlinked shared agent resources with `.claude/skills` canonical

Date: 2026-02-14

## Status

Accepted

## Context

This repository is used across multiple coding assistants (Codex, Claude, Cursor). We need shared resources without double maintenance and without changing plugin-local runtime component layouts under `plugins/*`.

## Decision

Use symlinked shared resources with `.claude/skills` as the canonical skills path:

1. Canonical shared skills live in `.claude/skills`.
2. Canonical shared sub-agent definitions live in `.agents/agents`.
3. Tool-facing compatibility paths:
   - `.agents/skills` -> `../.claude/skills`
   - `.claude/agents` -> `../.agents/agents`
   - `.cursor/skills/shared` -> `../../.agents/skills`
4. `AGENTS.md` remains the repository-wide operational contract for Codex and related agents.
5. Plugin-local component directories under `plugins/*` remain unchanged.

## Consequences

- Positive:
  - One canonical location for shared skills reduces drift.
  - Claude, Codex, and Cursor continue to work through compatibility paths.
  - Conservative scope avoids risk to plugin manifests and plugin runtime behavior.
- Tradeoff:
  - Symlink topology must remain healthy; lightweight validation is required to detect breakage.
