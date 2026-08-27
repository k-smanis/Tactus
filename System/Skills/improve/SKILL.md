---
name: improve
description: Improve the reusable Tactus system and publish the approved changes to its remote repository.
---

# Improve

First, discuss the proposed improvement with the user and determine which changes are reusable across projects.

Then:

1. Apply the approved changes only to reusable files tracked by the Tactus repository.
2. Review the changes and ensure they contain no project-specific information.
3. Present the exact diff to the user before committing, together with a concise summary of its impact and any risks.
4. Ask the user for explicit approval to commit and publish the displayed changes. If the user requests revisions, apply them and repeat the review and preview before asking again.
5. Commit the approved changes to the Tactus repository.
6. Push the commit to its configured remote repository.
7. After the reusable commit has been pushed, synchronize every changed Tactus skill into the project-scoped skill installation used by the current harness. Examples include `.agents/skills/` for Codex, `.claude/skills/` for Claude Code, or the equivalent project-local directory for another harness.

Never modify, stage, commit, or push anything inside `Tactus/Project/`.

Outside the Tactus repository, modify only project-scoped harness skill installations, and only to synchronize the Tactus skills changed by the approved improvement. Never modify unrelated harness configuration, application files, or user-wide skill installations. If the project-scoped skill location is unknown or does not exist, ask the user before creating one.
