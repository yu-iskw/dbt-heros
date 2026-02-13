# Preview Basics

Guide to using `lightdash preview` and `lightdash stop-preview` effectively.

## Common Flags

### `lightdash preview`

| Flag            | Purpose                                                  | Example                                 |
| :-------------- | :------------------------------------------------------- | :-------------------------------------- |
| `--name`        | **Required**: A unique name for the preview environment. | `lightdash preview --name feature-x`    |
| `--project-dir` | Path to the dbt project directory.                       | `lightdash preview --project-dir ./dbt` |
| `--verbose`     | Show detailed debug logs.                                | `lightdash preview --verbose`           |

### `lightdash stop-preview`

| Flag     | Purpose                                                    | Example                                   |
| :------- | :--------------------------------------------------------- | :---------------------------------------- |
| `--name` | **Required**: The name of the preview environment to stop. | `lightdash stop-preview --name feature-x` |

## Lifecycle Management

1. **Start**: `lightdash preview --name my-feature`
2. **Review**: Check the output for the URL of the temporary project.
3. **Update**: Re-run the same command if you make more local changes.
4. **End**: `lightdash stop-preview --name my-feature`

## Best Practices

- Use short, kebab-case names for preview environments.
- Include the branch name or issue number in the preview name for traceability.
- Always clean up your previews before concluding a development task.
