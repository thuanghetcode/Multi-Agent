---
name: plan-task
description: Inspect relevant code and prepare an approved implementation plan.
---

Canonical shared policy and workflow are in `AGENTS.md` and `docs/WORKFLOW.md`. This is the Continue-host adapter for the plan phase.

Read the active brief and inspect only relevant repository files. Produce a concise plan with Context manifest (`Required`, `On-demand`, `Excluded` — each with reason/trigger), Allowed Paths, Forbidden Paths, steps, risks, rollback, and exact validation commands. In Agent mode write `plan.md` with `Approval: PENDING`. Never modify product source or tests. Stop if validation commands cannot be identified.
