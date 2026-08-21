# Implementation Plan

- Task ID: {{TASK_ID}}
- Status: PLAN_PENDING_APPROVAL
- Approval: PENDING

## Summary

TODO(summary)

## Context manifest

### Required

Loaded always; each entry needs a reason.

- `AGENTS.md`
  - Reason: TODO(reason)
- `CLAUDE.md`
  - Reason: TODO(reason)
- `tasks/active/{{TASK_ID}}/brief.md`
  - Reason: TODO(reason)

### On-demand

Loaded only when the trigger condition is met; each entry needs a reason and trigger.

- TODO(file)
  - Reason: TODO(reason)
  - Trigger: TODO(trigger)

### Excluded

- `node_modules/**`
- `dist/**`
- `build/**`
- `coverage/**`
- `.git/**`

## Allowed Paths

- `tasks/active/{{TASK_ID}}/**`
- TODO(project)

## Forbidden Paths

- `.env*`
- `.git/**`
- TODO(project)

## Existing changes to preserve

- None known.

## Steps

1. TODO(step)

## Validation commands

Commands run from repository root. For each, record the exact command, its exit code, and the evidence it produces in `result.md`.

1. TODO(command)
   - Exit code: 0

## Preflight and validation contract

Before editing, the executor verifies:

- Plan contains `Approval: APPROVED`.
- Required context files exist.
- Validation commands are present and runnable.
- Working tree is clean or changes are scoped to the task.
- Allowed Paths are understood and Forbidden Paths are respected.
- No unresolved behavioral questions remain (else `BLOCKED`).

The executor runs the exact commands above and records each command, exit code, and concise result in `result.md`, mapping evidence to acceptance criteria.

## Risks and mitigations

- TODO(risk)

## Rollback

Describe the rollback or recovery approach.

## Approval record

- Approved by: 
- Date: 
- Notes:
