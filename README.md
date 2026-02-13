# Claude Plugin Monorepo Template

Template repository for bootstrapping high-quality Claude Code plugins with shared CI/CD and testing infrastructure.

## Key Features

- **Standard Plugin Layout**: Follows best practices for Skills, Agents, Hooks, MCP, and LSP.
- **Monorepo Ready**: Designed to host multiple plugins under the `plugins/` directory.
- **Comprehensive Examples**: The `hello-world` plugin demonstrates every available extension point.
- **Shared CI/CD**: Unified quality checks via `trunk` and GitHub Actions.
- **Integration Tests**: Automated smoke tests that validate manifest schemas and component discovery across all plugins.

## Repository Layout

```text
.
├── plugins/                     # Container for all plugins
│   └── hello-world/             # Comprehensive sample plugin
│       ├── .claude-plugin/      # Plugin metadata (plugin.json)
│       ├── agents/              # Custom agent definitions
│       ├── skills/              # Model-invoked skills (SKILL.md)
│       ├── hooks/               # Event hook configurations
│       ├── .mcp.json            # MCP server configuration
│       └── .lsp.json            # LSP server configuration
├── integration_tests/           # Shared testing harness
│   ├── run.sh                   # Test orchestrator (scans plugins/)
│   ├── validate-manifest.sh     # Manifest JSON schema validator
│   └── ...
├── .github/workflows/           # GitHub Actions (Lint, Integration Tests)
├── Makefile                     # Task runner
└── README.md
```

## Quickstart

1.  **Create a new repository** from this template.
2.  **Explore the sample plugin** in `plugins/hello-world/` to see how components are defined.
3.  **Run local checks**:
    ```bash
    make lint
    make test-integration-docker
    ```

## Development

### Adding a New Plugin

Create a new directory in `plugins/` following the [Standard Plugin Layout](https://code.claude.com/docs/en/plugins-reference#standard-plugin-layout):

- `plugins/<name>/.claude-plugin/plugin.json`: Required manifest.
- `plugins/<name>/skills/`: Agent Skills folder.
- `plugins/<name>/agents/`: Subagent markdown files.
- `plugins/<name>/hooks/`: Event hook configurations.
- `plugins/<name>/.mcp.json`: MCP configurations.
- `plugins/<name>/.lsp.json`: LSP configurations.

### Testing

The integration test runner (`./integration_tests/run.sh`) automatically discovers all directories in `plugins/` that contain a `.claude-plugin/plugin.json` file.

- Run all tests: `./integration_tests/run.sh`
- Verbose output: `./integration_tests/run.sh --verbose`
- Skip loading tests (if Claude CLI is not installed): `./integration_tests/run.sh --skip-loading`

## CI/CD

- **Trunk Check**: Runs linters and static analysis on every PR.
- **Integration Tests**: Automatically validates every plugin in the `plugins/` directory.

## License

Apache License 2.0. See `LICENSE`.
