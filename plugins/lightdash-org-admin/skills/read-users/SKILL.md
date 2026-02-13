# Read Users

Skill for viewing Lightdash organization members.

## Purpose

Provides tools for administrative tasks related to inspecting user access and organization membership.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_organization_members`
- `lightdash_tools__get_member`

## Safety Mode Compliance

- **Read-Only Tools**: `list_organization_members`, `get_member`.

## Behavior

1. **User Discovery**: Use `list_organization_members` to find users.
2. **Metadata Inspection**: Use `get_member` to get detailed information about a specific user.

## Rules

- ALWAYS verify the `userUuid` exists before referencing it in other skills.
