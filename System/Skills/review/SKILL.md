---
name: review
description: Review project changes before a commit and highlight issues by severity.
---

# Review

First, review the current changes against:

- Current phase, initiative, and tasks.
- Correctness.
- Relevant architecture decisions, such as schemas, data flows, interfaces, and technology choices.
- Security best practices.
- Project standards.
- Established patterns.
- Relevant official documentation.
- Unnecessary complexity and overengineering.

Then:

- Report the issues in order of severity, with their relevant file locations, without modifying the implementation.

Then:

- Once all issues have been resolved and the changes have been committed, update the relevant progress in `Agent/Project/Progress/Progress.sqlite`.
