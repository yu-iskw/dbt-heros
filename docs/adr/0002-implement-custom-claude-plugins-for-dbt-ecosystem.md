# 2. Implement Custom Claude Plugins for dbt Ecosystem

Date: 2026-02-13

## Status

Accepted

## Context

The project aims to enhance the development workflow for the dbt ecosystem, specifically integrating dbt Core, Lightdash, and Elementary Data.

Currently, developers manage these tools independently, leading to inconsistent workflows and manual configuration overhead. We need a unified approach to streamline development, testing, and deployment across these platforms.

The `superpowers` plugin framework provides a robust foundation for building agentic skills and workflows. By leveraging this framework, we can create specialized plugins that encapsulate domain-specific knowledge and best practices for each tool in the dbt ecosystem.

Key requirements:

- Seamless integration with dbt projects.
- Support for Lightdash as a BI platform.
- Integration with Elementary Data for data observability.
- Modular architecture to allow independent updates and extensions.

## Decision

We will implement a suite of custom Claude Code plugins built on top of the `superpowers` framework. The architecture will consist of:

1. **Core dbt Plugin**:
   - Handles dbt project structure, configuration, and execution.
   - Provides skills for model development, testing, and documentation.
   - Integrates with dbt CLI for command execution.

2. **Lightdash Plugin**:
   - Extends the core dbt plugin to support Lightdash-specific configurations.
   - Provides skills for defining metrics, dimensions, and dashboards.
   - Facilitates preview and deployment of Lightdash projects.

3. **Elementary Data Plugin**:
   - Integrates Elementary's dbt package and CLI.
   - Provides skills for setting up data monitoring and anomaly detection.
   - Automates the generation of observability reports.

4. **Superpowers Integration**:
   - Each plugin will register its skills and commands with the Superpowers framework.
   - We will follow the standard plugin structure: `agents`, `commands`, `hooks`, and `skills`.

This approach allows us to:

- Reuse the existing capabilities of `superpowers` (e.g., planning, debugging).
- Define clear boundaries between different tools while maintaining a cohesive workflow.
- Enable developers to activate only the plugins relevant to their specific stack.

## Consequences

### Positive

- **Unified Workflow**: Developers can use a consistent interface for dbt, Lightdash, and Elementary tasks.
- **Improved Productivity**: Automated workflows and specialized skills reduce manual effort.
- **Standardization**: Enforces best practices across the dbt ecosystem.
- **Extensibility**: New tools can be added as separate plugins without disrupting existing functionality.

### Negative

- **Maintenance Overhead**: Managing multiple plugins requires ongoing maintenance and compatibility checks.
- **Learning Curve**: Developers need to familiarize themselves with the plugin commands and workflows.
- **Dependency Management**: Ensuring compatibility between plugin versions and underlying tool versions (dbt, Lightdash CLI, Elementary CLI) can be complex.

### Risks

- **Plugin Conflicts**: Potential conflicts between plugins if they modify shared resources or configuration files.
- **API Changes**: Updates to the underlying tools (dbt, Lightdash, Elementary) may require significant updates to the plugins.

### Mitigation

- Implement comprehensive integration tests for each plugin.
- Use version pinning for dependencies.
- maintain clear documentation for plugin usage and configuration.
