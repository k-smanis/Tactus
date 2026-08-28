---
name: architect-phase
description: Define the initiatives needed to achieve a phase when that phase is about to begin.
---

# Architect Phase

Develop the plan for one phase through a collaborative discussion before recording any outcomes. Plan only the phase being undertaken; do not create initiatives for later phases.

## Establish the Phase

Read the project overview and query the progress database for the ordered phases, their statuses, and any existing initiatives, tasks, relevant files, and related events for the phase under consideration.

Identify the phase to undertake using the existing progress state. If no phase is active, normally propose the earliest pending phase whose predecessors are completed. If another phase is active, a predecessor is incomplete, or the state is ambiguous, discuss the conflict with the user instead of changing statuses automatically.

## Discuss

Discuss the selected phase until its intended outcome, scope, exclusions, completion criteria, dependencies, assumptions, risks, and relevant architectural constraints are understood.

Then develop an ordered set of outcome-oriented initiatives that collectively achieve the phase. Each initiative must:

- Produce a coherent, verifiable outcome.
- Be small enough to architect and execute separately.
- Have clear boundaries and dependencies.
- Avoid task-level implementation detail.
- Belong only to the selected phase.

Do not treat discovery as a form or present an exhaustive questionnaire. Discuss one coherent theme at a time, offer interpretations and tradeoffs, and periodically summarize the emerging phase plan for correction.

## Confirm Readiness

Before writing progress records, present the complete phase plan and ask the user for explicit approval. The review must include:

- The selected phase and its intended outcome.
- Scope, exclusions, and completion criteria.
- Relevant dependencies, constraints, assumptions, and risks.
- The ordered initiatives and the outcome of each.
- Why the initiatives collectively complete the phase.

If the phase remains unclear or the user does not approve the plan, continue the discussion instead of writing progress records.

## Crystallize

Only after approval:

1. Mark the selected phase `active`. Do not activate it while another phase remains active or while an earlier phase remains unresolved unless the user explicitly resolves that state first.
2. Create the approved initiatives in `Tactus/Project/Progress/Progress.sqlite` with `pending` status and phase-relative ordering.
3. Preserve existing progress and history. Update existing initiative definitions only when the user approved those changes; prefer status changes over deletion.
4. Record a phase event summarizing activation and the approved initiative plan.
5. Do not create tasks or task-file associations.

When complete, return control to the user and recommend `/architect-initiative` for the first pending initiative.
