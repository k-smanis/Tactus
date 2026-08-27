# Tactus

Tactus provides project context, structured progress tracking, and reusable skills for software-engineering agents.

## Project Structure

- `System/` contains the reusable system and is tracked by this repository.
- `Project/` is included as an empty project workspace. Its initialized contents contain project-specific knowledge and progress and are ignored by this repository.

## Guides

### Set Up Tactus

1. Clone this repository as `Agent/` inside the project you want to work on.
2. Add `/Agent/` to that project's `.gitignore` so its repository does not track the Tactus repository or project context.
3. Install each skill in `Agent/System/Skills/` into the skill directory of your harness (e.g. Claude Code, Codex, etc.).
4. Restart or reload the agent if required for newly installed skills to become available.
5. Run `/bootstrap` to initialize the local `Project/` workspace and prepare the agent for development.

### Get Help

Once you have installed the required skills, you can learn more about how to use this system using the `/help` skill.

### Refine Tactus

Run `/improve` to propose, review, commit, and publish reusable improvements to Tactus.
