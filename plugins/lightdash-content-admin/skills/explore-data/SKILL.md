# Explore Data

Skill for understanding the Lightdash semantic layer, including explores, metrics, and dimensions.

## Purpose

Enables data exploration and discovery within the semantic layer.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_explores`
- `lightdash_tools__get_explore`
- `lightdash_tools__list_dimensions`
- `lightdash_tools__list_metrics`
- `lightdash_tools__get_field_lineage`

## Safety Mode Compliance

- **Read-Only Tools**: All tools in this skill (`list_explores`, `get_explore`, `list_dimensions`, `list_metrics`, `get_field_lineage`) are **safe** for `read-only` mode.

## Behavior

1. **Discovery**: Use `list_explores` to see available tables/explores.
2. **Detail Inspection**: Use `get_explore` to see the full list of dimensions and metrics for a specific explore.
3. **Lineage Analysis**: Use `get_field_lineage` to understand the upstream dependencies of a specific field.

## Rules

- Use the exact `exploreId` and `fieldId` strings returned by the tools.
- When searching for metrics, prefer using `list_metrics` across the data catalog.
