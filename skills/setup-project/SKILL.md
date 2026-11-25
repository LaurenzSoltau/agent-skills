---
name: setup-project
description: Use only when the user invokes this skill by name. Configures this project for the agent skills (grill, tweak, spec, implement, retro); run once per project, again to change settings.
disable-model-invocation: true
---

# Setup project

Write the project settings the other skills read. Explore, propose, write after the user confirms.

## 1. Explore

Read what exists; assume nothing.

- Agent instruction files: `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`. Note the language docs are written in, build and test commands, and an existing agent-skills pointer.
- `docs/agents/project.md` or another settings file from an earlier run: update it in place.
- ADR folder and its template, glossary, doc folder layout.
- The build tool's check commands: compile, unit tests, lint.
- `.ignore` at the repo root.
- The UI toolkit, for the prototype line.

## 2. Propose

Show the filled-in settings (template below) and the planned instruction-file change. Mark every value you guessed. One round of corrections, then write.

## 3. Write

- **One instruction file for all agents.** The project rules live in `AGENTS.md`; `CLAUDE.md` is a symlink to it.
  - Only `CLAUDE.md` exists: `git mv` it to `AGENTS.md`, then `ln -s AGENTS.md CLAUDE.md`.
  - Only `AGENTS.md` exists: `ln -s AGENTS.md CLAUDE.md`.
  - Both exist as separate files: show the user both and merge into `AGENTS.md` together, then link.
  - Claude-only syntax in the rules (`@path` imports) stays readable for other agents as a plain path; tell the user which lines use it.
- The settings file at `docs/agents/project.md`. Another path works only with a pointer line in the instruction files: `Agent skills read their project settings from <path>.`
- The spec folder as a line in `.ignore` (create the file if missing). Searches then skip old specs; reading a spec by its path still works.

Glossary, ADR folder and retro log are created later by the skill that first needs them.

Done when the files are written and the user has seen the final settings.

## Settings template

```md
# Agent skills: project settings

- Doc language (specs, glossary definitions, ADRs, retro log): <language>
- Glossary: <path>
- ADRs: <folder>, template: <path, or "one paragraph: context, decision, why">
- Specs: <folder>/<name>/spec.md
- Retro log: <path>
- Tracker: <section from the tracker file>
- Checks before every commit: <commands>
- Prototypes: branch `prototype/<name>`, never merged; built with <toolkit-specific way>
```

Tracker files in this folder: [local-tracker.md](local-tracker.md). Only `local` exists so far.
