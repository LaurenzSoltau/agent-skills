---
name: grill
description: Use only when the user invokes this skill by name. Relentless interview to align on a feature before building it; records glossary terms and ADRs as they settle and ends with an explain-back.
disable-model-invocation: true
---

# Grill

Interview the user until you both understand the feature the same way. Slow is fine: alignment is the goal, not speed.

Read the project settings at `docs/agents/project.md`, or at the path the project's agent instructions (`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`) name. If there are none, tell the user to run the setup-project skill and stop. Before the first round, read the glossary and the ADRs in the area under discussion.

## Rounds

Treat the feature as a **design tree**: each decision opens the decisions that depend on it. The **frontier** is every open decision whose prerequisites are settled.

Each round asks the whole frontier at once. Number the questions, give your recommended answer for each, and word each one so "yes" accepts the recommendation:

```
**Q1: <title>**
<question; options if there are several>
→ Recommended: <answer>
```

Wait for the answers, recompute the frontier, ask the next round. A question that depends on another open question waits for a later round.

**Facts are yours, decisions are the user's.** Look up whatever the code, docs or tools can answer, using a subagent for wide searches. Questions that depend on a running lookup wait for its result; ask the rest now. Put every decision to the user.

## While grilling

- **Glossary.** When a term is fuzzy, overloaded or clashes with the glossary, say so and propose one precise term. Write each settled term to the glossary right away, following [GLOSSARY-FORMAT.md](GLOSSARY-FORMAT.md).
- **Code check.** When the user states how something works, check the code and raise contradictions at once: "The code does X, you said Y. Which is right?"
- **Scenarios.** Probe the edges with concrete scenarios: interruptions, failures, wrong order, missing data.
- **Requirements.** Where the settings name written requirements, check against them. A gap becomes a question.
- **ADR.** Offer one only when a decision is hard to reverse, surprising without context, and the result of a real trade-off. Use the project's ADR template.
- **Prototype.** When a question needs something to click on to settle, propose a prototype: [PROTOTYPE.md](PROTOTYPE.md). Grilling continues once it has answered the question.

## Explain-back

When the frontier is empty, run all three steps in order. Any mismatch reopens grilling on that point.

1. **You explain.** Summarise the feature in plain words and glossary terms: what it does, for whom, and what it deliberately leaves out. The user corrects.
2. **The user explains.** Ask the user to describe the feature in their own words. Compare with the settled decisions and name every gap or contradiction.
3. **Predictions.** Ask three to five "what happens if …" questions on the riskiest edges. The user predicts the behaviour; check each prediction against the decisions and the code.

## Done

Done when the frontier is empty, all three explain-back steps passed, and the user confirms you share one understanding. Close with the numbered list of settled decisions, including prototype answers and their branches. That list is the input for the spec skill.
