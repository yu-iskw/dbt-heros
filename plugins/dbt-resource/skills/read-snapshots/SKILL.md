# Read Snapshots

Skill for inspecting dbt snapshot definitions and their SCD Type 2 configurations.

## Purpose

Enables inspection of snapshot SQL/YAML files to understand how mutable source data is being tracked over time using Slowly Changing Dimension Type 2 patterns.

## Behavior

1. **Snapshot Inspection**: Read snapshot files in `snapshots/` to understand source queries, strategies, and unique keys.
2. **Strategy Review**: Identify whether snapshots use `timestamp` or `check` strategy.
3. **Metadata Review**: Check for `dbt_valid_from`, `dbt_valid_to`, and other SCD columns.

## Rules

- Use `read-snapshots` to understand existing snapshot configurations before proposing changes.
- Verify the `unique_key` and `strategy` are appropriate for the source data.
