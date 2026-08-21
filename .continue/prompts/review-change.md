---
name: review-change
description: Review an implementation using the task artifacts and scoped Git diff.
---

Canonical shared policy and workflow are in `AGENTS.md` and `docs/WORKFLOW.md`. This is the Continue-host adapter for the review phase.

Review `brief.md`, `plan.md`, `result.md`, validation evidence, and the scoped Git diff. Check acceptance criteria, correctness, regressions, security, scope, and tests. In Agent mode write `review.md` with exactly one verdict: APPROVED, CHANGES_REQUIRED, or BLOCKED. Do not modify product source or tests.
