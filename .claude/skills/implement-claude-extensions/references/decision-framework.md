# Agent Complexity Decision Framework

Based on Anthropic's "Building Effective Agents" best practices.

## Core Principle: Start Simple

Find the simplest solution possible. Only increase complexity when needed. Agentic systems trade latency and cost for better task performance.

## Decision Tree

### 1. Can the task be completed with a single prompt?

- **YES** → Use a simple skill with clear instructions
- **NO** → Continue to step 2

### 2. Is the workflow well-defined and predictable?

- **YES** → Use a **workflow-based skill** (sequential steps, deterministic)
- **NO** → Continue to step 3

### 3. Does it require model-driven decision-making?

- **YES** → Use a **sub-agent** (flexible, adaptive)
- **NO** → Reconsider if you need agent architecture

### 4. Does it require multiple specialized agents?

- **YES** → Consider **agent teams** (parallel/sequential coordination)
- **NO** → Use single sub-agent

## Complexity Levels

### Level 1: Simple Skill (Complexity Score: 1-3)

**When to use:**

- Single, well-defined task
- No branching logic needed
- Predictable inputs/outputs
- Execution time < 30 seconds

**Example:** Format code, run linter, simple validation

**Template:** `assets/templates/skill-simple.md`

### Level 2: Workflow Skill (Complexity Score: 4-6)

**When to use:**

- Multiple sequential steps
- Some conditional logic
- Predictable workflow structure
- Needs progress tracking

**Example:** Multi-step validation, build-test-deploy pipeline

**Template:** `assets/templates/skill-workflow.md`

### Level 3: Sub-Agent (Complexity Score: 7-8)

**When to use:**

- Model-driven decisions required
- Flexible approach needed
- Complex problem-solving
- Needs tool orchestration

**Example:** Code refactoring, bug investigation, architecture design

**Template:** `assets/templates/subagent-autonomous.md`

### Level 4: Agent Team (Complexity Score: 9-10)

**When to use:**

- Multiple specialized domains
- Parallel execution beneficial
- Complex coordination needed
- Large-scale operations

**Example:** Full-stack feature implementation, security audit

**Template:** `assets/templates/team-coordinator.md`

## Complexity Scoring Guide

Score each factor 0-2, sum to get total (0-10):

1. **Decision Points:** 0=none, 1=few (<5), 2=many (≥5)
2. **Tool Diversity:** 0=single tool, 1=few tools, 2=many tools
3. **Context Requirements:** 0=minimal, 1=moderate, 2=extensive
4. **Execution Time:** 0=<30s, 1=30s-5min, 2=>5min
5. **Error Handling Complexity:** 0=simple, 1=moderate, 2=complex

**Total 0-3:** Use simple skill
**Total 4-6:** Use workflow skill
**Total 7-8:** Use sub-agent
**Total 9-10:** Consider agent team

## Trade-offs Matrix

| Approach     | Latency    | Cost       | Consistency | Flexibility    | Complexity |
| ------------ | ---------- | ---------- | ----------- | -------------- | ---------- |
| Simple Skill | ⚡ Low     | 💰 Low     | ⭐⭐⭐ High | ⚙️ Low         | 🎯 Low     |
| Workflow     | ⚡ Medium  | 💰 Medium  | ⭐⭐ Medium | ⚙️⚙️ Medium    | 🎯 Medium  |
| Sub-Agent    | ⚡ High    | 💰 High    | ⭐ Variable | ⚙️⚙️⚙️ High    | 🎯 High    |
| Agent Team   | ⚡ Highest | 💰 Highest | ⭐ Variable | ⚙️⚙️⚙️ Highest | 🎯 Highest |

## Anti-Patterns

❌ **Over-engineering:** Using sub-agent for simple, deterministic tasks
❌ **Under-engineering:** Using simple skill for complex decision-making
❌ **Premature optimization:** Building team before validating single-agent approach
❌ **Scope creep:** Expanding agent responsibilities beyond clear boundaries

## Validation Questions

Before implementing, ask:

1. Have I tried the simplest approach first?
2. Can I achieve this with fewer components?
3. What specific benefit does added complexity provide?
4. How will I test and validate this approach?
5. What failure modes exist at this complexity level?

## References

- Anthropic: Building Effective Agents (https://www.anthropic.com/research/building-effective-agents)
- Agent Architecture Patterns Cookbook (https://github.com/anthropics/anthropic-cookbook/tree/main/patterns/agents)
