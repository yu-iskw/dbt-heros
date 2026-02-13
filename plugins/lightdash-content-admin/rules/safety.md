# Safety Rules (Dashboard Development)

1.  **Safety Mode Compliance**: ALWAYS check `LIGHTDASH_TOOL_SAFETY_MODE` before performing upsert operations.
2.  **Destructive Awareness**: While this plugin allows `upsert_chart_as_code`, remember that it overwrites existing definitions. ALWAYS verify the payload before calling.
3.  **Validation Dependency**: Coordinate with the 'lightdash-developer' to ensure any YAML changes are validated before building charts on top of them.
