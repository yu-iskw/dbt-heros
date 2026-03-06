---
name: manage-lightdash-agents
description: CRUD operations for Lightdash project agents.
---

# Manage Lightdash Agents

Skill for managing the lifecycle of AI agents within Lightdash projects.

## Purpose

Provides tools for creating, reading, updating, and deleting Lightdash AI agents. This is the foundation of AgentOps, allowing you to define agent personas, system prompts, and operational parameters.

## Tools

Wraps the following MCP tools from the `lightdash-tools` server:

- `ldt__list_project_agents`
- `ldt__get_project_agent`
- `ldt__create_project_agent`
- `ldt__update_project_agent`
- `ldt__delete_project_agent`

## Safety Mode Compliance

- **Read Tools**: `list_project_agents`, `get_project_agent`.
- **Write-Safe Tools**: `create_project_agent`, `update_project_agent`.
- **Write-Destructive Tools**: `delete_project_agent`.

## Behavior

1. **Bootstrap Workflow**:
   - When asked to create an agent, first use `ldt__list_projects` to identify the correct `projectUuid`.
   - Check if an agent with a similar name already exists using `ldt__list_project_agents`.
2. **Configuration**:
   - When creating or updating an agent, ensure the `systemPrompt` is clear and follows Lightdash best practices.
   - Reference the `eval-driven-agentops.mdc` rule to ensure an evaluation suite is in place before making significant prompt changes.
3. **Safety Enforcement**:
   - Deletion of an agent requires `LIGHTDASH_TOOLS_SAFETY_MODE=write-destructive`.

## Rules

- NEVER delete an agent without explicit confirmation.
- ALWAYS verify the `projectUuid` before performing any operation.
- Use `ldt__get_project_agent` to inspect the full configuration of an agent before updating it.
