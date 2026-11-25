# Glossary format

One glossary per project. One word, one meaning, shared by conversation, docs and code.

## Entry

```md
**Order** (DE: Bestellung)
A customer's binding request for one or more products, placed in a single checkout.
_Avoid_: Purchase, Kauf, Transaction
```

- **Term**: in the code language. Code uses exactly this name.
- **(Doc-language term)**: only when the project's docs are in another language.
- **Definition**: one or two sentences on what it is, not how it is built.
- **_Avoid_**: synonyms in either language that should no longer be used.

## Rules

- Several words for one concept: pick one, list the rest under _Avoid_.
- Project-specific concepts only. General programming terms stay out.
- Code and domain mean different things by one word: give each its own term.
- Code uses a different name than the glossary: mention it to the user as a rename candidate. The rename is a separate change.
- Group entries under subheadings once clusters appear.

## New glossary file

Create it at the path in the project settings when the first term settles. Start with:

```md
# Glossary

<one line: what this project is>

One word, one meaning. Entry: **Term** (doc-language term), one- or two-sentence definition, _Avoid_: synonyms.
```
