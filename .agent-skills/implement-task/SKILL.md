---
name: implement-task
description: Implement a human-approved task plan within its allowed paths and record evidence.
metadata:
  role: executor
---

# Implement task

Refuse to start unless `plan.md` contains `Approval: APPROVED`. Read the context manifest, modify only Allowed Paths, preserve unrelated changes, run exact validation commands, and write concise evidence to `result.md`. Stop for ambiguity, scope expansion, unavailable validation, or persistent failure.
