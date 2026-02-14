---
name: plugin-verification
description: Verify Claude extensions and plugins across hooks, skills, sub-agents, teams, manifest, structure, runtime loading, and CI parity.
---

# Plugin Verification

Run layered verification for extension components and plugin packaging before CI and release.

## Validation Levels

1. Component-level verification (hooks, skills, sub-agents, teams).
2. Manifest JSON + schema checks.
3. Directory and file layout checks.
4. CLI load and visibility checks.
5. Docker smoke-test parity with CI.

## Project-Specific Validation (dbt-superpowers)

When verifying plugins in this monorepo:

### Repository-Wide Checks

- **CLAUDE.md Context**: Verify CLAUDE.md exists and contains ~60-100 instructions
- **Repository Rules**: Ensure `.claude/rules/` directory exists with required rule files
- **Symlink Topology**: Validate critical symlinks (see ADR-0013):
  - `.agents/skills` → `../.claude/skills`
  - `.claude/agents` → `../.agents/agents`
  - `.cursor/skills/shared` → `../../.agents/skills`
- **ADR Compliance**: Check that architectural changes have corresponding ADRs

### Monorepo-Specific Plugin Checks

- **Naming Convention**: Plugin name uses lowercase-with-hyphens format
- **Shared vs Plugin Components**:
  - Verify shared skills are in `.claude/skills/`, not plugin directories
  - Verify plugin-specific components are in `plugins/{name}/`
- **Safety Enforcement**: For plugins with destructive tools:
  - Verify PreToolUse hooks are defined in `hooks/hooks.json`
  - Check safety scripts exist and are executable
  - Validate safety mode documentation in README
- **Plugin Independence**: Verify plugin works independently (no hard dependencies on other plugins)

### Integration Test Suite

Before marking verification complete:

- `make format` - Apply formatting (must pass)
- `make lint` - Trunk linter checks (must pass)
- `make test-integration-docker` - Full Docker-based integration tests
- `./integration_tests/validate-manifest.sh` - Manifest validation
- `./integration_tests/test-plugin-loading.sh` - Plugin load verification
- `./integration_tests/validate-agent-links.sh` - Symlink topology check

### Documentation Completeness

- Plugin `README.md` exists with installation and usage instructions
- Plugin entry in root `README.md` plugin table (with status badge)
- Plugin documentation in `docs/plugins/` (if applicable)
- ADR created if plugin introduces new patterns (reference ADR-0002)

### Cross-Plugin Consistency

For this monorepo with multiple Lightdash plugins:

- Verify similar patterns are implemented consistently across plugins
- Check that shared Lightdash patterns are extracted to `.claude/skills/`
- Validate plugin separation of concerns (analysis vs development vs admin)
- Ensure safety modes are consistent with plugin purposes

## Progressive Disclosure

- Validation level model: `references/validation-levels.md`
- Troubleshooting guide: `references/common-issues.md`
- CLI command reference: `references/cli-commands.md`
- CI/CD alignment: `references/ci-integration.md`
- Hook verification guidance: `references/verify-hooks.md`
- Skill verification guidance: `references/verify-skills.md`
- Sub-agent verification guidance: `references/verify-subagents.md`
- Team verification guidance: `references/verify-teams.md`

- Level 2 script: `scripts/verify-manifest.sh`
- Level 3 script: `scripts/verify-structure.sh`
- Level 4 script: `scripts/verify-load.sh`
- Level 5 script: `scripts/verify-ci.sh`
- All levels: `scripts/verify-all.sh`

- Checklist: `assets/checklists/verification-checklist.md`
- Mistake guide: `assets/checklists/common-mistakes.md`

## Related Skills

- Umbrella guide: `../implement-claude-extensions/SKILL.md`
- Hooks implementation: `../implement-hooks/SKILL.md`
- Agent Skills implementation: `../implement-agent-skills/SKILL.md`
- Sub-Agent implementation: `../implement-sub-agents/SKILL.md`
- Agent Team implementation: `../implement-agent-teams/SKILL.md`
- Plugin packaging: `../implement-plugin/SKILL.md`

## Sources

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/agent-teams
- https://code.claude.com/docs/en/hooks-guide
