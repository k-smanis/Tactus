# Bootstrap

Follow these directions exactly:

First:

1. Create any missing files and directories in `Agent/Project/` from `Agent/System/Templates/Project/`. Do not overwrite existing project files.
2. Ensure `Agent/Project/Progress/` exists.
3. If `Agent/Project/Progress/Progress.sqlite` does not exist, create it using `Agent/System/Templates/ProgressSchema.sql`.

Then:

1. Read `Agent/System/SystemOverview.md` to understand the system, available skills, and progress model.
2. Read `Agent/Project/ProjectOverview.md`.

Then:

1. Query `Agent/Project/Progress/Progress.sqlite` for the active phase, initiatives, tasks, relevant files, and related events. If there are any files relevant to the current task, read up on them.
2. List the files in `Agent/Project/Architecture/` and `Agent/Project/Standards/`, then read only those relevant to the current task.

Then:

If you are confused about anything, get back to the user with any clarifying questions.
If you are clear, ask the user on how to proceed developing the project.
