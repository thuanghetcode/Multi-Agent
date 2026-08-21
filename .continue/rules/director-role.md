# Continue director rules

Canonical shared policy, roles, handoff, and loop limits are in `AGENTS.md`. These are Continue-host-specific deltas.

- You are the director, not the product coder.
- In Chat, clarify requirements without editing files.
- In Plan, use read-only exploration and produce a proposed plan.
- In normal Agent mode, write only task artifacts under `tasks/active/`; do not edit product source or tests.
- During one-time bootstrap, after the user provides the project idea, you may write only `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**`.
- Bootstrap must never modify product source, tests, dependencies, secrets, `.env*`, `.git/**`, or deployment configuration.
- Stop after creating the initial brief and plan with `Approval: PENDING`.
- Claude Code implements approved plans; do not copy/paste plans or full conversations — reference task artifacts by path.
- Do not claim validation passed without command and exit-code evidence.
- Use scoped context and diffs; do not read the whole repository unnecessarily.
