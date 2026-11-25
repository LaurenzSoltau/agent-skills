---
name: tweak
description: Use only when the user invokes this skill by name. Small change the user can describe in a sentence or two; a few questions or a short plan to approve, then build, check and commit.
disable-model-invocation: true
---

# Tweak

For small changes. Read the project settings at `docs/agents/project.md`, or at the path the project's agent instructions name. If there are none, tell the user to run the setup-project skill and stop.

1. **Understand.** Read the code the change touches and the glossary terms involved.
2. **Size check.** Tell the user to use the grill skill instead, and stop, when any of these applies:
   - more than one screen or module changes
   - it needs a domain decision or touches a written requirement
   - it can change data or values that other people rely on
   - a term comes up that the glossary lacks or contradicts
3. **Align.** Ask what is unclear, as few questions as needed, each with your recommended answer. Once it is clear, present a short plan: what changes where, what stays untouched, how it gets checked. Wait for approval.
4. **Build** exactly the approved plan. Anything else you notice goes into the report.
5. **Check.** Run the check commands from the settings until they pass.
6. **Commit** on the current branch, following the project's commit conventions. On the main branch, create a working branch first, named the way the project names branches.

Done when the change is committed and you have reported what changed, what you noticed outside the plan, and what is still unchecked (for example on a real device).
