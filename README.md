# Multi-Agent Vibe Coding Template

A small, reusable two-agent workflow for VS Code projects.

## Default roles

- **GPT via Continue**: discuss requirements, plan, and review.
- **Claude Code**: implement, test, debug, and verify.
- **Human**: approve plans, scope changes, and risky actions.

The workflow is provider-agnostic at the artifact level and can be adapted later.

## Quick start

1. Clone this template for a new project and open the folder in VS Code.
2. Install Continue and Claude Code.
3. Configure Continue using `.continue/config.example.yaml`; keep API keys in environment variables.
4. In Continue, run `/bootstrap-project` in Agent mode and describe your project idea.
5. GPT will ask important questions, inspect the repository, fill verified project commands in `AGENTS.md`, and create the first task plan.
6. Review `tasks/active/<task-id>/plan.md`. Change `Approval: PENDING` to `Approval: APPROVED` only when you accept the plan.
7. Start Claude Code in Manual mode and ask it to implement the approved plan.
8. Let GPT review the result and scoped diff.

For later tasks, use `pwsh -NoProfile -File scripts/new-task.ps1 TASK-001 short-slug` and follow `docs/WORKFLOW.md`.

The bootstrap phase may write only `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**`. It never implements product code.

## Artifacts

`brief.md` -> `plan.md` -> human approval -> `result.md` + diff -> `review.md`.

See `docs/CONFIGURATION.md` for setup and `docs/WORKFLOW.md` for operation.
