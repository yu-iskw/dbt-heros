# Edit Snapshots

Skill for creating and modifying dbt snapshot definitions.

## Purpose

Enables the creation and configuration of SCD Type 2 snapshots to track historical changes in mutable source data.

## Behavior

1. **Snapshot Authoring**: Create snapshot definitions using SQL or YAML format.
2. **Strategy Selection**: Choose between `timestamp` and `check` strategies.
3. **Hard Delete Handling**: Configure how deleted source rows are treated.
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Snapshot strategies, SQL format, and essential configuration.
- [Advanced](./references/advanced.md): YAML format (v1.9+), hard deletes, and custom column names.

## Rules

- Snapshot at the source (staging) level, not on final mart models.
- Build snapshots in a dedicated schema with appropriate permissions.
- ALWAYS add a `unique` test on the `unique_key` in the source.
- Prefer the `timestamp` strategy when a reliable `updated_at` column exists.
- Refer to `read-snapshots` to verify existing snapshot configurations before modification.
