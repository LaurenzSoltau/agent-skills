```md
Status: Draft
Ticket: <ID or none> · Requirements: <IDs or none>

# <Feature title>

## Problem

From the user's point of view: what is wrong or missing today.

## Solution

From the user's point of view: what changes.

## Behaviour

Numbered, each one checkable: "When <situation>, <observable result>."
Include the edge cases from grilling: interruptions, failures, wrong order, missing data.

## Decisions

Numbered decisions from grilling, with the reason where a reader would otherwise
"fix" it later. Link ADRs. Prototype answers name their branch.

## Affected areas

Modules and screens by name. No file paths or code; they go stale.

## Verification

For each behaviour: automated test, manual check, or device check by a person.
An automated test only where it is cheap and guards something that breaks easily.

## Out of scope

What deliberately stays as it is.

## Open questions

None. A spec with open questions is not ready.
```

Status values: `Draft` → `Approved <YYYY-MM-DD>` → `Implemented <YYYY-MM-DD>`. The status line warns any agent that opens an old spec: the code wins over an implemented spec.
