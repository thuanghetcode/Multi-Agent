---
name: bootstrap-project
description: Turn an initial project idea into repository instructions and the first pending task plan.
---

This is the one-time project bootstrap. Canonical shared policy and workflow are in `AGENTS.md` and `docs/WORKFLOW.md`.

Read `AGENTS.md`, `CLAUDE.md`, project manifests, and the shallow repository structure. Discuss the user's idea and ask only questions whose answers affect product behavior, architecture, security, data, API contracts, or scope.

When the idea is sufficiently clear, in Agent mode:

1. Determine the stack and architecture from the user's decisions and existing repository evidence.
2. Determine install, lint, typecheck, unit-test, and build commands. Use only commands verified from repository manifests; otherwise write `Not configured`.
3. Replace `TODO(project)` values in `AGENTS.md`. Update `CLAUDE.md` only if project-specific execution guidance is needed.
4. Choose the next available task ID and create `tasks/active/<task-id>/` with `brief.md`, `plan.md`, `result.md`, and `review.md` from the templates.
5. Complete `brief.md` and `plan.md`, including a bounded context manifest, Allowed Paths, Forbidden Paths, risks, rollback, and exact validation commands.
6. Set `Approval: PENDING` and stop for human approval.

During bootstrap you may write only `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**`. Never modify product source, tests, dependencies, lockfiles, secrets, `.env*`, `.git/**`, or deployment configuration. Never implement the application during bootstrap.
