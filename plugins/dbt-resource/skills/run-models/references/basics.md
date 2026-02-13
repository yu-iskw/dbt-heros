# Run Basics

`dbt run` materializes models as tables or views in the warehouse.

## Commands

```bash
dbt run                                   # run all models
dbt run --select model_name               # specific model
dbt run --select +model_name              # model and upstream
dbt run --select tag:daily                # by tag
dbt run --select path:models/marts        # by directory
dbt run --full-refresh                    # rebuild incremental models
dbt run --fail-fast                       # stop on first failure
```

## Build (Run + Test + Snapshot + Seed)

```bash
dbt build                                 # full DAG execution
dbt build --select +model_name            # model lineage
dbt build --fail-fast                     # stop on first failure
```

## Retry Failed Models

```bash
dbt retry                                 # re-run only failed models from last run
```

## Seed Loading

```bash
dbt seed                                  # load all seeds
dbt seed --select seed_name               # specific seed
dbt seed --full-refresh                   # drop and reload
```

## Snapshot Execution

```bash
dbt snapshot                              # run all snapshots
dbt snapshot --select snapshot_name       # specific snapshot
```

## Common Patterns

### Development Workflow

```bash
dbt compile --select model_name    # validate SQL
dbt run --select model_name        # materialize
dbt test --select model_name       # verify data quality
```

### Full Deployment

```bash
dbt deps                           # install packages
dbt seed                           # load seeds
dbt build                          # run + test + snapshot
dbt docs generate                  # update documentation
```

## Environment Targets

```bash
dbt run --target dev               # development environment
dbt run --target prod              # production environment
```
