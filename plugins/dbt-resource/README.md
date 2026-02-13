# dbt Resource Development Plugin

This plugin provides specialized tools for analytics engineers to create and manage dbt resources (models, sources, tests, macros, seeds, snapshots, metrics, and documentation) using the dbt Fusion CLI.

## Scope

- **All dbt Resource Types**: Models, sources, tests, macros, seeds, snapshots, metrics/semantic models, exposures, and documentation.
- **dbt Fusion Native**: Targets the dbt Fusion CLI for compilation, testing, and execution.
- **File-Based Development**: Operates on local dbt project files (SQL, YAML, CSV, Jinja).
- **Safety-Gated Execution**: Warehouse-modifying operations require explicit `DBT_TOOL_SAFETY_MODE=write`.

## Prerequisites

This plugin requires a dbt project and the dbt Fusion CLI installed.

```bash
# Install dbt Fusion
curl -fsSL https://install.dbt.com | bash

# Verify installation
dbt --version
```

## Agent Team

This plugin utilizes a specialized team of agents:

1. **dbt Architect**: Lead agent for designing data model structure, enforcing standards, and delegating tasks.
2. **dbt Developer**: Implementation specialist for creating and modifying all dbt resource types.
3. **dbt Validator**: QA specialist for compilation, testing, and project health validation.

## Atomic Skills

### Resource Skills (read/edit pairs)

- `read-models` / `edit-models`: dbt model SQL files and YAML property definitions.
- `read-sources` / `edit-sources`: Source declarations, freshness configuration.
- `read-tests` / `edit-tests`: Generic tests (YAML) and singular tests (SQL).
- `read-macros` / `edit-macros`: Jinja macros and SQL generation templates.
- `read-seeds` / `edit-seeds`: Seed CSV files and type configurations.
- `read-snapshots` / `edit-snapshots`: SCD Type 2 snapshot definitions.
- `read-metrics` / `edit-metrics`: Metrics and semantic model definitions (MetricFlow).
- `read-docs` / `edit-docs`: Documentation, exposures, and doc blocks.

### Operational Skills

- `compile-project`: Validate SQL and YAML via `dbt compile`.
- `validate-project`: Run data tests via `dbt test` and check source freshness.
- `run-models`: Materialize models via `dbt run` / `dbt build`.

## Shared Knowledge

Static reference material is consolidated in `skills/shared/references/`:

- `project-structure.md`: dbt project layout and directory conventions.
- `dbt-fusion-cli.md`: Full CLI command reference with selection syntax.
- `jinja-patterns.md`: Common Jinja2 patterns for dbt development.
- `naming-conventions.md`: Naming standards for all resource types.

## Safety

- **Default Mode**: Read-only for warehouse operations. Compilation and testing are always allowed.
- **Write Mode**: Set `DBT_TOOL_SAFETY_MODE=write` to enable `dbt run`, `dbt build`, `dbt seed`, and `dbt snapshot`.
- **Hook Enforcement**: The `safety.sh` hook deterministically blocks warehouse-modifying commands in read-only mode.

## Best Practices

- **Layered Design**: Organize models into staging, intermediate, and mart layers.
- **Compile Before Run**: Always validate with `dbt compile` before materializing.
- **Test After Changes**: Run `dbt test` after modifying model SQL or YAML.
- **Atomic Changes**: Modify one resource at a time and validate between changes.
