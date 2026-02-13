# Lightdash Content Admin Plugin

This plugin provides tools for managing Lightdash charts, dashboards, and spaces within a project. It focuses on content organization, discovery, and lifecycle management.

## Scope

- **Space Management**: Dedicated tools for managing the lifecycle and organization of spaces.
- **Content Organization**: Moving assets and organizing dashboards across spaces.
- **Content Discovery**: Searching for existing charts and dashboards.
- **Project-level Administration**: Project validation and content integrity checks.
- **Bulk Operations**: Administrative tasks across multiple assets.

**Note**: For core development tasks like creating metrics, dimensions, or building new charts/dashboards from scratch using YAML, use the official `developing-in-lightdash` skill.

## Configuration

Requires `LIGHTDASH_TOOL_SAFETY_MODE=write-destructive` for destructive or bulk administrative operations.
