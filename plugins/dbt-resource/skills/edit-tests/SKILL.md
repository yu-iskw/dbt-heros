# Edit Tests

Skill for creating and modifying dbt data tests (generic and singular).

## Purpose

Enables the creation and configuration of data quality tests, including generic tests in YAML and singular test SQL files.

## Behavior

1. **Generic Tests**: Add `data_tests` to column definitions in YAML property files.
2. **Singular Tests**: Write custom SQL queries in `tests/` that return failing rows.
3. **Custom Generic Tests**: Create reusable test macros in `tests/generic/`.
4. **Reference Consultation**: ALWAYS check `references/basics.md` and `references/advanced.md` for syntax patterns.

## References

- [Basics](./references/basics.md): Built-in generic tests and singular test structure.
- [Advanced](./references/advanced.md): Custom generic tests, test configuration, and severity.
- [Naming Conventions](../../shared/references/naming-conventions.md): Test naming standards.

## Rules

- ALWAYS add `unique` and `not_null` tests to primary key columns.
- Use `relationships` tests to enforce referential integrity.
- Singular tests MUST return zero rows when passing.
- Refer to `read-tests` to verify existing test coverage before adding tests.
