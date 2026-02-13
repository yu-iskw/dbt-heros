# Read Groups

Skill for viewing Lightdash organization groups and their memberships.

## Purpose

Provides tools for administrative tasks related to inspecting organization groups and group memberships.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_groups`
- `lightdash_tools__get_group`
- `lightdash_tools__list_group_members`

## Safety Mode Compliance

- **Read-Only Tools**: `list_groups`, `get_group`, `list_group_members`.

## Behavior

1. **Group Discovery**: Use `list_groups` to see all groups in the organization.
2. **Membership Inspection**: Use `list_group_members` to see who is in a group.

## Rules

- ALWAYS verify the `groupUuid` exists before referencing it in other skills.
