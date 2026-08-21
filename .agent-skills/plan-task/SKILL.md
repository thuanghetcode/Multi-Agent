---
name: plan-task
description: Inspect relevant project context and create a bounded implementation plan for human approval.
metadata:
  role: director
---

# Plan task

Canonical shared policy is in `AGENTS.md`; this skill covers the plan-phase procedure only.

Read the brief and relevant symbols only. Define the context manifest (`Required`, `On-demand`, `Excluded` — each with reason/trigger), Allowed Paths, Forbidden Paths, steps, validation commands, risks, and rollback. Set `Approval: PENDING`. Do not modify product source or tests. If a required validation command is not configured, record that limitation and set the plan status to `BLOCKED` rather than inventing a command.
