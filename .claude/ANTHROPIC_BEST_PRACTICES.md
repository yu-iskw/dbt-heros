# Anthropic Best Practices Integration

This document summarizes how Anthropic's "Building Effective Agents" best practices have been integrated into the Claude Code plugin template.

## Overview

We've implemented a **hybrid approach** combining:

1. Decision frameworks for complexity assessment
2. Tiered templates for different agent types
3. Embedded guidance in agent instructions
4. Evaluation strategy integration
5. Context management patterns

## Key Improvements

### 1. Decision Framework (`references/decision-framework.md`)

**Core Principle**: Start simple, only increase complexity when justified.

**Complexity Scoring System:**

- **Score 0-3**: Simple Skill (deterministic, single task)
- **Score 4-6**: Workflow Skill (multi-step, some branching)
- **Score 7-8**: Sub-Agent (autonomous, model-driven decisions)
- **Score 9-10**: Agent Team (multi-agent coordination)

**Key Features:**

- Objective complexity scoring rubric (0-10 scale)
- Trade-offs matrix (latency, cost, consistency, flexibility)
- Anti-patterns to avoid
- Validation questions before implementation

### 2. Context Management (`references/context-management.md`)

**Best Practices Implemented:**

- Progressive disclosure (role → task → details)
- Context layering strategies
- Four key patterns: RAG, Summarization, State Management, Hierarchical
- Anti-patterns to avoid (context dumping, starvation, staleness)
- Context sizing guidelines by component type
- Optimization checklist

### 3. Evaluation Strategy (`references/evaluation-strategy.md`)

**Eval-Driven Development:**

- Build evals BEFORE agents satisfy them
- Start with 20-50 real test cases
- Three evaluation levels: Unit, Integration, End-to-End
- Comprehensive workflow: Define → Create evals → Fail → Implement → Iterate
- Measurement metrics (quantitative and qualitative)
- CI/CD integration guidance

### 4. Tiered Templates

**Level 1 - Simple Skill** (`templates/skill-simple.md`)

- For straightforward, deterministic tasks
- Minimal decision-making
- < 30 second execution
- Low latency, low cost, high reliability

**Level 2 - Workflow Skill** (`templates/skill-workflow.md`)

- Multi-step sequential execution
- Conditional logic based on intermediate results
- Progress tracking with task lists
- Rollback strategies for error handling

**Level 3 - Autonomous Sub-Agent** (`templates/subagent-autonomous.md`)

- Model-driven decision-making
- Tool orchestration
- Adaptive problem-solving
- Clear delegation patterns
- Error handling and escalation

### 5. Enhanced Agent Instructions

**claude-plugin-manager.md updates:**

- Embedded "start simple" principle
- Complexity scoring before component selection
- Context management best practices
- Eval-driven recommendations

**All implementation skills updated:**

- Reference to decision framework
- Complexity validation steps
- Evaluation planning integration
- Context efficiency guidance

## Usage Guide

### For Simple Tasks (Score 1-3)

```markdown
1. Use decision framework to score: 1-3
2. Select simple skill template
3. Define single-purpose objective
4. Create 20-50 eval test cases
5. Implement using skill-simple.md template
```

**Example**: Code formatting, running linter, simple validation

### For Workflow Tasks (Score 4-6)

```markdown
1. Use decision framework to score: 4-6
2. Select workflow skill template
3. Define sequential phases
4. Add conditional decision points
5. Implement progress tracking
6. Create 20-50 eval scenarios
```

**Example**: Multi-step validation, build-test-deploy pipeline

### For Autonomous Tasks (Score 7-8)

```markdown
1. Verify sub-agent is needed (vs simpler approach)
2. Define clear role and boundaries
3. Set decision authority
4. Configure tool access (least privilege)
5. Plan context management strategy
6. Create 20-50 eval scenarios (including failures)
7. Implement using subagent-autonomous.md template
```

**Example**: Code refactoring, bug investigation, architecture design

### For Multi-Agent Coordination (Score 9-10)

```markdown
1. Confirm team is needed (vs independent sub-agents)
2. Define team objective
3. Identify specialized agent roles
4. Set clear handoff contracts
5. Plan coordination patterns
6. Create team-level evals
```

**Example**: Full-stack feature implementation, security audit

## Anti-Patterns to Avoid

❌ **Over-engineering**: Using sub-agent for simple tasks
❌ **Under-engineering**: Using simple skill for complex decisions
❌ **Premature optimization**: Building teams before validating single agent
❌ **Scope creep**: Expanding agent responsibilities beyond boundaries
❌ **Context dumping**: Providing all context upfront
❌ **No evaluation**: Implementing without test cases

## Migration Path for Existing Components

### Existing Skills

1. Read current skill definition
2. Score complexity using decision framework
3. If mismatch, consider refactoring to appropriate level
4. Add evaluation strategy
5. Optimize context management

### Existing Sub-Agents

1. Verify sub-agent is needed (score 7-8 or higher)
2. Add explicit decision boundaries
3. Document context management strategy
4. Create eval suite (20-50 scenarios)
5. Consider if simpler approach (skill) would suffice

## Validation Checklist

Before deploying new agents/skills:

- [ ] Complexity scored using decision framework
- [ ] Simplest approach validated ("Can this be simpler?")
- [ ] 20-50 eval test cases created
- [ ] Success criteria defined
- [ ] Context management strategy documented
- [ ] Progressive disclosure implemented
- [ ] Error handling patterns included
- [ ] Tool access follows least privilege

## Key Metrics

Track these metrics for continuous improvement:

- **Success Rate**: % of eval cases passed (target: >90%)
- **Task Completion**: % of tasks fully completed
- **Latency**: P50, P95, P99 response times
- **Cost**: Average tokens per task
- **Context Efficiency**: Tokens used vs task complexity

## References

### Primary Documents

- Decision Framework: `.claude/skills/implement-claude-extensions/references/decision-framework.md`
- Context Management: `.claude/skills/implement-claude-extensions/references/context-management.md`
- Evaluation Strategy: `.claude/skills/implement-claude-extensions/references/evaluation-strategy.md`

### Templates

- Simple Skill: `.claude/skills/implement-agent-skills/assets/templates/skill-simple.md`
- Workflow Skill: `.claude/skills/implement-agent-skills/assets/templates/skill-workflow.md`
- Autonomous Agent: `.claude/skills/implement-sub-agents/assets/templates/subagent-autonomous.md`

### Enhanced Skills

- implement-claude-extensions: `.claude/skills/implement-claude-extensions/SKILL.md`
- implement-agent-skills: `.claude/skills/implement-agent-skills/SKILL.md`
- implement-sub-agents: `.claude/skills/implement-sub-agents/SKILL.md`
- implement-agent-teams: `.claude/skills/implement-agent-teams/SKILL.md`

### Enhanced Agents

- claude-plugin-manager: `.claude/agents/claude-plugin-manager.md`

## External Resources

- [Anthropic: Building Effective Agents](https://www.anthropic.com/research/building-effective-agents)
- [Anthropic Cookbook: Agent Patterns](https://github.com/anthropics/anthropic-cookbook/tree/main/patterns/agents)
- [Anthropic: Demystifying Evals for AI Agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)
- [Anthropic: Effective Harnesses for Long-Running Agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents)

---

**Implementation Date**: 2026-02-12
**Anthropic Best Practices Version**: 2026 (Based on "Building Effective Agents" guide)
