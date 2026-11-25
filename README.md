# agent-skills

Personal agent skills for building features with a coding agent: align first, then specify,
then build, then improve the setup. Project-independent; each project keeps its own settings.

The ideas come from Matt Pocock's [skills](https://github.com/mattpocock/skills) (grilling,
shared glossary, spec before build, retro). The skills here are rewritten and much smaller.

## Flow

```
small change ──▶ /tweak ──────────────────────────────▶ commit
                   │ too big
                   ▼
feature ───────▶ /grill ──▶ /spec ──▶ /implement ─────▶ commits
                   │                                         │
                   └─ prototype/<name> branch (never merged)  ▼
                                                           /retro
```

| Skill | Use it to |
|---|---|
| `/setup-project` | Configure a project once: paths, language, check commands |
| `/grill` | Get interviewed until you and the agent agree on a feature; builds the glossary and ADRs on the way |
| `/tweak` | Make a small change with a few questions or a short plan to approve |
| `/spec` | Turn a finished grilling into a spec an agent can build without asking back |
| `/implement` | Build a spec, check it, commit |
| `/retro` | Review a session and fix the setup that caused friction |

All skills are user-invoked: they run only when you type them.

## Install

```bash
./install.sh
```

Links every skill folder into `~/.claude/skills/`, so edits here take effect immediately.
Then run `/setup-project` once in each project.

## Per-project settings

`/setup-project` writes a short settings file into the project (default
`docs/agents/project.md`) and one pointer line into its `CLAUDE.md`. Glossary, ADRs, specs
and the retro log live in the project, never here. Keep this repo free of anything
project- or company-specific.
