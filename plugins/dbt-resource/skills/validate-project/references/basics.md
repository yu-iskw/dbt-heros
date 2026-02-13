# Validation Basics

`dbt test` executes data quality checks. `dbt source freshness` checks data recency.

## Test Execution

```bash
dbt test                                  # all tests
dbt test --select model_name              # tests for one model
dbt test --select "test_type:singular"    # singular tests only
dbt test --select "test_type:generic"     # generic tests only
dbt test --select tag:critical            # tests with specific tag
dbt test --select source:jaffle_shop      # source tests
```

## Source Freshness

```bash
dbt source freshness                           # check all sources
dbt source freshness --select source:jaffle_shop  # specific source
```

Results are saved to `target/sources.json`.

## Test Result Interpretation

| Status | Meaning |
|:--|:--|
| `Pass` | Test returned zero rows (all data passes) |
| `Fail` | Test returned one or more rows (data quality issue) |
| `Warn` | Test exceeded warn threshold but not error threshold |
| `Error` | Test SQL itself failed to execute |

## Freshness Result Interpretation

| Status | Meaning |
|:--|:--|
| `Pass` | Data is within acceptable freshness thresholds |
| `Warn` | Data age exceeds `warn_after` but not `error_after` |
| `Error` | Data age exceeds `error_after` threshold |
| `Runtime Error` | Could not query the freshness column |

## Build Command

`dbt build` combines run + test + snapshot + seed in DAG order:

```bash
dbt build                              # full build
dbt build --select +model_name         # model and upstream
dbt build --fail-fast                  # stop on first failure
```
