# Evaluation Strategy for Agents and Skills

Based on Anthropic's eval-driven development approach.

## Core Principle

Build evaluations BEFORE agents can fully satisfy them. Use evals to define capabilities, then iterate until agents perform well.

## Evaluation Levels

### Level 1: Unit Evals (Individual Skills/Agents)

**Purpose:** Verify single component behavior
**Scope:** 20-50 test cases per component
**Focus:** Core functionality, edge cases, error handling

### Level 2: Integration Evals (Multi-Component)

**Purpose:** Verify component interaction
**Scope:** 10-30 test cases covering workflows
**Focus:** Handoffs, state management, coordination

### Level 3: End-to-End Evals (Full Workflows)

**Purpose:** Verify user-facing scenarios
**Scope:** 5-15 realistic user tasks
**Focus:** Task completion, quality, user experience

## Eval-Driven Development Workflow

```markdown
1. Define capability (what should the agent do?)
2. Create eval cases (20-50 real scenarios)
3. Run evals (expect failures initially)
4. Implement/improve agent
5. Re-run evals
6. Iterate until success rate > 90%
7. Monitor production for new failure modes
8. Add failures to eval suite
```

## Building Effective Eval Suites

### Start with Real Failures

**Best source:** 20-50 simple tasks drawn from actual failures

**Example for code-review skill:**

```text
- Review PR with obvious security flaw → Should flag vulnerability
- Review PR with style issues only → Should suggest style fixes
- Review PR with breaking changes → Should identify breaking changes
- Review empty PR → Should handle gracefully
```

### Cover Critical Paths

**Identify must-work scenarios:**

- Happy path (most common use case)
- Error handling (invalid input, missing files)
- Edge cases (empty input, very large input)
- Boundary conditions (permission limits, timeout scenarios)

### Maintain Eval Quality

**Good eval characteristics:**

- **Specific:** Clear input and expected output
- **Realistic:** Based on actual usage
- **Reproducible:** Same input → same evaluation
- **Fast:** Can run full suite in < 5 minutes
- **Maintainable:** Easy to update as requirements evolve

## Eval Templates

### Skill Eval Template

```markdown
# Eval: [Skill Name]

## Test Case 1: [Scenario Name]

**Input:**

- User request: "[exact user message]"
- Context: [relevant files, state]

**Expected Behavior:**

- [ ] Completes without errors
- [ ] Produces [specific output]
- [ ] Takes action [specific action]

**Success Criteria:**
[Measurable outcome]

## Test Case 2: ...
```

### Sub-Agent Eval Template

```markdown
# Eval: [Sub-Agent Name]

## Scenario 1: [Task Type]

**Setup:**

- Repository state: [initial state]
- Available tools: [list]

**Task:**
"[User request]"

**Expected Outcome:**

- Decision made: [specific decision]
- Actions taken: [list of actions]
- Output quality: [quality criteria]

**Success Criteria:**

- [ ] Correct approach chosen
- [ ] All steps completed
- [ ] Output meets quality bar
```

## Measurement Metrics

### Quantitative Metrics

- **Success Rate:** % of evals passed
- **Task Completion:** % of tasks fully completed
- **Error Rate:** % of runs with errors
- **Latency:** P50, P95, P99 response times
- **Cost:** Total tokens used per task

### Qualitative Metrics

- **Output Quality:** Human judgment of result quality
- **Approach Appropriateness:** Did agent choose right strategy?
- **Robustness:** How well does it handle edge cases?
- **User Satisfaction:** Would user be happy with result?

## Evaluation Tools

### Option 1: Simple Script-Based Evals

```bash
# scripts/eval-skill.sh
#!/bin/bash
SKILL_NAME=$1
EVAL_DIR="evals/${SKILL_NAME}"

for eval_case in ${EVAL_DIR}/*.md; do
  echo "Running eval: $(basename $eval_case)"
  # Invoke skill with eval input
  # Compare output to expected
  # Report pass/fail
done
```

### Option 2: Structured Eval Framework

```json
{
  "eval_suite": "code-review-skill",
  "version": "1.0",
  "test_cases": [
    {
      "id": "security-flaw-detection",
      "input": {
        "pr_diff": "...",
        "context": "..."
      },
      "expected": {
        "detects_vulnerability": true,
        "severity": "high",
        "suggestions_count": ">= 1"
      }
    }
  ]
}
```

### Option 3: LLM-as-Judge

Use Claude to evaluate agent output quality:

```markdown
Evaluate this agent output:

Task: [original task]
Agent Output: [actual output]
Expected Criteria: [success criteria]

Does the output meet the criteria?
Provide: YES/NO + reasoning
```

## Eval Maintenance

### When to Update Evals

1. **New feature added** → Add evals for new capability
2. **Bug fixed** → Add regression test
3. **User reports issue** → Add eval for that scenario
4. **Requirements change** → Update affected evals

### Eval Hygiene

- Review eval suite monthly
- Remove obsolete test cases
- Update expected outputs when requirements evolve
- Keep eval count manageable (20-50 per component)

## Common Eval Pitfalls

❌ **Over-fitting to evals:** Agent passes evals but fails in production
**Solution:** Draw evals from real usage, add production failures to suite

❌ **Flaky evals:** Tests pass/fail inconsistently
**Solution:** Make evals deterministic, use exact string matching or semantic similarity thresholds

❌ **Too few evals:** Can't catch regressions
**Solution:** Maintain at least 20 test cases covering common scenarios

❌ **Too many evals:** Slow iteration cycles
**Solution:** Keep suite under 50 cases, use sampling for large suites

❌ **Outdated evals:** Tests no longer reflect requirements
**Solution:** Regular maintenance, version control for eval suites

## Integration with CI/CD

```yaml
# .github/workflows/eval-agents.yml
name: Agent Evaluations

on: [push, pull_request]

jobs:
  eval-skills:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run skill evals
        run: make eval-skills
      - name: Check success rate
        run: |
          SUCCESS_RATE=$(cat eval-results.json | jq '.success_rate')
          if (( $(echo "$SUCCESS_RATE < 0.90" | bc -l) )); then
            echo "Success rate ${SUCCESS_RATE} below 90% threshold"
            exit 1
          fi
```

## Evaluation Checklist

Before deploying agent/skill:

- [ ] Created 20-50 eval test cases
- [ ] Covered happy path, errors, edge cases
- [ ] Success rate > 90%
- [ ] Eval suite runs in < 5 minutes
- [ ] Integrated into CI/CD pipeline
- [ ] Documented how to add new test cases
- [ ] Set up monitoring for production failures

## References

- Anthropic: Building Effective Agents - Evaluation Section
- Anthropic: Demystifying Evals for AI Agents (https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)
- Eval examples: `assets/evals/`
