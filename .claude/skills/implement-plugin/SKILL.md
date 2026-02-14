---
name: implement-plugin
description: Package and distribute Claude Code plugins with schema-safe manifests, canonical layout, component wiring, and release-ready validation.
---

# Implement Plugin

Implement plugin-level packaging, manifest wiring, structure checks, runtime load checks, and distribution guidance.

## Workflow

1. Define plugin metadata and distribution scope.
2. Update `.claude-plugin/plugin.json` and component path mappings.
3. Validate manifest and directory structure.
4. Verify runtime load with `--plugin-dir` and optional install flow.
5. Run CI-parity smoke tests before distribution.

## Project-Specific Patterns (dbt-superpowers)

When working in this repository:

### Pre-Implementation Checklist

- Review `CLAUDE.md` for architectural philosophy and safety requirements
- Check repository rules in `.claude/rules/` (auto-loaded context)
- Review related ADRs in `docs/adr/` for architectural decisions
- Verify safety mode enforcement is planned if plugin has destructive tools

### Plugin Structure Requirements

- Follow canonical layout (see `.claude/rules/plugin-patterns.md`)
- Use lowercase-with-hyphens naming (e.g., `lightdash-development`)
- Include safety hooks for any destructive tools (see ADR-0005)
- Place plugin-specific components in `plugins/{name}/`
- Place shared components in `.claude/skills/` (not in plugin directories)

### Safety Mode Integration

If the plugin includes destructive operations:

1. Define safety mode requirements in tool descriptions
2. Add PreToolUse hooks in `hooks/hooks.json`
3. Implement deterministic safety checks (not just LLM prompts)
4. Document safety modes in plugin README

### Testing Requirements

Before finalizing plugin:

- Run `make format` and `make lint`
- Run `make test-integration-docker` successfully
- Validate manifest: `./integration_tests/validate-manifest.sh`
- Test plugin loading: `./integration_tests/test-plugin-loading.sh`
- Document test evidence

### Documentation Requirements

- Create/update plugin README in `plugins/{name}/README.md`
- Add entry to main `README.md` plugin table
- Create plugin documentation in `docs/plugins/`
- Create ADR if plugin introduces new architectural patterns

### Monorepo Coordination

- Check if other plugins have similar patterns (avoid duplication)
- Consider extracting shared logic to `.claude/skills/`
- Verify symlink topology remains intact (`.agents/skills`, `.claude/agents`)
- Ensure plugin works independently (no tight coupling to other plugins)

## Progressive Disclosure

- Manifest schema and field rules: `references/manifest-schema.md`
- Directory conventions and anti-patterns: `references/directory-structure.md`
- Test strategy across local/CI: `references/testing-strategies.md`
- Distribution checklist and channels: `references/plugin-distribution.md`
- Scope and install context guidance: `references/plugin-scopes.md`

- Manifest validator: `scripts/validate-manifest.sh`
- Layout validator: `scripts/check-structure.sh`
- Runtime load check: `scripts/test-plugin-load.sh`

- Minimal manifest template: `assets/templates/minimal-plugin.json`
- Complete manifest template: `assets/templates/complete-plugin.json`
- Manifest with components template: `assets/templates/plugin-with-components.json`

## Component Skills

- Hooks: `../implement-hooks/SKILL.md`
- Agent Skills: `../implement-agent-skills/SKILL.md`
- Sub-Agents: `../implement-sub-agents/SKILL.md`
- Agent Teams: `../implement-agent-teams/SKILL.md`
- Umbrella selection guide: `../implement-claude-extensions/SKILL.md`

## Sources

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/plugins-reference
