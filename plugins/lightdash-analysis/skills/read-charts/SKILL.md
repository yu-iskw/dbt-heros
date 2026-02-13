# Read Charts (Read-Only)

Skill for discovering and inspecting Lightdash charts.

## Purpose

Enables identification and inspection of charts for data analysis purposes.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_charts`
- `lightdash_tools__list_charts_as_code`

## Safety Mode Compliance

- **Read-Only Tools**: All tools in this skill are considered **safe** for `read-only` mode.
- **Constraint**: Destructive tools like `upsert_chart_as_code` are strictly disallowed in this analysis-focused plugin.

## Behavior

1. **Discovery**: Use `list_charts` to find available charts.
2. **Inspection**: Use `list_charts_as_code` to retrieve the current definition of a chart for logic verification.

## Rules

- Use `list_charts_as_code` only to understand how a chart is calculated, never for modification.
