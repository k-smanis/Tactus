# Bootstrap

Follow these directions exactly:

## Initialize Project

1. Ensure `Tactus/Project/` exists.
2. Copy every missing file and directory from `Tactus/System/Templates/Project/` into `Tactus/Project/`. Never overwrite an existing project file.
3. Ensure `Tactus/Project/Progress/` exists.
4. If `Tactus/Project/Progress/Progress.sqlite` does not exist, create it by executing `Tactus/System/Templates/ProgressSchema.sql` against that path.

## Load Context

1. Read `Tactus/System/SystemOverview.md` to understand the system, available skills, and progress model.
2. Read `Tactus/Project/ProjectOverview.md`.

3. Query `Tactus/Project/Progress/Progress.sqlite` for the active phase, initiatives, tasks, relevant files, and related events. Read any files associated with the current task.
4. List the files in `Tactus/Project/Architecture/` and `Tactus/Project/Standards/`, then read only those relevant to the current task.

## Return to User

If anything remains unclear, ask the user the necessary clarifying questions. Otherwise, ask how to proceed with the project.
