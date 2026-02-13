---
name: implement-sub-agents
description: Create and validate Claude sub-agent definitions with correct frontmatter, tool permissions, and delegation boundaries.
---

# Implement Sub-Agents

Create or update agent files under `agents/` with explicit role boundaries, model/tool settings, and delegation patterns.

## Workflow

1. **Assess complexity**: Verify that sub-agent is needed (score 7-8). If simpler approach works, use skill instead.
2. **Define role**: Clear purpose, responsibilities, and explicit boundaries
3. **Set decision authority**: What agent can/cannot do autonomously
4. **Configure tools**: Least privilege access to required tools only
5. **Author/update**: Agent markdown with valid frontmatter
6. **Context strategy**: Define how agent manages context (retrieval, summarization, state)
7. **Plan evaluations**: Identify 20-50 test scenarios covering success and failure modes
8. **Validate**: Check frontmatter and agent file structure
9. **Connect selectively**: Link related skills/hooks only when required

## Progressive Disclosure

### Best Practices (Anthropic Guidelines)

- **Complexity decision framework**: `../implement-claude-extensions/references/decision-framework.md`
- **Context management patterns**: `../implement-claude-extensions/references/context-management.md`
- **Evaluation strategy**: `../implement-claude-extensions/references/evaluation-strategy.md`

### Sub-Agent Design

- Agent frontmatter rules: `references/subagent-frontmatter.md`
- Tool access strategy: `references/subagent-tools.md`
- Model selection guidance: `references/subagent-models.md`
- Permission boundaries: `references/subagent-permissions.md`
- Delegation patterns: `references/subagent-delegation.md`

### Validation Tools

- Agent file validator: `scripts/validate-subagent.sh`
- Frontmatter checker: `scripts/check-subagent-frontmatter.sh`

### Templates (by Complexity)

- **Level 3 - Autonomous Agent** (Score 7-8): `assets/templates/subagent-autonomous.md`
- Base sub-agent template: `assets/templates/subagent-template.md`
- Read-only sub-agent example: `assets/templates/subagent-readonly.md`
- Sub-agent with skills example: `assets/templates/subagent-with-skills.md`
- Sub-agent with hooks example: `assets/templates/subagent-with-hooks.md`

## Related Skills

- Umbrella routing and architecture: `../implement-claude-extensions/SKILL.md`
- Agent team coordination: `../implement-agent-teams/SKILL.md`

## Sources

- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/plugins
