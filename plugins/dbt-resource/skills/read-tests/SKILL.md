# Read Tests

Skill for inspecting dbt test definitions (generic and singular).

## Purpose

Enables inspection of data test configurations — both generic tests declared in YAML properties and singular test SQL files in the `tests/` directory.

## Behavior

1. **Generic Test Review**: Read YAML property files to identify `data_tests` on columns (unique, not_null, accepted_values, relationships).
2. **Singular Test Inspection**: Read SQL files in `tests/` to understand custom validation queries.
3. **Custom Generic Test Review**: Inspect macro-based generic tests in `tests/generic/` or `macros/`.
4. **Test Coverage Analysis**: Identify models or columns missing critical tests (unique, not_null on primary keys).

## Rules

- Use `read-tests` to understand existing test coverage before adding new tests.
- Check both YAML-declared generic tests and standalone singular test files.
