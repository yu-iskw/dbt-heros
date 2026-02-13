# Validation Basics

Validation ensures that your semantic layer changes haven't broken any existing Lightdash content. Using the CLI allows for a direct comparison between your local changes and the remote project state.

## Workflow

1. **Setup**: Ensure your CLI is configured for the correct project: `lightdash config set-project --name "My Project"`.
2. **Execute**: Run `lightdash validate`.
3. **Analyze**: Review the CLI output for a list of broken charts or dashboards.

## Common CLI Flags

| Flag             | Purpose                                      | Example                                  |
| :--------------- | :------------------------------------------- | :--------------------------------------- |
| `--select`, `-s` | Validate specific models and their children. | `lightdash validate -s orders+`          |
| `--verbose`      | Show detailed debug logs.                    | `lightdash validate --verbose`           |
| `--project-dir`  | Path to the dbt project directory.           | `lightdash validate --project-dir ./dbt` |

## Common Validation Errors

- **Field Not Found**: A chart references a metric or dimension that was renamed or deleted in your local YAML but still exists in the remote project definition.
- **Join Error**: A required join for a chart's field is missing or broken in your local models.
- **SQL Error**: Invalid SQL syntax in a dimension or metric definition that was caught during validation against the remote metadata.

## Best Practices

- Run `lightdash validate` early and often during the development cycle.
- Use the selection flags to focus on the areas you've modified.
- Always validate before running `lightdash deploy`.
