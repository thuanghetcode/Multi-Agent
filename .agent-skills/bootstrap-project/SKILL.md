---
name: bootstrap-project
description: Convert a new project idea into project instructions and a first implementation plan awaiting human approval.
metadata:
  role: director
---

# Bootstrap project

Canonical shared policy and workflow rules are in `AGENTS.md` and `docs/WORKFLOW.md`. This skill is the one-time bootstrap procedure.

Use this skill once after cloning the template.

1. Read the root instructions, project manifests, and shallow repository structure.
2. Discuss the product idea and resolve ambiguity affecting behavior, architecture, security, data, API contracts, or scope.
3. Infer only what repository evidence supports. Mark unavailable tooling as `Not configured`.
4. Configure project facts and verified commands in `AGENTS.md`; update `CLAUDE.md` only when project-specific executor guidance is necessary.
5. Choose the next available task ID and create `tasks/active/<task-id>/` with `brief.md`, `plan.md`, `result.md`, and `review.md` from the templates.
6. Complete `brief.md` and `plan.md`, including a bounded context manifest, Allowed Paths, Forbidden Paths, risks, rollback, and exact validation commands.
7. Set `Approval: PENDING` and stop for human approval.

Allowed writes during bootstrap: `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**` only. Never change product source, tests, dependencies, lockfiles, secrets, `.env*`, `.git/**`, or deployment configuration. Never implement the application during bootstrap.
