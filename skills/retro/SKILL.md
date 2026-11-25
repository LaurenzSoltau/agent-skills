---
name: retro
description: Use only when the user invokes this skill by name. Reviews a session and improves the setup that caused friction (instructions, skills, docs, checks), escalating repeated problems.
disable-model-invocation: true
---

# Retro

Look back at a session and fix the setup around the agent, not the product code. Read the project settings at `docs/agents/project.md`, or at the path the project's agent instructions name. If there are none, tell the user to run the setup-project skill and stop.

1. **Source.** The current session, unless the user names another one; then read its transcript, and ask the user for the file if you cannot find it.
2. **Find friction.** Collect every moment where:
   - the user corrected the agent or repeated an instruction
   - a project rule or a skill step was broken
   - finding something took long or led to the wrong place
   - information was missing and had to be asked for or guessed
   - a check failed late, or an available check never ran
   - a skill step was unclear, skipped or useless

   Quote each moment in a line.
3. **Count.** Read the retro log and find earlier entries of the same kind for each finding.
4. **Pick the level**: the lowest one that fixes it, one higher for each repeat.
   1. *None*: a one-off.
   2. *Memory*: a fact for the next sessions, where the agent has a memory.
   3. *Pointer*: the information existed but was not found; add a pointer where agents look.
   4. *Rule*: a line in the agent instructions or a rules file. From the second occurrence on.
   5. *Skill*: a skill step led the agent wrong.
   6. *Check*: lint rule, test, hook or setting. For mechanical mistakes, and for any text rule broken a second time.

   Also list rules that change nothing or are out of date, as candidates for deletion.
5. **Propose**, most severe first: finding, quote, earlier occurrences, level, the concrete change. The user decides each one.
6. **Apply** what the user approved. Project fixes go into the project. Skill fixes go into the skills repo (where this skill's files really live), written generically: no project names, paths or company details.
7. **Log.** Add an entry to the retro log, following [RETRO-LOG-FORMAT.md](RETRO-LOG-FORMAT.md), rejected findings included. Commit in every repo you changed.

Done when every finding has a decision, the approved changes are made and the log entry is committed.
