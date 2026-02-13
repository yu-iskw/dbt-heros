# Read Models

Skill for inspecting dbt model SQL files and their YAML property definitions.

## Purpose

Enables inspection of model SQL logic, materialization strategy, YAML properties (descriptions, columns, tests), and inter-model dependencies via `ref()`.

## Behavior

1. **SQL Inspection**: Read model SQL files in `models/` to understand transformation logic, CTEs, and `ref()`/`source()` usage.
2. **YAML Inspection**: Read corresponding YAML property files to review column descriptions, tests, and configurations.
3. **Dependency Analysis**: Use `dbt ls --select +model_name+` to understand upstream and downstream dependencies.
4. **Layer Identification**: Determine model layer (staging, intermediate, mart) from directory and naming conventions.

## Rules

- Use `read-models` to understand existing model structure before proposing any changes.
- Check both the SQL file and its YAML properties file for a complete picture.
- Verify `ref()` dependencies to understand the DAG position of a model.
