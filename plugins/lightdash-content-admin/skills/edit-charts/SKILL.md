# Edit Charts (Admin)

Skill for administrative modification of Lightdash charts within a project.

## Purpose

Enables administrative updates to charts to ensure consistency and compliance with project standards.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__upsert_chart_as_code`

## Safety Mode Compliance

- **Write-Destructive Tools**: `upsert_chart_as_code`.
- **Constraint**: `upsert_chart_as_code` is restricted to administrative updates when `LIGHTDASH_TOOL_SAFETY_MODE` is set to `write-destructive`.

## Behavior

1. **Administrative Updates**: Use `upsert_chart_as_code` for bulk administrative changes or ensuring consistency across charts.
2. **Discovery**: Refer to `read-charts` to find the correct chart IDs before attempting an update.

## Rules

- For core development and creation of new charts, use the official `developing-in-lightdash` skill.
- Use `upsert_chart_as_code` primarily for administrative tasks like fixing metadata, updating owners, or bulk organization.
