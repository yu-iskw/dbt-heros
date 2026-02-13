# Read Charts (Admin)

Skill for inspecting and auditing Lightdash charts within a project.

## Purpose

Enables administrative oversight and inspection of charts to ensure consistency and compliance with project standards.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_charts`
- `lightdash_tools__list_charts_as_code`

## Safety Mode Compliance

- **Read-Only Tools**: `list_charts`, `list_charts_as_code`.

## Behavior

1. **Inspection**: Use `list_charts_as_code` to retrieve the current definition of a chart for auditing purposes.

## Rules

- Use `read-charts` only to understand how a chart is calculated or configured, never for modification.
