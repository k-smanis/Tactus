# Tactus

Tactus provides project context, structured progress tracking, and reusable skills for software-engineering agents.

## Project Structure

- `System/` contains the reusable system and is tracked by this repository.
- `Project/` is included as an empty project workspace. Its initialized contents contain project-specific knowledge and progress and are ignored by this repository.

## Guides

### Set Up Tactus

1. Clone this repository as `Tactus/` inside the project you want to work on.
2. Add `/Tactus/` to that project's `.gitignore` so its repository does not track the Tactus repository or project context.
3. Install each skill in `Tactus/System/Skills/` into your harness's project-scoped skill directory. Prefer a project-scoped installation over a user-wide installation so the Tactus workflow stays tied to the project, can be shared with collaborators, and does not affect unrelated projects. Use the project-level location supported by your harness, for example:
   - **Codex:** `.agents/skills/<skill-name>/SKILL.md`
   - **Claude Code:** `.claude/skills/<skill-name>/SKILL.md`
   - **Other harnesses:** the equivalent project-local skill directory documented by that harness.
4. Track the project-scoped skill directory in the project's repository so collaborators receive the same Tactus workflow.
5. Restart or reload the agent if required for newly installed skills to become available.
6. Run `/bootstrap` to initialize the local `Project/` workspace and prepare the agent for development.

### Get Help

Once you have installed the required skills, you can learn more about how to use this system using the `/help` skill.

### Refine Tactus

Run `/improve` to propose, review, commit, and publish reusable improvements to Tactus.
