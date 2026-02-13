# Read Macros

Skill for inspecting dbt macro definitions and their usage across the project.

## Purpose

Enables inspection of Jinja macro files in `macros/` to understand reusable SQL generation patterns, custom materializations, and project-wide overrides.

## Behavior

1. **Macro Inspection**: Read macro SQL files to understand parameters, logic, and generated SQL.
2. **Usage Analysis**: Search for macro invocations (`{{ macro_name(...) }}`) across model files.
3. **Override Detection**: Identify macros that override dbt built-ins (e.g., `generate_schema_name`).
4. **Package Macros**: Review macros from installed packages in `dbt_packages/`.

## Rules

- Use `read-macros` to understand existing macros before creating new ones.
- Check for existing macros in `dbt-utils` and other packages before writing custom ones.
