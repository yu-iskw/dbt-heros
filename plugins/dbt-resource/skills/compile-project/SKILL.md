# Compile Project

Skill for compiling the dbt project using the dbt Fusion CLI.

## Purpose

Enables validation that SQL and YAML configurations are syntactically correct and all references resolve properly, without materializing any models in the warehouse.

## Commands

- `dbt compile`: Compile all SQL and validate project structure.
- `dbt compile --select model_name`: Compile a specific model and its dependencies.

## Behavior

1. **Full Compilation**: Run `dbt compile` to validate the entire project after broad changes.
2. **Selective Compilation**: Use `--select` to compile only affected models and their dependencies.
3. **Output Review**: Check `target/compiled/` for the generated SQL to verify correctness.
4. **Error Diagnosis**: Parse compilation errors to identify YAML syntax issues, missing refs, or SQL errors.

## References

- [Basics](./references/basics.md): Common compilation flags and output interpretation.
- [CLI Reference](../../shared/references/dbt-fusion-cli.md): Full dbt Fusion CLI command reference.

## Rules

- ALWAYS run `dbt compile` after modifying SQL or YAML files.
- If compilation fails, do NOT proceed with `dbt run` or `dbt build`.
- Use selective compilation (`--select`) for faster feedback during iterative development.
