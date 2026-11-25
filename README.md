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

All skills are meant to run only when you call them by name.

## Install

```bash
./install.sh
```

Edits in this repo take effect immediately, since every agent reads the skills from here:

| Agent | How it finds the skills | Call a skill | Only when called |
|---|---|---|---|
| Claude Code | links in `~/.claude/skills/` | `/grill` | `disable-model-invocation: true` in `SKILL.md` |
| Codex | links in `~/.agents/skills/` | `$grill` or `/skills` | `policy.allow_implicit_invocation: false` in `agents/openai.yaml` |
| Antigravity | entry in `~/.gemini/config/skills.json` | `/grill` | no setting exists; the description asks the agent to wait for an explicit call |

Then run the setup-project skill once in each project.

## Per-project settings

setup-project writes the project settings to `docs/agents/project.md`, the path every skill
looks at first. It also moves the project rules into `AGENTS.md` and makes `CLAUDE.md` a
symlink to it, so all agents read the same rules. Glossary, ADRs, specs and the retro log live in the project, never here.
Keep this repo free of anything project- or company-specific.

## Writing a new skill

- Folder name = `name` in the frontmatter: lowercase letters, digits, single hyphens.
- `description` starts with "Use only when the user invokes this skill by name."
- `disable-model-invocation: true` in the frontmatter, plus `agents/openai.yaml` with
  `policy.allow_implicit_invocation: false`.
- Refer to other skills by name ("the spec skill"), not by one agent's call syntax.
- Run `./install.sh` again.
