# Essential CLI Commands

Lifecycle management commands for analytics engineers.

## Compilation & Deployment

- `lightdash compile`: Local check of dbt and Lightdash explores.
- `lightdash deploy`: Sync semantic layer to Lightdash Cloud.
- `lightdash refresh`: Pull latest code from linked GitHub repo.

## Testing & Validation

- `lightdash preview`: Create a temporary environment to test changes safely.
- `lightdash start-preview`: Persistent preview environment.
- `lightdash validate`: Compare local YAML files against remote project content to find broken charts.

## Automated Generation

- `lightdash generate -s model_name`: Scaffolds `schema.yml` for a model including all warehouse columns.
- `lightdash dbt run -s model_name`: Runs dbt then updates `schema.yml` for changes.

## Global Options

- `--verbose`: Show detailed execution logs.
- `--select` / `-s`: Standard dbt node selection.
