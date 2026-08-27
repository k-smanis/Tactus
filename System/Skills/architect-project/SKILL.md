---
name: architect-project
description: Define the project and its development phases through an in-depth discussion with the user.
---

# Architect Project

Develop the project architecture through a collaborative discussion before recording any outcomes.

## Discuss

Work through the following stages in order. Do not treat discovery as a form or present the user with an exhaustive questionnaire. Discuss one coherent theme at a time, ask only a small number of connected questions, and respond to the answers before moving on. Offer interpretations, recommendations, alternatives, and tradeoffs; respectfully challenge unclear assumptions; and periodically summarize the emerging design for correction.

### 1. Establish the Project Overview

Understand the project's intent, users, desired outcomes, scope and exclusions, success criteria, stakeholders, and priorities.

### 2. Explore Nontechnical Considerations

Assess scope, stakeholders, priorities, build versus buy, timeline, budget, team, compliance, ownership, and adoption. Group related topics naturally rather than asking about each as a separate field.

For every consideration, determine whether it is:

- Material and sufficiently explored.
- Not currently relevant, with a reason.
- Intentionally deferred, with a reason.

### 3. Explore Technical Considerations

Assess existing systems, technical constraints, scale, performance, reliability, consistency, security, compatibility, and maintainability using the same material, not-relevant, or deferred classification.

Do not prematurely design schemas, APIs, state machines, infrastructure, or other implementation details. Discuss such details only when they clarify an important product or architectural decision, and do not allow them to displace the broader consideration review.

### 4. Discuss Architecture and Development Phases

Once the overview and relevant considerations are understood, discuss the architectural approach, important tradeoffs, risks, deferred decisions, and an ordered sequence of outcome-oriented development phases.

### 5. Confirm Readiness

Before writing project records, present a coherent synthesis and ask the user for explicit approval. The synthesis must clearly articulate:

- The project overview.
- What the project is and is not.
- Who it serves and the outcomes it should create.
- Success criteria, scope, and priorities.
- Relevant technical and nontechnical considerations.
- Major architectural decisions and tradeoffs.
- Known risks, assumptions, and deferred decisions.
- The ordered development strategy.

If any of these remain unclear or the user does not approve the synthesis, continue the discussion instead of writing project records.

## Crystallize

Only after the readiness review is approved, crystallize the outcomes, insights, and decisions of the discussion as follows:

1. Architectural decisions in the relevant files in `Tactus/Project/Architecture/`.
2. The project's phases in `Tactus/Project/Progress/Progress.sqlite`.
3. The project's overview in `Tactus/Project/ProjectOverview.md`.
