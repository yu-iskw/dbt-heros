# 10. Implement root-level plugin marketplace for local development

Date: 2026-02-13

## Status

Accepted

## Context

The `claude --plugin-dir` flag in the Claude Code CLI is designed to load a single plugin for local testing. However, this project contains multiple specialized plugins (e.g., `lightdash-development`, `lightdash-analysis`, `lightdash-content-admin`, `lightdash-org-admin`) located in a `plugins/` directory.

When a developer tries to load all plugins using `claude --plugin-dir plugins`, the CLI fails to discover them because it expects a single plugin manifest at the provided path.

Claude Code supports a "Marketplace" concept, where a `marketplace.json` file can catalog multiple plugins. By creating a root-level marketplace, developers can add the entire repository as a local marketplace, enabling all plugins simultaneously.

## Decision

We will implement a root-level plugin marketplace by:

1.  Creating a `.claude-plugin/` directory at the project root.
2.  Adding a `marketplace.json` file inside `.claude-plugin/` that catalogs all plugins in the `plugins/` directory.
3.  Defining the `source` path for each plugin relative to the project root.

This structure allows developers to run:

```bash
/plugin marketplace add .
```

within Claude Code to discover and install all local plugins.

## Consequences

- **Discovery**: All local plugins will be discoverable and manageable through the standard `/plugin` interface.
- **Convenience**: No need to use multiple `--plugin-dir` flags or remember complex paths.
- **Standards**: Follows the recommended Anthropic pattern for managing multiple plugins.
- **Structure**: The root-level `.claude-plugin/` directory will become the central hub for project-level plugin metadata.
