# Retro log format

Create the file at the path in the project settings on the first retro, starting with `# Retro log`. Newest entry on top, in the project's doc language.

```md
## 2026-11-25: <session topic>

| Finding | Kind | Seen before | Level | Decision |
|---|---|---|---|---|
| Agent looked for the glossary in the specs folder | navigation | 1× (2026-11-12) | pointer | done: pointer in AGENTS.md |
| Asked for the test command although it is in the settings | missing info | never | none | rejected: one-off |
```

Kinds, always spelled like this so repeats can be counted: `correction`, `broken rule`, `navigation`, `missing info`, `late check`, `skill step`.
