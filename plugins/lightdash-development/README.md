# Lightdash Development Plugin (Semantic Layer)

This plugin provides specialized tools for analytics engineers to manage the Lightdash semantic layer (metrics, dimensions, joins) using dbt 1.10+ and Fusion standards.

## Scope

- **Focused on Semantic Layer**: dbt modeling, metrics, and dimensions.
- **dbt 1.10+ Native**: Exclusively targets modern dbt metadata syntax.
- **Read-Only Remote Access**: Strictly non-destructive for remote assets. Remote chart/dashboard mutation is handled by the `lightdash-content-admin` plugin.

## Prerequisites

This plugin requires a connection to a Lightdash instance.

```bash
LIGHTDASH_API_KEY=your_key_here
LIGHTDASH_API_URL=https://app.lightdash.cloud/api/v1
```

## Agent Team

This plugin utilizes a specialized team of agents:

1. Semantic Layer Architect: Lead for design and standards.
2. Semantic Layer Developer: Implementation specialist for dbt YAML.
3. Validation Agent: QA specialist for project health.

## Atomic Skills

- `read-dimensions` / `edit-dimensions`: Define and refine dimensions (URLs, Liquid, RLS).
- `read-metrics` / `edit-metrics`: Implement aggregation logic (filters, groups).
- `read-models` / `edit-models`: Configure entity-level metadata and joins (RLS, Fanout).
- `read-parameters` / `edit-parameters`: Create dynamic variables for queries.
- `compile-project`: Local validation of dbt and Lightdash projects.
- `edit-preview`: Create and manage temporary test environments.
- `validate-project`: Ensure project consistency using CLI validation.

## Shared Knowledge

Static reference material is consolidated in `skills/shared/references/`:

- `best-practices.md`: Wide Table pattern and organizational standards.
- `cli.md`: Preview, validation, and deployment commands.
- `config-yml.md`: Metrics Catalog (Spotlight) and global params.
- `sql-variables.md`: Reference metadata and user attributes.

## Best Practices

- **Wide Table Pattern**: Prefer flat tables over complex joins.
- **Atomic Changes**: Modify one metric or dimension at a time and validate.
- **Always Validate**: Run validation jobs after any YAML edit.
