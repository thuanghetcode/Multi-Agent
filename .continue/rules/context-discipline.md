# Context discipline

Canonical context rules are in `AGENTS.md` and `docs/WORKFLOW.md`. These are Continue-host-specific deltas.

- Load context progressively: `AGENTS.md` and the active task artifacts first, then on demand.
- Search before opening files.
- Prefer the context manifest (`Required` / `On-demand` / `Excluded`) and relevant symbols over whole directories.
- Do not pass full conversations between agents; use task artifacts and scoped diffs.
- Summarize large logs and keep full logs in task evidence files.
- Record additional files loaded when they were outside the plan.
