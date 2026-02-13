# Read Projects (Organization Level)

Skill for viewing and inspecting Lightdash projects across the organization.

## Purpose

Provides tools and context for high-level administrative oversight of the organization's projects.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_projects`
- `lightdash_tools__get_project`
- `lightdash_tools__list_schedulers`
- `lightdash_tools__list_tags`

## Safety Mode Compliance

- **Read-Only Tools**: All tools in this skill are considered **safe** for `read-only` mode.

## Behavior

1. **Project Discovery**: Use `list_projects` to find all projects available in the organization.
2. **Metadata Inspection**: Use `list_tags` or `list_schedulers` to understand project organization and scheduled deliveries across the organization.

## Rules

- ALWAYS use the exact `projectUuid` returned from `list_projects`.
- For detailed project content validation or management, refer to the `lightdash-content-admin` plugin.
