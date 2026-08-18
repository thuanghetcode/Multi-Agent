# Workflow

## Roles

- **GPT via Continue**: director; discussion, planning, review.
- **Claude Code**: executor; implementation, tests, debugging, verification.
- **Human**: approval and risk gate.

## States

```text
DRAFT
  -> NEEDS_INPUT
  -> READY_FOR_PLAN
  -> PLAN_PENDING_APPROVAL
  -> APPROVED_FOR_IMPLEMENTATION
  -> IMPLEMENTING
  -> READY_FOR_REVIEW
  -> APPROVED
```

Correction path:

```text
READY_FOR_REVIEW
  -> CHANGES_REQUIRED
  -> FIXING
  -> READY_FOR_FINAL_REVIEW
  -> APPROVED | BLOCKED
```

## First project request: automatic bootstrap

After cloning the template, open Continue in Agent mode and invoke `/bootstrap-project` with your product idea. GPT will:

1. Read the root instructions, project manifests, and shallow repository structure.
2. Ask only questions that can change behavior, architecture, security, data, API contracts, or scope.
3. Determine stack, architecture, and verified project commands. Missing commands become `Not configured`.
4. Update `AGENTS.md` and, only when needed, `CLAUDE.md`.
5. Choose the next task ID and create the four task artifacts.
6. Complete the initial brief and bounded plan.
7. Leave `Approval: PENDING` and stop.

During bootstrap GPT may write only `AGENTS.md`, `CLAUDE.md`, and `tasks/active/**`. It must not create the application, edit product source/tests, add dependencies, touch lockfiles, read secrets, or alter deployment configuration.

Example first request:

```text
/bootstrap-project

Tôi muốn xây dựng một ứng dụng quản lý công việc cá nhân có đăng nhập,
deadline và giao diện web responsive. Hãy hỏi tôi những quyết định quan trọng,
sau đó bootstrap repository và tạo plan đầu tiên. Không triển khai source code.
```

## Normal run

1. Create a task:
   `pwsh -NoProfile -File scripts/new-task.ps1 TASK-001 short-task-name`
2. GPT uses Continue Chat to clarify the request.
3. GPT uses Plan mode to inspect only relevant context.
4. GPT uses Agent mode briefly to write `brief.md` and `plan.md`.
5. Human reviews `plan.md` and changes `Approval: PENDING` to `Approval: APPROVED`.
6. Claude Code uses Plan/Manual mode to inspect, then implements only `Allowed Paths`.
7. Claude runs the exact validation commands and writes `result.md`.
8. GPT reviews `brief.md`, `plan.md`, `result.md`, and scoped Git diff.
9. GPT writes `review.md` with exactly one verdict: `APPROVED`, `CHANGES_REQUIRED`, or `BLOCKED`.
10. For `CHANGES_REQUIRED`, Claude fixes only listed finding IDs once, then re-verifies.

## Context and cost discipline

- Do not transfer full conversations.
- Use task artifacts and scoped Git diffs.
- Search before opening files.
- Load context manifest files first.
- Keep logs outside artifacts when large; record command and exit code.
- Start a fresh session for unrelated tasks.
- Do not use subagents or agent teams in the default profile.

## Stop conditions

Set `BLOCKED` when:

- requirements remain behaviorally ambiguous;
- required validation is unavailable or unspecified;
- Claude lacks plan approval;
- an agent needs forbidden paths;
- scope expands without approval;
- the same validation failure persists after two reasoned attempts;
- a review finding persists after one correction cycle;
- evidence does not support the claimed result.

## Risk escalation

Require extra human review for authentication, authorization, secrets, payments, migrations, public APIs, dependency changes, infrastructure, and deployment.
