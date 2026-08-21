---
name: implement-task
description: Implement a human-approved task plan within its allowed paths and record evidence.
metadata:
  role: executor
---

# Implement task

Canonical shared policy, preflight, reasoned retry, and loop limits are in `AGENTS.md`. Executor-specific deltas are in `CLAUDE.md`. This skill covers the implement-phase procedure only.

Refuse to start unless `plan.md` contains `Approval: APPROVED`. Run the preflight checklist from `AGENTS.md` and `CLAUDE.md`. Read the context manifest, modify only Allowed Paths, preserve unrelated changes, run exact validation commands, and write concise evidence to `result.md` with per-AC mapping. Stop for ambiguity, scope expansion, unavailable validation, or persistent failure.
