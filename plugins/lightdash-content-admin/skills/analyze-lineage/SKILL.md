# Analyze Lineage

Skill for understanding the upstream dependencies and downstream impact of semantic layer fields.

## Purpose

Enables safe modification and deletion of fields by revealing their data lineage.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__get_field_lineage`
- `lightdash_tools__list_charts_as_code` (Impact analysis)

## Behavior

1. **Dependency Mapping**: Use `get_field_lineage` to see what warehouse columns a field depends on.
2. **Impact Analysis**: Use `list_charts_as_code` to see which charts reference a field before renaming or deleting it.

## Rules

- ALWAYS check impact before destructive YAML changes.
