# Validate Project

Skill for ensuring Lightdash project health and content integrity through automated validation.

## Purpose

Enables administrative checks on project content to identify broken charts, dashboards, or semantic layer issues.

## Tools

Wraps the following MCP tools from the `lightdash` server:

- `lightdash_tools__validate_project`
- `lightdash_tools__get_validation_results`

## Safety Mode Compliance

- **Read-Only Tools**: Both tools in this skill are considered **safe** for `read-only` mode as they do not mutate project state or data warehouse assets.

## Behavior

1. **Validation Workflow**:
   - Trigger a validation job for a specific project using `validate_project`.
   - Monitor the job or retrieve the latest results using `get_validation_results`.
2. **Analysis**:
   - Parse validation results to identify specific broken assets (charts, dashboards).
   - Report errors with context (asset name, space, error message).

## Rules

- ALWAYS include the asset name and specific error message when reporting validation failures.
- Group errors by space or asset type to improve readability for developers.
