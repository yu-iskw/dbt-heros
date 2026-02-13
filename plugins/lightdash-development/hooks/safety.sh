#!/bin/bash
# safety.sh
# Deterministic safety check for Lightdash destructive tools.

STRICT_MODE=false
if [[ $1 == "--strict" ]]; then
	STRICT_MODE=true
fi

# Read JSON input from stdin
INPUT=$(cat)
TOOL_NAME=$(echo "${INPUT}" | jq -r '.tool_name')

# Define destructive tools
DESTRUCTIVE_TOOLS=("lightdash_tools__delete_member" "lightdash_tools__upsert_chart_as_code")

# Check if the current tool is in the destructive list
IS_DESTRUCTIVE=false
for tool in "${DESTRUCTIVE_TOOLS[@]}"; do
	if [[ ${TOOL_NAME} == "${tool}" ]]; then
		IS_DESTRUCTIVE=true
		break
	fi
done

if [[ ${IS_DESTRUCTIVE} == "true" ]]; then
	# Check safety mode or strict mode
	if [[ ${STRICT_MODE} == "true" || ${LIGHTDASH_TOOL_SAFETY_MODE} != "write-destructive" ]]; then
		# Return a JSON decision to block the tool
		REASON="CRITICAL SECURITY BLOCK: Tool ${TOOL_NAME} is blocked."
		if [[ ${STRICT_MODE} == "true" ]]; then
			REASON="${REASON} This plugin is strictly non-destructive."
		else
			REASON="${REASON} LIGHTDASH_TOOL_SAFETY_MODE is not set to \"write-destructive\" (current: \"${LIGHTDASH_TOOL_SAFETY_MODE}\")."
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
