#!/bin/bash
# safety.sh
# Deterministic safety check for dbt destructive operations.

STRICT_MODE=false
if [[ $1 == "--strict" ]]; then
	STRICT_MODE=true
fi

# Read JSON input from stdin
INPUT=$(cat)
TOOL_NAME=$(echo "${INPUT}" | jq -r '.tool_name')

# Define destructive commands (operations that modify warehouse state)
DESTRUCTIVE_PATTERNS=("dbt run" "dbt build" "dbt seed" "dbt snapshot" "dbt run-operation")

# Check if the tool invocation contains a destructive dbt command
IS_DESTRUCTIVE=false
TOOL_INPUT=$(echo "${INPUT}" | jq -r '.tool_input.command // empty')
for pattern in "${DESTRUCTIVE_PATTERNS[@]}"; do
	if [[ ${TOOL_INPUT} == *"${pattern}"* ]]; then
		IS_DESTRUCTIVE=true
		break
	fi
done

if [[ ${IS_DESTRUCTIVE} == "true" ]]; then
	if [[ ${STRICT_MODE} == "true" || ${DBT_TOOL_SAFETY_MODE} == "read-only" ]]; then
		REASON="SAFETY BLOCK: Command '${TOOL_INPUT}' is blocked."
		if [[ ${STRICT_MODE} == "true" ]]; then
			REASON="${REASON} This plugin is in strict read-only mode."
		else
			REASON="${REASON} DBT_TOOL_SAFETY_MODE is set to \"read-only\". Set to \"write\" to allow warehouse-modifying commands."
		fi

		jq -n --arg reason "${REASON}" '{
      hookSpecificOutput: {
        hookEventName: "PreToolUse",
        permissionDecision: "deny",
        permissionDecisionReason: $reason
      }
    }'
		exit 0
	fi
fi

# Allow the tool to proceed
exit 0
