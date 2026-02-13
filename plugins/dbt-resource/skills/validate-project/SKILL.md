# Validate Project

Skill for running dbt tests and validating project health.

## Purpose

Enables comprehensive data quality validation by executing generic tests (YAML-declared), singular tests (SQL files), and project-wide health checks.

## Commands

- `dbt test`: Run all data tests.
- `dbt test --select model_name`: Run tests for a specific model.
- `dbt source freshness`: Check source data freshness.

## Behavior

1. **Full Test Suite**: Run `dbt test` to execute all generic and singular tests.
2. **Selective Testing**: Use `--select` to test only affected models after changes.
3. **Source Freshness**: Run `dbt source freshness` to validate source data recency.
4. **Error Interpretation**: Parse test failures to identify data quality issues and affected resources.

## References

- [Basics](./references/basics.md): Test execution, selection, and result interpretation.
- [CLI Reference](../../shared/references/dbt-fusion-cli.md): Full dbt Fusion CLI command reference.

## Rules

- ALWAYS run `dbt test` after modifying model SQL or YAML properties.
- Run `dbt source freshness` before trusting source data in development.
- If tests fail, investigate root cause before proceeding with deployment.
- Use `--select` for faster feedback during iterative development.
