# Read Spaces

Skill for inspecting Lightdash spaces within a project.

## Purpose

Enables administrative management of spaces to organize charts and dashboards effectively.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_spaces`
- `lightdash_tools__get_space`

## Safety Mode Compliance

- **Read-Only Tools**: All tools currently in this skill are considered **safe** for `read-only` mode.

## Behavior

1. **Space Inspection**: Use `list_spaces` to see all available spaces in the project.
2. **Space Details**: Use `get_space` to inspect the contents of a specific space (charts and dashboards).

## Rules

- ALWAYS list spaces before attempting to reorganize content.
- When creating or updating spaces (future), ensure names are descriptive and follow project naming conventions.
