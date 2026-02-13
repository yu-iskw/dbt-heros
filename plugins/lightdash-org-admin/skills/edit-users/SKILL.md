# Edit Users

Skill for modifying Lightdash organization members (including deletion).

## Purpose

Provides tools for administrative tasks related to modifying user access and organization membership.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__delete_member`

## Safety Mode Compliance

- **Write-Destructive Tools**: `delete_member`.
- **Constraint**: `delete_member` MUST ONLY be used when `LIGHTDASH_TOOL_SAFETY_MODE` is set to `write-destructive`.

## Behavior

1. **Safety Check**: Before attempting to use `delete_member`, check the environment variable `LIGHTDASH_TOOL_SAFETY_MODE`. If it is not `write-destructive`, inform the user that the action is blocked.
2. **User Discovery**: Refer to the `read-users` skill to find the correct `userUuid` before attempting deletion.

## Rules

- NEVER delete a member without explicit confirmation from the user.
- ALWAYS verify the `userUuid` before performing any destructive action.
