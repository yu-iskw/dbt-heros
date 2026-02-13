# dbt Fusion CLI Reference

dbt Fusion is the next-generation dbt execution engine written in Rust. It provides faster parsing, SQL comprehension, and stricter validation.

## Installation

```bash
# Install dbt Fusion
curl -fsSL https://install.dbt.com | bash

# Verify installation
dbt --version
```

If another dbt CLI is already installed, use the `dbtf` alias.

## Core Commands

### Compilation and Parsing

| Command | Description |
|:--|:--|
| `dbt compile` | Compile SQL and validate project structure |
| `dbt parse` | Parse project files without compilation |
| `dbt debug` | Test database connection and project configuration |
| `dbt deps` | Install package dependencies |
| `dbt clean` | Remove `target/` and `dbt_packages/` |

### Execution

| Command | Description |
|:--|:--|
| `dbt run` | Materialize models in the warehouse |
| `dbt build` | Run models + tests + snapshots + seeds in DAG order |
| `dbt test` | Execute data tests |
| `dbt seed` | Load seed CSV files into the warehouse |
| `dbt snapshot` | Execute snapshot SCD Type 2 logic |

### Documentation

| Command | Description |
|:--|:--|
| `dbt docs generate` | Generate documentation catalog |
| `dbt docs serve` | Serve documentation locally |

### Source Management

| Command | Description |
|:--|:--|
| `dbt source freshness` | Check source data freshness |

### Utility

| Command | Description |
|:--|:--|
| `dbt ls` | List resources in the project |
| `dbt run-operation` | Execute a macro directly |
| `dbt retry` | Retry the last failed run |

## Node Selection

```bash
dbt run --select model_name           # specific model
dbt run --select +model_name          # model + all upstream
dbt run --select model_name+          # model + all downstream
dbt run --select +model_name+         # full lineage
dbt run --select tag:daily            # by tag
dbt run --select path:models/staging  # by directory
dbt run --select source:jaffle_shop+  # source descendants
dbt test --select "test_type:generic" # by test type
```

### Selection Methods

| Method | Syntax |
|:--|:--|
| By name | `model_name` |
| By tag | `tag:value` |
| By path | `path:models/staging` |
| By source | `source:name` |
| By exposure | `exposure:name` |
| By config | `config.materialized:incremental` |
| By test type | `test_type:generic` or `test_type:singular` |

### Graph Operators

| Operator | Meaning |
|:--|:--|
| `+model` | Model and all ancestors |
| `model+` | Model and all descendants |
| `+model+` | Full lineage |
| `@model` | Model, ancestors, and descendants of ancestors |
| `model --exclude other` | Selection minus exclusion |

## Fusion-Specific Features

- **Faster Parsing**: Up to 30x faster than dbt Core.
- **SQL Comprehension**: Understands column types, function signatures, and output types.
- **Stricter Validation**: Catches ambiguous YAML that dbt Core ignores.
- **State-Aware Orchestration**: Skips model builds when upstream sources have no new data.
- **Auto-loads `.env`**: Reads environment variables from `.env` files in the working directory.

## Profile Configuration

Fusion searches for `profiles.yml` in:
1. `--profiles-dir` flag
2. Project root directory
3. `~/.dbt/`

```yaml
# profiles.yml
my_project:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: oauth
      project: my-project
      dataset: dev_schema
      threads: 4
    prod:
      type: bigquery
      method: service-account
      project: my-project
      dataset: prod_schema
      threads: 8
      keyfile: /path/to/keyfile.json
```
