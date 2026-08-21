# Configuration

## Prerequisites

- VS Code 1.94+.
- Continue extension: `Continue.continue`.
- Claude Code extension: `anthropic.claude-code`.
- Git.
- PowerShell 7 (`pwsh`) for the task helper.

Optional:

- GitLens: `eamodio.gitlens`.
- EditorConfig: `EditorConfig.EditorConfig`.

## Continue / GPT

1. Install Continue.
2. Copy `.continue/config.example.yaml` into your Continue user configuration.
3. Replace the secret reference with the secret mechanism supported by your Continue version, or configure the key through the extension UI/environment.
4. Configure the OpenAI-compatible endpoint and verify tool calling.
5. Reload Continue configuration.
6. Confirm `Chat`, `Plan`, and `Agent` modes work. Agent mode requires `tool_use`; a custom endpoint may still reject tools even when declared.

Use:

- Chat: requirements discussion.
- Plan: read-only exploration and review.
- Agent: normally write task artifacts only; during one-time `/bootstrap-project`, it may also update `AGENTS.md` and `CLAUDE.md`.

Continue rules live in `.continue/rules/`; prompts live in `.continue/prompts/`.

## Claude Code

1. Install and sign in to Claude Code.
2. Open the repository as a trusted VS Code folder.
3. Configure **user-level** permissions for the operation categories you want Claude Code to deny or confirm globally (secrets, git push, destructive reset/clean, publish, deployment). These live in your user `settings.json`, not in the repository.
4. Use Manual/Plan mode initially.
5. Verify Claude refuses a plan whose approval is still `PENDING`.
6. Keep `.claude/settings.local.json` uncommitted if you create one.

Note: this template does **not** ship a committed project-level `.claude/settings.json`. Repository files such as `AGENTS.md` and `CLAUDE.md` are instructions, not enforcement. Actual permission enforcement — if any — comes from user-level Claude Code settings and from OS/CI controls such as branch protection and sandboxing. Guardrails are not a replacement for OS sandboxing, branch protection, or CI.

## Agent Skills

Canonical portable skills are under `.agent-skills/`. Host-specific adapters are under `.continue/` and `.claude/`. Skills use the open `SKILL.md` format. Keep frontmatter names lowercase, hyphenated, and equal to the directory name.

## Project bootstrap

You do not need to replace `TODO(project)` manually. For the first request, run `/bootstrap-project` in Continue Agent mode and describe the project idea. GPT asks material questions, inspects repository manifests, fills only verified project facts/commands, and creates the first pending plan.

If a command cannot be verified from an existing manifest or configuration, GPT writes `Not configured`; it must not install tooling or generate product source during bootstrap. Review the generated plan before changing its approval status.

## Project setup

After bootstrap, confirm that no `TODO(project)` remains in `AGENTS.md`. Task templates may retain task-specific placeholders that GPT replaces while planning. Do not put secrets in repository files.

## Validation checklist

```text
JSON files parse.
Continue config loads.
Continue Chat/Plan/Agent modes are available.
Claude loads AGENTS.md and CLAUDE.md.
Claude user-level permissions deny protected operations.
Task helper creates all four artifacts.
Pending plan blocks implementation.
Approved plan permits scoped implementation.
Review verdict controls the correction path.
```

## Official references

- Continue configuration: https://docs.continue.dev/reference
- Continue Agent mode: https://docs.continue.dev/ide-extensions/agent/quick-start
- Continue OpenAI-compatible providers: https://docs.continue.dev/customize/model-providers/top-level/openai
- Claude Code settings: https://code.claude.com/docs/en/settings
- Claude Code permissions: https://code.claude.com/docs/en/permissions
- Claude Code skills: https://code.claude.com/docs/en/skills
- Agent Skills specification: https://agentskills.io/specification
