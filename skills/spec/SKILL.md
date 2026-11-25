---
name: spec
description: Use only when the user invokes this skill by name. Turns a finished grilling session into a spec an agent can build without asking back.
disable-model-invocation: true
---

# Spec

Write down what grilling settled; no new interview. Read the project settings at `docs/agents/project.md`, or at the path the project's agent instructions name. If there are none, tell the user to run the setup-project skill and stop.

1. **Gather.** The settled decisions from the grill skill in this conversation, or a file the user points at. Read the glossary, the ADRs involved and the code areas the feature touches. A decision the spec needs but grilling never made: name it and send the user back to the grill skill for that point.
2. **Write** the spec with [SPEC-TEMPLATE.md](SPEC-TEMPLATE.md) in the project's doc language, glossary terms throughout. Name: short kebab-case, prefixed with the ticket ID if there is one. Publish it as the tracker setting says.
3. **Read test.** Hand only the spec's path to a fresh subagent (no subagents available: ask the user to open a fresh session) with this task: "Implement this spec without any other context. List every question you would need answered and every place you would have to guess." For each item: if grilling already decided it, write the answer into the spec; if not, put it to the user as a question with your recommended answer and write the decision in. Repeat until the read test returns nothing.
4. **Approve.** Show the user the spec. On approval set the status line to `Approved <YYYY-MM-DD>` and commit.

Done when the spec is committed as approved and the last read test came back empty.
