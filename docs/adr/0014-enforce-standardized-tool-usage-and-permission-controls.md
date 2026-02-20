# ADR 0014: Enforce Standardized Tool Usage and Permission Controls

## Status

Accepted

## Context

The repository provides multiple specialized Claude Code plugins for various tools in the dbt ecosystem (e.g., Lightdash, dbt Core, dbt Fusion). These plugins interact with external APIs (like Lightdash) or perform local operations via CLIs (like dbt).

We have identified two main issues:

1. **Bypassing Standardized Tools**: Agents might attempt to use `curl`, `wget`, or raw API calls to interact with services, which bypasses the standardized tool interface (MCP), safety checks, and error handling.
2. **Permission Mismatches**: Some plugins were configured with restrictive safety modes that did not align with their designated administrative or development roles.

## Decision

We will strictly enforce the use of standardized tools (MCP or designated CLIs) and align permissions with agent responsibilities across the entire monorepo.

### 1. Prohibit Raw API Calls

Every agent's instructions (in `agents/*.md`) must explicitly forbid the use of `curl`, `wget`, or any other raw API calls. Agents are mandated to use only the provided MCP tools or the specific CLI-based skills defined in the plugin.

### 2. Mandatory Tool Verification

Agents are instructed to verify the availability and permissions of their tools at the start of a task. This ensures they are aware of their current context (e.g., safety modes, environment variables) before proceeding.

### 3. Permission Alignment

Plugin manifests (e.g., `.mcp.json`) must reflect the necessary safety mode for their designated roles. For example:

- Administrative plugins (e.g., `lightdash-org-admin`) require `write-destructive` for management tasks.
- Content management plugins (e.g., `lightdash-content-admin`) require `write-destructive` for reorganization and deletions.
- Development and Analysis plugins typically operate in `read-only` or `write-safe` modes depending on their impact on remote state.

### 4. Application to dbt Agents

While dbt Core and Fusion agents primarily use the dbt CLI via `Shell` tools, they are also subject to this policy. They must not attempt to interact with dbt Cloud APIs or other services via raw `curl` commands if standardized skills or MCP tools are available.

## Consequences

- **Pros**:
  - Improved security and predictability by funneling all interactions through standardized layers.
  - Reduced brittleness of agents by preventing them from crafting manual, unverified API requests.
  - Consistent agent behavior and instruction sets across the monorepo.
- **Cons**:
  - Slightly increased overhead for agents to perform tool verification at the beginning of sessions.
- **Mitigation**: Standardizing the "Instructions" section across all agents makes this policy easy to implement and maintain.
