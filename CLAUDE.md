@AGENTS.md

# Claude Code instructions

Canonical shared policy, roles, handoff, preflight, reasoned retry, and loop limits live in `AGENTS.md`. The items below are executor-specific deltas.

- Act as the implementation and verification agent.
- Read `tasks/active/<task-id>/plan.md` before editing and refuse when `Approval: APPROVED` is absent.
- Run **preflight** before editing (see `AGENTS.md`): approval, required files, validation commands, working tree, allowed paths, unresolved behavioral questions.
- Modify only paths listed under `Allowed Paths`; preserve existing user changes.
- Start in Manual/Plan permission mode for unfamiliar or risky work.
- Run the exact validation commands in the plan and record command, exit code, and concise result in `result.md`.
- Map each acceptance criterion to changed files and validation evidence in `result.md`.
- Write concise evidence; store large logs separately when needed.
- Retry a failed validation at most twice, each attempt reasoned (failure, cause, change, justification). Do not repeat the identical failed action. If the second reasoned attempt fails, stop with `BLOCKED`.
- For `CHANGES_REQUIRED`, fix only listed finding IDs and perform at most one correction cycle.
- Stop with `BLOCKED` for ambiguity, unavailable validation, persistent failures, or scope expansion.
- Do not use subagents or agent teams in the default profile.
- Leave all changes uncommitted for human review; never commit or push.
