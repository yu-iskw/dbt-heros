# Edit Groups

Skill for modifying Lightdash organization groups and their memberships.

## Purpose

Provides tools for administrative tasks related to organization groups, including creation, updates, deletion, and managing group memberships.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__create_group`
- `lightdash_tools__update_group`
- `lightdash_tools__delete_group`
- `lightdash_tools__add_user_to_group`
- `lightdash_tools__remove_user_from_group`

## Safety Mode Compliance

- **Write Tools**: `create_group`, `update_group`, `add_user_to_group`, `remove_user_from_group`.
- **Write-Destructive Tools**: `delete_group`.
- **Constraints**:
  - Write tools MUST ONLY be used when `LIGHTDASH_TOOL_SAFETY_MODE` is set to `write` or `write-destructive`.
  - `delete_group` MUST ONLY be used when `LIGHTDASH_TOOL_SAFETY_MODE` is set to `write-destructive`.

## Behavior

1. **Safety Check**: Before performing any state-changing action, check the environment variable `LIGHTDASH_TOOL_SAFETY_MODE`. Inform the user if the action is blocked by the current safety mode.
2. **Discovery**: Refer to the `read-groups` skill to find the correct `groupUuid` before attempting updates or deletion.
3. **User Verification**: When adding users to a group, verify the `userUuid` exists first using the `read-users` skill.

## Rules

- NEVER delete a group without explicit confirmation from the user.
- ALWAYS verify the `groupUuid` before performing any update or deletion.
