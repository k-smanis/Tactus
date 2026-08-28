---
name: architect-initiative
description: Define the tasks needed to achieve an initiative within the active phase.
---

# Architect Initiative

Develop the execution plan for one existing initiative through a collaborative discussion before recording tasks.

## Establish the Initiative

Read the project overview and relevant architecture and standards. Query the progress database for the active phase, its ordered initiatives, existing tasks, task files, and related events.

Normally select the first pending initiative in the active phase. If there is no active phase, more than one phase is active, another initiative is already active, or the state is ambiguous, discuss the conflict with the user instead of changing statuses automatically.

## Discuss

Discuss the selected initiative until its intended outcome, scope, exclusions, completion criteria, implementation approach, dependencies, anticipated issues, and relevant files are understood.

Develop an ordered set of actionable tasks that collectively achieve the initiative. Tasks should be independently verifiable, small enough to execute coherently, and explicit about relevant repository files without embedding file contents in the progress database.

Do not expand the initiative beyond the outcome approved during phase architecture. If new information changes the phase plan materially, stop and return to `/architect-phase`.

## Confirm Readiness

Before writing progress records, present the initiative plan and ask the user for explicit approval. Include the intended outcome, boundaries, approach, risks, dependencies, completion criteria, ordered tasks, and relevant-file associations.

If anything remains unclear or the user does not approve the plan, continue the discussion instead of writing progress records.

## Crystallize

Only after approval:

1. Mark the selected initiative `active`.
2. Create its approved tasks in `Tactus/Project/Progress/Progress.sqlite` with `pending` status and initiative-relative ordering.
3. Associate each task with its relevant repository-relative files and reasons.
4. Preserve existing progress and history. Update existing task definitions only when the user approved those changes; prefer status changes over deletion.
5. Record an initiative event summarizing activation and the approved task plan.

Do not activate a task merely by planning it. Return control to the user when crystallization is complete.
