---
name: setup-project
description: Configure this project for the agent skills (grill, tweak, spec, implement, retro). Run once per project, again to change settings.
disable-model-invocation: true
---

# Setup project

Write the project settings the other skills read. Explore, propose, write after the user confirms.

## 1. Explore

Read what exists; assume nothing.

- `CLAUDE.md` / `AGENTS.md`: an existing agent-skills pointer, the language docs are written in, build and test commands.
- An existing settings file from an earlier run: update it in place.
- ADR folder and its template, glossary, doc folder layout.
- The build tool's check commands: compile, unit tests, lint.
- `.ignore` at the repo root.
- The UI toolkit, for the prototype line.

## 2. Propose

Show the filled-in settings (template below). Mark every value you guessed. One round of corrections, then write.

## 3. Write

- The settings file, default `docs/agents/project.md`.
- One pointer line in `CLAUDE.md` (else `AGENTS.md`; neither exists → ask which to create), replacing an older one:
  `Agent skills (/grill, /tweak, /spec, /implement, /retro) read their project settings from <path>.`
- The spec folder as a line in `.ignore` (create the file if missing). Searches then skip old specs; reading a spec by its path still works.

Glossary, ADR folder and retro log are created later by the skill that first needs them.

Done when all three are written and the user has seen the final settings.

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
