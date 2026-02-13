# Read Spaces (Organization Level)

Skill for administrative oversight and access inspection of Lightdash spaces across projects.

## Purpose

Provides organization-level tools for managing space access and administrative configurations.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__list_spaces`
- `lightdash_tools__get_space`

## Safety Mode Compliance

- **Read-Only Tools**: All tools currently in this skill are considered **safe** for `read-only` mode.

## Behavior

1. **Administrative Review**: Use `list_spaces` and `get_space` to audit space structures and content ownership across the organization's projects.
2. **Access Governance (Future)**: Will include tools for managing user and group access to specific spaces.

## Rules

- ALWAYS identify the correct `projectUuid` before listing or inspecting spaces.
- Respect project-level organization unless an organization-wide administrative action is required.
