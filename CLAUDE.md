# dbt Superpowers - Claude Code Context

## Project Identity

This is a **multi-plugin monorepo** providing specialized Claude Code plugins for the dbt ecosystem, with a primary focus on Lightdash integration.

**Current Plugins:**

- `lightdash-analysis`: Data discovery and insight generation from Lightdash explores
- `lightdash-content-admin`: Space organization and content validation
- `lightdash-development`: dbt 1.10+ semantic layer modeling (metrics, dimensions)
- `lightdash-org-admin`: Organization management (users, groups, projects)

**Multi-Tool Support:** This repository is designed to work with Claude Code, Codex, and Cursor through a symlinked shared resource architecture (see ADR-0013).

## Architectural Philosophy

### 1. Safety First (ADR-0005)

All destructive operations are **deterministically enforced** through PreToolUse hooks, not just LLM prompts. Safety modes:

- `read-only`: No mutations allowed
- `write-safe`: Non-destructive writes only
- `write-destructive`: Requires explicit opt-in

**Rule:** When implementing or using tools, verify the safety mode enforcement is in place before allowing destructive operations.

### 2. Start Simple (ANTHROPIC_BEST_PRACTICES.md)

Use the **complexity scoring framework** (0-10 scale) before implementing:

- **0-3**: Simple Skill (deterministic, single task)
- **4-6**: Workflow Skill (multi-step, some branching)
- **7-8**: Sub-Agent (autonomous, model-driven decisions)
- **9-10**: Agent Team (multi-agent coordination)

**Rule:** Always ask "Can this be simpler?" before choosing a more complex extension type.

### 3. Shared Resources Architecture (ADR-0013)

Canonical shared skills live in `.claude/skills/` with symlinks for cross-tool compatibility:

- `.agents/skills` → `../.claude/skills` (Codex compatibility)
- `.claude/agents` → `../.agents/agents` (shared sub-agents)
- `.cursor/skills/shared` → `../../.agents/skills` (Cursor compatibility)

**Rule:** When creating shared skills or sub-agents, place them in `.claude/skills/` or `.agents/agents/`, not in plugin directories.

### 4. ADR-Driven Architecture

All architectural decisions are documented in `docs/adr/`. Before making significant architectural changes:

1. Check existing ADRs for context
2. Use the `/manage-adr` skill to create new ADRs
3. Link to related ADRs

**Rule:** Architectural changes without ADRs are not accepted.

### 5. Eval-Driven Development

Before implementing agents or complex skills, create **20-50 test cases** representing real scenarios. Build evals BEFORE satisfying them.

**Rule:** Complex features (complexity score 4+) require documented test cases before implementation.

## Navigation

### Core Documentation

- **Architecture Decisions**: `docs/adr/` (13 decisions recorded)
- **Best Practices Guide**: `.claude/ANTHROPIC_BEST_PRACTICES.md`
- **Plugin Documentation**: `docs/plugins/lightdash_plugins.md`
- **Contributing Guide**: `CONTRIBUTING.md`

### Key Skills for This Repository

- `/implement-plugin`: Create new plugins or modify existing ones
- `/plugin-verification`: Validate plugin structure, manifests, and runtime loading
- `/implement-agent-skills`: Create new skills with proper frontmatter
- `/implement-sub-agents`: Create autonomous sub-agents with correct permissions
- `/manage-adr`: Initialize, create, list, and link Architecture Decision Records

### Testing & Validation

- Linting: `make lint` (runs Trunk)
- Formatting: `make format`
- Integration Tests: `make test-integration-docker`
- Individual validation: `./integration_tests/validate-manifest.sh`

## Project-Specific Patterns

### Plugin Structure

Each plugin follows this canonical layout:

```text
plugins/{plugin-name}/
├── .claude-plugin/
│   └── plugin.json         # Manifest (name, description, components)
├── agents/                 # Plugin-specific sub-agents
├── hooks/                  # PreToolUse, PostToolUse hooks
├── rules/                  # Plugin-specific rules (auto-loaded)
├── skills/                 # Plugin-specific skills
└── README.md              # Plugin documentation
```

### Safety Mode Integration

When implementing tools that mutate state:

1. Define the tool in the plugin's MCP server or tool definition
2. Add a PreToolUse hook in `hooks/hooks.json`
3. Reference `.claude/hooks/safety-check.sh` (or plugin-specific safety script)
4. Document the safety mode requirement in the tool description

### Monorepo Coordination

- **Shared skills** are in `.claude/skills/` and loaded by all plugins via symlinks
- **Plugin-specific skills** are in `plugins/{name}/skills/` and only loaded when that plugin is active
- **Rules** in `.claude/rules/` apply repository-wide; rules in `plugins/{name}/rules/` are plugin-specific

## When Working on This Repository

1. **Before creating new components**: Use `/implement-claude-extensions` to determine if you need a skill, sub-agent, hook, or team
2. **Before implementing**: Score complexity (0-10) and choose the simplest approach
3. **Before committing**: Run `make format && make lint`
4. **Before opening PRs**: Run `make test-integration-docker` and document test evidence
5. **For architectural changes**: Create an ADR using `/manage-adr`

## Common Workflows

### Adding a New Plugin

1. Use `/implement-plugin` skill
2. Follow the canonical plugin structure above
3. Add safety enforcement hooks if tools are destructive
4. Update the plugin table in `README.md`
5. Create plugin documentation in `docs/plugins/`
6. Create ADR documenting the plugin decision

### Enhancing Existing Plugins

1. Read the plugin's `README.md` and `rules/` to understand constraints
2. Check related ADRs for architectural context
3. Verify your changes maintain safety mode enforcement
4. Update plugin documentation if behavior changes
5. Run plugin-specific integration tests

### Contributing Shared Skills

1. Place skill in `.claude/skills/{skill-name}/SKILL.md`
2. Ensure skill has proper YAML frontmatter
3. Test that skill is accessible via symlinks (`.agents/skills/`)
4. Update `.claude/skills/README.md` if creating new shared skill

---

**Instruction Count Estimate**: ~95 instructions (slightly above target; optimize if needed)
**Last Updated**: 2026-02-14
**Cross-Platform Compatible**: Claude Code, Codex (via AGENTS.md), Cursor
