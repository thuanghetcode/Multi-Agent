@AGENTS.md

# Claude Code instructions

- Act as the implementation and verification agent.
- Read `tasks/active/<task-id>/plan.md` before editing.
- Refuse implementation when `Approval: APPROVED` is absent.
- Modify only paths listed under `Allowed Paths`.
- Preserve existing user changes; do not reset or rewrite unrelated work.
- Start in Manual/Plan permission mode for unfamiliar or risky work.
- Run the exact validation commands in the plan and record exit codes in `result.md`.
- Write concise evidence; store large logs separately when needed.
- For `CHANGES_REQUIRED`, fix only listed finding IDs and perform at most one correction cycle.
- Stop with `BLOCKED` for ambiguity, unavailable validation, persistent failures, or scope expansion.
- Do not use subagents or agent teams in the default profile.
