# Read Models

Skill for inspecting dbt models and explores in Lightdash.

## Purpose

Enables inspection of entity-level metadata, joins, and explores for modeling purposes.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__get_explore`

## Behavior

1. **Inspection**: Use `get_explore` to retrieve the current table and join structure for a model.

## Rules

- Use `read-models` to understand current relationships and primary keys before proposing changes.
