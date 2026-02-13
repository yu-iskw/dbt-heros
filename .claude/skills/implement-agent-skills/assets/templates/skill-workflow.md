# [Skill Name] (Workflow - Complexity: 4-6)

[One-sentence description of the multi-step workflow]

## Purpose

[2-3 sentences explaining the workflow and why multiple steps are needed]

## When to Use

- ✅ Multiple sequential steps required
- ✅ Some conditional logic based on intermediate results
- ✅ Predictable workflow structure
- ✅ Progress tracking needed

## Workflow Steps

### Phase 1: [Phase Name]

1. [Step 1.1] - [Expected outcome]
2. [Step 1.2] - [Expected outcome]

### Phase 2: [Phase Name]

1. [Step 2.1] - [Expected outcome]
2. [Step 2.2] - [Expected outcome]

**Decision Point:** If [condition], proceed to Phase 3A, else Phase 3B

### Phase 3A: [Conditional Path A]

1. [Step 3A.1]

### Phase 3B: [Conditional Path B]

1. [Step 3B.1]

## Inputs

- **[Required Input 1]:** [Description]
- **[Required Input 2]:** [Description]
- **[Optional Input]:** [Description and default behavior]

## Context Requirements

- Access to: [Files, APIs, tools needed]
- Permissions: [Required permissions]

## Output

[Describe final deliverable and any intermediate artifacts]

## Progress Tracking

The skill uses task lists to track progress:

- [ ] Phase 1 complete
- [ ] Phase 2 complete
- [ ] Phase 3 complete
- [ ] Final validation complete

## Example Invocation

```text
User: [Complex request requiring workflow]
Agent: [Creates task list]
Agent: [Executes Phase 1]
Agent: [Updates task list]
Agent: [Makes decision based on Phase 1 results]
Agent: [Executes appropriate Phase 2/3]
Agent: [Reports completion with summary]
```

## Success Criteria

- [ ] All workflow phases completed
- [ ] Decision points handled correctly
- [ ] Output meets quality standards
- [ ] Progress tracked throughout

## Error Handling

**Phase failure:** Resume from last successful checkpoint
**Invalid input:** Validate before starting workflow
**Timeout:** Implement reasonable timeouts per phase

## Rollback Strategy

If error occurs in Phase N:

1. Document error state
2. Roll back changes from Phase N
3. Report failure with context
4. Suggest corrective action

## Cost Profile

- **Latency:** Medium (30 seconds - 5 minutes)
- **Token usage:** Medium (2000-8000 tokens)
- **Reliability:** High (> 90% success rate)
- **Consistency:** High (deterministic workflow)

## Progressive Disclosure

- Quick start guide: `references/[skill-name]-quickstart.md`
- Detailed workflow: `references/[skill-name]-workflow.md`
- Error recovery: `references/[skill-name]-errors.md`

---

_This is a Level 2 Workflow Skill with predictable multi-step execution._
