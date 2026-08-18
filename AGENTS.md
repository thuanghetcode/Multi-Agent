# Agent Instructions

## Roles

- GPT through Continue is the director: clarify requirements, plan, and review.
- Claude Code is the executor: implement approved plans, test, debug, and verify.
- The human approves plans, scope changes, risky commands, and final integration.

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

## Workflow gate

Claude may implement only when `plan.md` contains `Approval: APPROVED`.
GPT must not modify product source or tests. During one-time project bootstrap, GPT may write only `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**`; after bootstrap it may write task artifacts only.

## Loop limits

- Same validation failure: at most two reasoned attempts.
- Review correction: one cycle by default.
- Persistent or repeated findings: `BLOCKED`.
- Missing validation command or unapproved scope expansion: `BLOCKED`.
