# Compilation Basics

Guide to using `lightdash compile` effectively.

## Common Flags

| Flag             | Purpose                                     | Example                                 |
| :--------------- | :------------------------------------------ | :-------------------------------------- |
| `--select`, `-s` | Compile specific models and their children. | `lightdash compile -s orders+`          |
| `--verbose`      | Show detailed debug logs.                   | `lightdash compile --verbose`           |
| `--project-dir`  | Path to the dbt project directory.          | `lightdash compile --project-dir ./dbt` |

## Node Selection Syntax

The CLI supports standard dbt selection syntax:

- `model_name`: Selects only the specified model.
- `model_name+`: Selects the model and all its downstream dependencies.
- `+model_name`: Selects the model and all its upstream parents.
- `tag:my_tag`: Selects models with a specific tag.

## Interpreting Failures

- **Syntax Error**: Indicates malformed YAML. Check indentation and reserved keywords.
- **Reference Error**: A dimension or metric references a non-existent column or another field incorrectly.
- **dbt Error**: The underlying dbt compilation failed. Check your dbt models and `dbt_project.yml`.
