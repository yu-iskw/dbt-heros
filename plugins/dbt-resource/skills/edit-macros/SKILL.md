# Edit Macros

Skill for creating and modifying dbt Jinja macros.

## Purpose

Enables the creation of reusable Jinja templates that generate SQL at compile time, including utility functions, custom materializations, and project-wide overrides.

## Behavior

1. **Macro Authoring**: Write Jinja macros in `macros/` with clear parameter definitions.
2. **SQL Generation**: Create macros that produce valid SQL for the target warehouse.
3. **Override Implementation**: Override dbt built-in macros (e.g., `generate_schema_name`).
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Macro syntax, parameters, and common patterns.
- [Advanced](./references/advanced.md): Dispatching, adapter macros, and custom materializations.
- [Jinja Patterns](../../shared/references/jinja-patterns.md): Common Jinja2 patterns for dbt.

## Rules

- Prioritize readability over abstraction. Avoid over-engineering macros.
- Document every macro with a header comment explaining purpose, parameters, and usage.
- Check community packages before writing custom macros.
- Use `dbt compile` to preview generated SQL for debugging.
- Refer to `read-macros` to verify existing macros before creating new ones.
