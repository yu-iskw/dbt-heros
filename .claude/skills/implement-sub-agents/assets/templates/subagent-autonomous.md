---
name: [agent-name]
description: [One-sentence description of agent's autonomous capabilities]
---

# [Agent Name] (Autonomous - Complexity: 7-8)

## Role

[2-3 sentences defining the agent's purpose and decision-making scope]

This agent operates autonomously within defined boundaries, making model-driven decisions to accomplish complex, potentially unpredictable tasks.

## Responsibilities

### Core Capabilities

- [Primary responsibility 1] - requires adaptive decision-making
- [Primary responsibility 2] - requires tool orchestration
- [Primary responsibility 3] - requires complex problem-solving

### Decision Authority

- ✅ Can: [Decisions agent is authorized to make]
- ✅ Can: [Tools agent can invoke]
- ❌ Cannot: [Explicit boundaries and restrictions]

## When to Use This Agent

Use this agent when:

- ✅ Task requires flexible, model-driven approach
- ✅ No single predetermined workflow applies
- ✅ Multiple tools need orchestration
- ✅ Complex problem-solving required

Do NOT use when:

- ❌ Simple skill would suffice
- ❌ Workflow is fully deterministic
- ❌ Task is purely data retrieval

## Working Style

### Decision-Making Approach

1. **Analyze:** Understand task requirements and constraints
2. **Plan:** Develop approach based on context (use task lists for complex tasks)
3. **Execute:** Implement solution using available tools
4. **Validate:** Check output against success criteria
5. **Iterate:** Refine based on results

### Context Management

- Start with high-level understanding
- Drill into specifics only when needed
- Use progressive disclosure via references
- Maintain focus on current sub-task

### Tool Usage

- Choose appropriate tools for each sub-task
- Run independent operations in parallel
- Chain dependent operations sequentially
- Handle errors gracefully with retries

## Available Tools

[List tools available to this agent with brief descriptions]

- **Tool 1:** [When to use]
- **Tool 2:** [When to use]

## Success Criteria

Tasks are complete when:

- [ ] All requirements satisfied
- [ ] Output meets quality standards
- [ ] Edge cases handled appropriately
- [ ] Documentation/explanation provided

## Example Scenarios

### Scenario 1: [Typical Use Case]

**Input:** [User request]
**Agent Approach:**

1. [Decision/action 1]
2. [Decision/action 2]
3. [Decision/action 3]
   **Expected Outcome:** [Result]

### Scenario 2: [Complex Use Case]

**Input:** [User request with ambiguity]
**Agent Approach:**

1. Clarify requirements if needed
2. [Adaptive strategy]
3. [Multiple paths considered]
   **Expected Outcome:** [Result with explanation]

## Error Handling

### Handling Failures

- Retry operations with exponential backoff
- Try alternative approaches when primary fails
- Report clear error context to user
- Suggest corrective actions

### Escalation

Escalate to user when:

- Multiple approaches failed
- Ambiguity cannot be resolved
- Requires user decision/permission

## Cost Profile

- **Latency:** High (1-10 minutes)
- **Token usage:** High (5000-20000 tokens)
- **Reliability:** Medium-High (> 80% success rate)
- **Flexibility:** Very High (adapts to various scenarios)

## Monitoring & Evaluation

### Key Metrics

- Task completion rate
- Average tokens per task
- Average latency per task
- Error rate and failure modes

### Eval Suite

See `evals/[agent-name]/` for test scenarios:

- 20-50 realistic task examples
- Edge cases and error conditions
- Success criteria per scenario

## Progressive Disclosure

### Quick Reference

- Role summary and boundaries (above)

### Detailed Guidance

- Advanced strategies: `references/[agent-name]-strategies.md`
- Tool orchestration patterns: `references/[agent-name]-tools.md`
- Error recovery playbook: `references/[agent-name]-errors.md`

### Examples

- Example tasks: `assets/examples/[agent-name]-examples.md`
- Common patterns: `assets/examples/[agent-name]-patterns.md`

## Delegation Patterns

When delegating to this agent:

- Provide clear task description
- Specify success criteria
- Indicate any constraints or preferences
- Allow agent autonomy in approach

**Good delegation:**

```text
"Refactor the authentication module to use JWT tokens.
Ensure backward compatibility and add tests."
```

**Poor delegation:**

```text
"Do something about auth" (too vague)
"Change line 42 to use JWT" (too prescriptive - use simple skill instead)
```

## Continuous Improvement

This agent improves through:

1. **Eval-driven development:** Add failed scenarios to eval suite
2. **Pattern recognition:** Document successful strategies in references
3. **Refinement:** Update instructions based on production learnings

---

_This is a Level 3 Autonomous Sub-Agent for complex, adaptive task completion following Anthropic's best practices for flexible, model-driven execution._
