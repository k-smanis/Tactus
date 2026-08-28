# Tactus

Tactus provides project context, structured progress tracking, and reusable skills for software-engineering agents.

## Project Structure

- `System/` contains the reusable system and is tracked by this repository.
- `Project/` is included as an empty project workspace. Its initialized contents contain project-specific knowledge and progress and are ignored by this repository.

## Guides

### Set Up Tactus

Tactus setup has two separate stages:

1. The user prepares the repository and installs the skills.
2. The agent runs `/bootstrap` to initialize or restore project context.

Keep these stages separate. Repository metadata and harness instruction directories can receive incorrect ownership when they are created by an agent running through a restricted sandbox. That can prevent the harness from enforcing its own security boundaries on later commands.

#### 1. Prepare the Host Repository

Perform these steps yourself in an ordinary terminal, before asking an agent to operate on the project:

1. Create or clone the host project's Git repository.
2. Confirm that the host repository already contains `.git/`.
3. Clone this repository as `Tactus/` inside the host project.
4. Add `/Tactus/` to the host project's `.gitignore`.

Do not ask the agent to run `git init` for the host repository. The user should create or clone the repository so its Git metadata belongs to the user's operating-system account.

#### 2. Install the Skills

`Tactus/System/Skills/` is the canonical, harness-independent source for all Tactus skills. Copy each skill into the project-scoped skill directory supported by your harness:

- **Codex:** `.agents/skills/<skill-name>/SKILL.md`
- **Claude Code:** `.claude/skills/<skill-name>/SKILL.md`
- **Other harnesses:** use the equivalent project-local skill directory documented by that harness.

For Codex on Windows, create `.agents/` and copy the skills yourself from the same ordinary terminal used to prepare the repository. Do not ask a sandboxed Codex session to create `.agents/`.

The installed skill files are copies used by the selected harness. Do not remove or relocate the canonical files in `Tactus/System/Skills/`.

Track the project-scoped skill directory in the host repository so collaborators receive the same workflow. Restart or reload the harness if it does not detect newly installed skills automatically.

#### 3. Bootstrap the Project Context

After the repository and harness-specific skills have been installed, open the project in the harness and run `/bootstrap`.

Bootstrap initializes missing files under `Tactus/Project/`, creates the progress database when necessary, and loads the current project context. Bootstrap does not initialize the host Git repository or install harness skills.

### Get Help

Once you have installed the required skills, you can learn more about how to use this system using the `/help` skill.

### Refine Tactus

Run `/improve` to propose, review, commit, and publish reusable improvements to Tactus.
