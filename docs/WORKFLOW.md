# Workflow

## Roles

- **GPT via Continue**: director; discussion, planning, review.
- **Claude Code**: executor; implementation, tests, debugging, verification.
- **Human**: approval, risk gate, and final commit/integration.

This workflow is **human-orchestrated**: the human drives every phase transition by handoff prompt, approves the plan, and owns the final commit/integration. There is no automated orchestration runtime.

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

## Handoff rule

Every handoff is by **task ID and repository artifact path**. Never copy/paste a full plan or conversation when the receiving agent can read the repository files. Short file-reference prompts are enough.

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
2. Discuss with GPT:
   ```text
   Discuss tasks/active/TASK-001/brief.md
   ```
   GPT uses Continue Chat to clarify, then writes `brief.md`.
3. Plan:
   ```text
   Plan tasks/active/TASK-001/brief.md
   ```
   GPT uses Plan mode to inspect only relevant context, then writes `plan.md`.
4. Human reviews `plan.md` and changes `Approval: PENDING` to `Approval: APPROVED`.
5. Implement (Claude Code, Manual/Plan mode):
   ```text
   Implement approved task TASK-001. Read tasks/active/TASK-001/plan.md first.
   ```
   Claude runs preflight, implements only `Allowed Paths`, runs exact validation commands, and writes `result.md` with per-AC evidence mapping.
6. Review:
   ```text
   Review TASK-001. Read tasks/active/TASK-001/brief.md, plan.md, result.md and the scoped git diff.
   ```
   GPT writes `review.md` with exactly one verdict: `APPROVED`, `CHANGES_REQUIRED`, or `BLOCKED`.
7. Fix (if `CHANGES_REQUIRED`):
   ```text
   Fix only findings REV-xxx in tasks/active/TASK-001/review.md, then re-verify.
   ```
   Claude fixes only listed finding IDs once, then re-verifies.
8. Human commits and integrates the approved change. Agents never commit or push.

## Context and cost discipline

- Do not transfer full conversations; use task artifacts and scoped Git diffs.
- Load context progressively: start with the context manifest, add files on demand, never load the whole repository.
- The plan's Context manifest uses `Required` (read always), `On-demand` (read only when its trigger condition is met), and `Excluded` (never read).
- Record additional files loaded outside the manifest in `result.md`.
- Search before opening files.
- Keep logs outside artifacts when large; record command and exit code.

## Preflight (Claude Code)

Before editing, verify:

1. Plan contains `Approval: APPROVED`.
2. Required context files exist.
3. Validation commands are present and runnable.
4. Working tree is clean or changes are scoped to the task.
5. Allowed Paths are understood and Forbidden Paths are respected.
6. No unresolved behavioral questions remain (if so, mark `BLOCKED`).

## Evidence mapping

Each acceptance criterion in `result.md` maps to:

- changed files that satisfy it;
- the validation command and its exit code;
- concise evidence or a log reference.

Never claim success without executable evidence.

## Retry behavior

- Same validation failure: at most two **reasoned** attempts.
- A reasoned attempt states: the failure, the hypothesized cause, the change, and why it should resolve it.
- Repeating the identical failed action is not a reasoned attempt.
- If the second reasoned attempt fails, stop with `BLOCKED`.

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
