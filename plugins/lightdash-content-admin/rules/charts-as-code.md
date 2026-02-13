# Charts-as-Code Rules

1.  **Code Over GUI**: Prefer `upsert_chart_as_code` for all chart modifications to ensure version control compatibility.
2.  **Schema Verification**: Use `list_charts_as_code` to retrieve and verify existing chart definitions before making changes.
3.  **Payload Integrity**: Ensure that the chart JSON payload includes all necessary fields (metricQuery, chartConfig, etc.) before upserting.
