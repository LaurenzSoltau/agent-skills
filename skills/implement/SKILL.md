---
name: implement
description: Use only when the user invokes this skill by name. Builds an approved spec step by step, checks every behaviour against it and commits.
disable-model-invocation: true
---

# Implement

Build one approved spec. Read the project settings at `docs/agents/project.md`, or at the path the project's agent instructions name. If there are none, tell the user to run the setup-project skill and stop.

1. **Load.** Read the spec the user names, and only that spec. Its status must be `Approved`; otherwise stop and say so. Read the glossary and the ADRs the spec links.
2. **Branch.** Work on the current branch. On the main branch, create a working branch first, named the way the project names branches.
3. **Plan.** Split the spec into steps, each ending in a state that passes the checks. Show the steps in a few lines and start: the approved spec is the approval.
4. **Build** step by step. After each step run the check commands from the settings and commit, following the project's commit conventions. When the spec has a gap, or contradicts itself or the code, ask the user with your recommended answer, add the answer to the spec's Decisions, and continue. Anything you notice outside the spec goes into the report.
5. **Verify.** Go through every Behaviour item and every Verification entry. Mark each one verified (and how) or open (why, and who has to check it, for example a person on a real device).
6. **Docs.** Update the glossary, ADRs and docs this change affects, following the project's doc rules. Code names that differ from the glossary go into the report as rename candidates.
7. **Close.** Set the spec's status line to `Implemented <YYYY-MM-DD>` and commit.

Done when every behaviour is verified or listed as open, the checks pass and everything is committed. Report what was built, what is open, and what you noticed outside the spec.
