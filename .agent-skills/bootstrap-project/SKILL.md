---
name: bootstrap-project
description: Convert a new project idea into project instructions and a first implementation plan awaiting human approval.
metadata:
  role: director
---

# Bootstrap project

Use this skill once after cloning the template.

1. Read the root instructions, project manifests, and shallow repository structure.
2. Discuss the product idea and resolve ambiguity affecting behavior, architecture, security, data, APIs, or scope.
3. Infer only what repository evidence supports. Mark unavailable tooling as `Not configured`.
4. Configure project facts and verified commands in `AGENTS.md`; update `CLAUDE.md` only when project-specific executor guidance is necessary.
5. Create the first task directory and populate all four task artifacts from the templates.
6. Complete the brief and a bounded plan with exact validation commands.
7. Set `Approval: PENDING` and stop.

Allowed writes during bootstrap: `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**` only. Never change product source, tests, dependencies, lockfiles, secrets, `.env*`, `.git/**`, or deployment configuration.
