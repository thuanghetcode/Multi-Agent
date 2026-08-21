---
name: verify-task
description: Run the planned validation commands and map executable evidence to acceptance criteria.
metadata:
  role: executor
---

# Verify task

Canonical shared policy is in `AGENTS.md`; this skill covers the verify-phase procedure only.

Run the exact planned checks in a focused-to-broad order. Record command, exit code, and concise result. Store large logs separately. Do not claim success without evidence. Map each acceptance criterion to changed files and validation evidence in `result.md`. Mark `BLOCKED` when required verification is unavailable.
