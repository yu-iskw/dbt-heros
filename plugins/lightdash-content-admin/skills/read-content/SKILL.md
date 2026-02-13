# Read Content

Skill for searching Lightdash dashboards, spaces, and other content within a project.

## Purpose

Enables content discovery and organization within a Lightdash project.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_dashboards`
- `lightdash_tools__list_spaces`
- `lightdash_tools__get_space`
- `lightdash_tools__search_content`

## Safety Mode Compliance

- **Read-Only Tools**: All tools in this skill are considered **safe** for `read-only` mode.

## Behavior

1. **Discovery**: Use `search_content` to find relevant charts, dashboards, or spaces by name or description.
2. **Organization**: Use `list_spaces` and `get_space` to understand how content is grouped.
3. **Dashboard Listing**: Use `list_dashboards` to see all dashboards in a project.

## Rules

- ALWAYS check for existing content using `search_content` before suggesting the creation of new assets.
- Respect the existing space organization when analyzing content.
