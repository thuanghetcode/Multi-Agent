# Agent Instructions

## Roles

- **GPT through Continue**: director — clarify requirements, plan, and review.
- **Claude Code**: executor — implement approved plans, test, debug, and verify.
- **Human**: approves plans, scope changes, risky commands, and final integration.

## Project configuration

- Stack: TODO(project)
- Architecture: TODO(project)
- Install: TODO(project)
- Lint: TODO(project)
- Typecheck: TODO(project)
- Unit tests: TODO(project)
- Build: TODO(project)

## Shared rules

- Work from the active task artifacts in `tasks/active/<task-id>/`.
- Do not pass full conversations between agents; use artifacts and scoped diffs.
- Search before opening files. Do not load the whole repository unnecessarily.
- Report commands actually run and their exit codes.
- Never claim success without executable evidence.
- Stop for ambiguity affecting behavior, architecture, security, data, APIs, or scope.
- Do not read or expose secrets. Never commit API keys.
- No deployment, publishing, push, destructive reset, or destructive clean without explicit human approval.

## Handoff protocol

- Handoffs are by **task ID and artifact path** only. The sender references `tasks/active/<task-id>/<artifact>.md`; the receiver reads it from the repository.
- Do not copy/paste full plans or conversations between agents.
- Each phase produces an artifact the next phase reads; no implicit context transfer.

## Context discipline

- Required context: listed in plan's Context manifest with explicit reason/trigger.
- On-demand context: loaded only when its trigger condition is met; document the trigger.
- Excluded context: never loaded.
- Additional files loaded outside the manifest must be recorded in `result.md`.

## Preflight (executor)

Before editing, the executor verifies:

1. Plan contains `Approval: APPROVED`.
2. Required context files exist.
3. Validation commands are present and runnable.
4. Working tree is clean or changes are scoped to the task.
5. Allowed Paths are understood and Forbidden Paths are respected.
6. No unresolved behavioral questions remain (if so, mark `BLOCKED`).

## Reasoned retry

- Same validation failure: at most two **reasoned** attempts.
- A reasoned attempt states: the failure, the hypothesized cause, the change, and why it should resolve it.
- Repeating the identical failed action is not a reasoned attempt.
- If the second reasoned attempt fails, stop with `BLOCKED`.

## Review and correction

- Review produces exactly one verdict: `APPROVED`, `CHANGES_REQUIRED`, or `BLOCKED`.
- For `CHANGES_REQUIRED`: executor fixes only the listed finding IDs, re-verifies, and stops at one correction cycle.
- Persistent or repeated findings after one cycle: `BLOCKED`.

## Workflow gate

- Executor may implement only when `plan.md` contains `Approval: APPROVED`.
- Director must not modify product source or tests. During one-time bootstrap, director may write only `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**`; after bootstrap, director may write task artifacts only.

## Loop limits

- Same validation failure: at most two reasoned attempts.
- Review correction: one cycle by default.
- Persistent or repeated findings: `BLOCKED`.
- Missing validation command or unapproved scope expansion: `BLOCKED`.

## Human-only integration

- Only the human commits, pushes, merges, or publishes.
- The human decides when a task is complete and approved for integration.
- Agents never run `git commit`, `git push`, or deployment commands.
