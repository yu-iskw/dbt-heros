# Discover Resources

Skill for discovering projects, explores, and other available resources in Lightdash.

## Purpose

Enables the identification of available entities for further inspection or modification.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_projects`
- `lightdash_tools__list_explores`
- `lightdash_tools__list_tags`

## Behavior

1. **Project Discovery**: Start with `list_projects` if the `projectUuid` is unknown.
2. **Explore Discovery**: Use `list_explores` to find models available for analysis.
3. **Tag Discovery**: Use `list_tags` to understand resource categorization.

## Rules

- NEVER assume resource presence; always list first if uncertain.
