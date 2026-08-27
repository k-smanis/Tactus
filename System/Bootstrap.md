# Bootstrap

Follow these directions exactly:

## Initialize Project

1. Ensure `Agent/Project/` exists.
2. Copy every missing file and directory from `Agent/System/Templates/Project/` into `Agent/Project/`. Never overwrite an existing project file.
3. Ensure `Agent/Project/Progress/` exists.
4. If `Agent/Project/Progress/Progress.sqlite` does not exist, create it by executing `Agent/System/Templates/ProgressSchema.sql` against that path.

## Load Context

1. Read `Agent/System/SystemOverview.md` to understand the system, available skills, and progress model.
2. Read `Agent/Project/ProjectOverview.md`.

3. Query `Agent/Project/Progress/Progress.sqlite` for the active phase, initiatives, tasks, relevant files, and related events. Read any files associated with the current task.
4. List the files in `Agent/Project/Architecture/` and `Agent/Project/Standards/`, then read only those relevant to the current task.

## Return to User

If anything remains unclear, ask the user the necessary clarifying questions. Otherwise, ask how to proceed with the project.
