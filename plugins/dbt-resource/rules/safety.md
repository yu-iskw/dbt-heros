# Safety Rules (dbt Resource Development)

1. **Compile Before Run**: ALWAYS run `dbt compile` before executing `dbt run` or `dbt build` to catch errors early.
2. **Test After Changes**: Run `dbt test` after modifying model SQL or YAML properties to verify data quality.
3. **Impact Analysis**: Before renaming or removing columns, check downstream dependencies using `dbt ls --select +model_name+` to understand the blast radius.
4. **Source Freshness**: Run `dbt source freshness` before trusting source data in development.
5. **Non-Destructive Default**: The plugin defaults to read-only mode for warehouse operations. Set `DBT_TOOL_SAFETY_MODE=write` to enable `dbt run`, `dbt build`, `dbt seed`, and `dbt snapshot`.
6. **Version Control**: All dbt resource files (SQL, YAML, CSV) are version-controlled. Never modify files outside the dbt project directory.
