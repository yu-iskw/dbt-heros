# Compile Basics

`dbt compile` validates SQL and YAML without materializing models.

## Commands

```bash
dbt compile                              # compile entire project
dbt compile --select model_name          # compile specific model
dbt compile --select +model_name         # model and all upstream
dbt compile --select tag:daily           # all models with tag
```

## Output

Compiled SQL is written to `target/compiled/<project_name>/models/`.

```bash
# View compiled SQL for a specific model
cat target/compiled/my_project/models/staging/stg_orders.sql
```

## Common Errors

| Error | Cause | Fix |
|:--|:--|:--|
| `Compilation Error: ref('x') not found` | Missing or misspelled model name | Check model exists and name matches |
| `Compilation Error: source('x', 'y') not found` | Missing source definition | Add source to YAML |
| `YAML parsing error` | Invalid YAML syntax | Check indentation and structure |
| `Jinja Error` | Invalid Jinja syntax | Check `{{ }}` and `{% %}` blocks |

## Fusion-Specific Validation

dbt Fusion provides stricter validation than dbt Core:
- Catches ambiguous YAML configurations.
- Validates SQL column types and function signatures.
- Reports cross-platform SQL compatibility issues.
