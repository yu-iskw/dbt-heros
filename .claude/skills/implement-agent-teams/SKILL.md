---
name: implement-agent-teams
description: Set up and validate Claude agent team configurations, collaboration flows, and operator guidance for team-based execution.
---

# Implement Agent Teams

Implement team setup and coordination patterns for multi-agent workflows, including display modes and operational constraints.

## Workflow

1. **Validate complexity**: Confirm team is needed (score 9-10). Can multiple specialized sub-agents work independently?
2. **Define team objective**: Clear goal requiring coordinated multi-agent execution
3. **Identify members**: Specialized agents with non-overlapping responsibilities
4. **Set boundaries**: Clear ownership and handoff contracts between agents
5. **Configure metadata**: Team metadata and task routing conventions
6. **Plan coordination**: Sequential vs parallel execution patterns
7. **Document rules**: Coordination rules and display mode choices
8. **Evaluation strategy**: How to test team-based workflows (20-50 scenarios)
9. **Run checks**: Environment and config validation
10. **Verify fallbacks**: Limitations and fallback behavior

## Progressive Disclosure

### Best Practices (Anthropic Guidelines)

- **Complexity decision framework**: `../implement-claude-extensions/references/decision-framework.md`
- **Context management patterns**: `../implement-claude-extensions/references/context-management.md`
- **Evaluation strategy**: `../implement-claude-extensions/references/evaluation-strategy.md`

### Team Design

- Team setup structure: `references/team-setup.md`
- Coordination contracts: `references/team-coordination.md`
- Display mode selection: `references/team-display-modes.md`
- Team best practices: `references/team-best-practices.md`
- Known limitations: `references/team-limitations.md`

### Validation Tools

- Team config checker: `scripts/check-team-config.sh`
- Environment verifier: `scripts/verify-team-env.sh`

### Templates

- Team config example: `assets/templates/team-config-example.json`
- Team task example: `assets/templates/team-task-example.md`

## Related Skills

- Umbrella routing and component comparison: `../implement-claude-extensions/SKILL.md`
- Sub-agent design: `../implement-sub-agents/SKILL.md`

## Sources

- https://code.claude.com/docs/en/agent-teams
- https://code.claude.com/docs/en/sub-agents
