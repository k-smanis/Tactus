# System Overview

Tactus has three parts:

1. **Project**: Durable project knowledge, retrieved selectively.
2. **Skills**: Reusable procedures that retrieve, use, and update project knowledge and state.
3. **Progress Tracking**: Structured state describing intended work, current work, and important historical facts.

## Structure

`Tactus/` separates the reusable Tactus system from project-specific knowledge and progress.

```text
Tactus/
|-- System/
|   |-- SystemOverview.md
|   |-- Bootstrap.md
|   |-- Skills/
|   `-- Templates/
|       |-- Project/
|       `-- ProgressSchema.sql
`-- Project/
    |-- ProjectOverview.md
    |-- Architecture/
    |-- Standards/
    `-- Progress/
        `-- Progress.sqlite
```

### `System/`

Contains the reusable Tactus system. Changes made here can be contributed to the system repository.

#### `Bootstrap.md`

This is the agent's entry point. It initializes any missing local project files and progress database, loads the required context, and then asks any necessary clarifying questions or asks the user how to proceed.

#### `SystemOverview.md`

Describes Tactus, its available skills, and its progress model.

#### `Skills/`

Contains the authoritative definitions of the reusable skills described below.

#### `Templates/`

Contains the reusable files used to initialize a project's structure and progress database.

### `Project/`

Contains project-specific knowledge, standards, and progress state. It is not tracked by the Tactus repository.

- `ProjectOverview.md` contains the project's intent, high-level architecture, and pre-design considerations.
- `Architecture/` contains detailed architectural knowledge organized by descriptive filenames.
- `Standards/` contains project-specific rules grouped by domain.
- `Progress/Progress.sqlite` stores structured project progress.

## Skills

Skills define reusable procedures; project files and progress tracking hold project knowledge and work state. Skills may read or update `Tactus/Project/`, but must not embed project-specific knowledge themselves.

| Skill                   | Use                                                                          |
| ----------------------- | ---------------------------------------------------------------------------- |
| `/bootstrap`            | Establish the minimum context needed to enter the project.                   |
| `/architect-project`    | Define project intent, architecture, considerations, and development phases. |
| `/architect-phase`      | Define the initiatives needed to achieve the phase being undertaken.         |
| `/architect-initiative` | Define the tasks needed to achieve an initiative in the active phase.        |
| `/review`               | Evaluate work against relevant intent, architecture, and standards.          |
| `/log`                  | Record an important event or discovery.                                      |
| `/recover`              | Diagnose a degraded session and recommend how to recover it.                 |
| `/help`                 | Explain how to use Tactus and its skills.                                    |
| `/improve`              | Improve and publish the reusable Tactus system.                              |

## Progress Tracking

`Project/Progress/Progress.sqlite` stores project progress; `System/Templates/ProgressSchema.sql` defines its structure.

### Phase-Driven Development

Development is organized into an ordered sequence of phases defined before project development begins.
When a phase is about to begin, its initiatives are defined. When an initiative is about to begin, its tasks are defined. Initiatives and tasks should not be created prematurely for future phases.
Phases have initiatives, initiatives have tasks, and so every task ultimately is tied to a phase.

The architecture workflow mirrors this hierarchy:

1. `/architect-project` defines the project and its phases.
2. `/architect-phase` defines the initiatives for the phase being undertaken.
3. `/architect-initiative` defines the tasks for the initiative being undertaken.

### Event-Driven Development

Important changes in project knowledge or work state are recorded as events when they occur. Events form an append-only history of decisions, discoveries, incidents, changes, and completions, optionally tied to a phase, initiative, or task; routine activity is not logged.

### Data Model

Progress is stored in five tables:

- `phases`: High-level development scaffolds defined at project start.
- `initiatives`: Bodies of work belonging to a phase.
- `tasks`: Actionable units created when their phase is undertaken. Every task belongs to an initiative.
- `task_files`: Repository-relative paths relevant to a task, with an optional explanation. File contents remain in the repository.
- `events`: Append-only historical facts, optionally associated with one phase, initiative, or task.

Phases, initiatives, and tasks use the statuses `pending`, `active`, `blocked`, `completed`, and `cancelled`. Prefer status changes over deleting planned work or historical events.
