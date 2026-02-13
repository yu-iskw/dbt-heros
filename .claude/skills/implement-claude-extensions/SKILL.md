---
name: implement-claude-extensions
description: Choose and implement the right Claude extension type by comparing hooks, skills, sub-agents, agent teams, and plugin packaging patterns.
---

# Implement Claude Extensions

Use this umbrella skill to choose the correct extension type and route implementation to the appropriate component skill.

**Core Principle**: Start simple. Use the decision framework to score task complexity (0-10) and match to the simplest component type that meets requirements.

## Complexity-Based Selection

| Score | Component Type | When to Use                                        |
| ----- | -------------- | -------------------------------------------------- |
| 1-3   | Simple Skill   | Single deterministic task, no branching logic      |
| 4-6   | Workflow Skill | Multi-step with some conditional logic             |
| 7-8   | Sub-Agent      | Model-driven decisions, flexible approach needed   |
| 9-10  | Agent Team     | Multiple specialized domains, complex coordination |

See `references/decision-framework.md` for detailed scoring guide.

## Comparison

| Extension Type | Best For                           | Primary Artifacts                | Component Skill                      |
| -------------- | ---------------------------------- | -------------------------------- | ------------------------------------ |
| Hooks          | Event-driven automation/guardrails | `hooks/hooks.json`, hook scripts | `../implement-hooks/SKILL.md`        |
| Agent Skills   | Reusable task playbooks            | `skills/<name>/SKILL.md`         | `../implement-agent-skills/SKILL.md` |
| Sub-Agents     | Specialized delegated roles        | `agents/*.md`                    | `../implement-sub-agents/SKILL.md`   |
| Agent Teams    | Coordinated multi-agent execution  | team config + coordination docs  | `../implement-agent-teams/SKILL.md`  |
| Plugins        | Packaging/distribution + wiring    | `.claude-plugin/plugin.json`     | `../implement-plugin/SKILL.md`       |

## Workflow

1. **Assess complexity**: Score task complexity using decision framework (0-10)
2. **Start simple**: Choose simplest component type that meets requirements
3. **Validate choice**: Ask "Can this be done more simply?"
4. **Identify constraints**: Determine specific requirements and boundaries
5. **Plan evaluations**: Define 20-50 test cases for validation
6. **Route implementation**: Hand off to appropriate component skill
7. **Apply lifecycle checks**: Follow design → implement → evaluate → verify

## Progressive Disclosure

### Best Practices (Anthropic Guidelines)

- **START HERE - Complexity scoring & decision framework**: `references/decision-framework.md`
- **Context management patterns**: `references/context-management.md`
- **Evaluation strategy**: `references/evaluation-strategy.md`

### Component Selection

- Extension comparison details: `references/extension-types.md`
- Decision guide: `references/when-to-use.md`
- Cross-component patterns: `references/cross-component-patterns.md`
- Lifecycle from design to verification: `references/extension-lifecycle.md`

## Component Skills

- `../implement-hooks/SKILL.md`
- `../implement-agent-skills/SKILL.md`
- `../implement-sub-agents/SKILL.md`
- `../implement-agent-teams/SKILL.md`
- `../implement-plugin/SKILL.md`

## Sources

- https://code.claude.com/docs/en/plugins
- https://code.claude.com/docs/en/skills
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/agent-teams
- https://code.claude.com/docs/en/hooks-guide
