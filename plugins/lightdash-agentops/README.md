# Lightdash AgentOps Plugin

The `lightdash-agentops` plugin provides a comprehensive suite of tools for building, managing, and autonomously tuning Lightdash AI agents. It implements AgentOps and LLMOps best practices to ensure your AI agents are reliable, safe, and continuously improving.

## Features

- **Agent Management**: Full CRUD lifecycle for project agents.
- **Evaluation Pipelines**: Orchestrate evaluation runs to measure agent accuracy.
- **Thread Debugging**: Inspect conversation history and organization-wide AI activity.
- **Autonomous Tuning**: A specialized sub-agent that optimizes prompts based on evaluation data.
- **Safety First**: Deterministic hooks prevent unauthorized destructive operations.

## Components

### Skills

- `manage-lightdash-agents`: Lifecycle management for AI agents.
- `run-lightdash-evals`: Orchestration of evaluation runs and test cases.
- `debug-agent-threads`: Inspection of conversations and memory.

### Agents

- `agent-tuner`: Autonomous optimization loop for agent performance.

## Safety Modes

This plugin enforces safety modes via `LIGHTDASH_TOOLS_SAFETY_MODE`:

- `read-only`: Only inspection tools are available.
- `write`: Allows creating and updating agents/evaluations.
- `write-destructive`: Required for deleting agents or evaluations.

## Getting Started

1. Set your `LIGHTDASH_TOOLS_SAFETY_MODE` environment variable.
2. Use the `manage-lightdash-agents` skill to create your first agent persona.
3. Define evaluation test cases using `run-lightdash-evals`.
4. Run evaluations and use `agent-tuner` to autonomously improve your agent's prompts.
