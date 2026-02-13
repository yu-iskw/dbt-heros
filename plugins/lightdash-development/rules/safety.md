# Safety Rules (YAML Development)

1.  **Read-Only for Remote Assets**: This plugin is strictly non-destructive for remote assets. Remote asset mutation (upsert) is disallowed.
2.  **Validation Dependency**: Always run `validate_project` after editing local YAML files to ensure remote consistency.
3.  **Impact Analysis**: Always check `list_charts_as_code` before renaming or deleting fields to understand downstream impact.
