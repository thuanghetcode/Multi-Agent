# Multi-Agent Vibe Coding Template

A small, reusable **human-orchestrated, artifact-based** workflow for VS Code projects. Two AI agents cooperate through repository artifacts; the human approves plans, scope changes, risky actions, and does the final commit/integration. There is **no autonomous orchestration runtime**.

## Default roles

- **GPT via Continue**: director — discuss requirements, plan, review.
- **Claude Code**: executor — implement, test, debug, verify.
- **Human**: approve plans, scope changes, risky commands, and final integration.

The workflow is provider-agnostic at the artifact level and can be adapted later.

## How handoffs work

Handoffs always use a **task ID and repository artifacts** — never a copy/pasted plan or a full conversation. Each task lives in `tasks/active/<task-id>/` with `brief.md -> plan.md -> result.md -> review.md`. The receiver reads the artifacts from the repository; the sender references them by path.

## Quick start

1. Clone this template for a new project and open the folder in VS Code.
2. Install Continue and Claude Code.
3. Configure Continue using `.continue/config.example.yaml`; keep API keys in environment variables.
4. In Continue, run `/bootstrap-project` in Agent mode and describe your project idea.
5. GPT will ask important questions, inspect the repository, fill verified project commands in `AGENTS.md`, and create the first task plan.
6. Review `tasks/active/<task-id>/plan.md`. Change `Approval: PENDING` to `Approval: APPROVED` only when you accept the plan.
7. Hand off to Claude Code by asking it to implement the approved plan — reference the task ID or plan path; do not paste the plan.
8. Let GPT review `result.md` and the scoped diff.

For later tasks, use `pwsh -NoProfile -File scripts/new-task.ps1 TASK-001 short-slug` and follow `docs/WORKFLOW.md`.

The bootstrap phase may write only `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**`. It never implements product code.

## Artifacts

`brief.md` -> `plan.md` -> human approval -> `result.md` + diff -> `review.md`.

This template is a human-operated lifecycle. It does not add an autonomous agent runtime, state database, or automatic model routing; the human drives every phase transition.

See `docs/CONFIGURATION.md` for setup and `docs/WORKFLOW.md` for operation.
