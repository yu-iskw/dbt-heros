# Run Models

Skill for materializing dbt models in the warehouse using the dbt Fusion CLI.

## Purpose

Enables the execution of dbt models to create or update tables and views in the target warehouse.

## Commands

- `dbt run`: Materialize models in the warehouse.
- `dbt build`: Run models + tests + snapshots + seeds in DAG order.
- `dbt run --full-refresh`: Rebuild incremental models from scratch.

## Behavior

1. **Selective Execution**: Use `--select` to run only specific models or subsets.
2. **Full Build**: Use `dbt build` for a complete DAG execution including tests.
3. **Full Refresh**: Use `--full-refresh` to rebuild incremental models when logic changes.
4. **Failure Handling**: Use `dbt retry` to re-run only failed models from the last run.

## References

- [Basics](./references/basics.md): Run commands, selection syntax, and common patterns.
- [CLI Reference](../../shared/references/dbt-fusion-cli.md): Full dbt Fusion CLI command reference.

## Rules

- ALWAYS compile before running (`dbt compile` then `dbt run`).
- Use `--select` for targeted runs during development.
- Use `dbt build` for production-like execution that includes tests.
- Be cautious with `--full-refresh` on large incremental models.
- This skill requires `DBT_TOOL_SAFETY_MODE=write` to execute.
