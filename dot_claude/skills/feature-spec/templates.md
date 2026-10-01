# Feature spec templates

Fill every section. If something is unknown, write a short assumption or
`TBD: <what is missing>`. New files start as `📝 Draft`; set `🔍 Ready for
review` when you hand the file to the user.

## 00-idea.md

```md
# Feature idea

## Status

📝 Draft

## Feature name

<short feature name>

## Goal (business requirement)

<why we need it, for whom>

## What will be created or modified

- [ ] Database (migrations)
- [ ] Service / business logic
- [ ] API
- [ ] UI
- [ ] Deployment / infrastructure

## Safety relevance

<yes / no / unknown>: <one-line reason. Does anything act on this feature's
output: equipment, interlocks, operators, decisions? "no" needs the user's
explicit confirmation.>

## Downstream consumers

- <alarms, dashboards, reports, people, other services that use the output>

## Technical constraints

- <constraint>

## Open questions

- <question>
    - **Proposal**: <recommended answer>
    - **Answer**:

## Additional context

- <context>
```

## 01-specification.md

```md
# Feature specification

## Status

📝 Draft

## Feature name

<feature name>

## Summary

<two or three sentences>

## Business goal

<goal>

## User-visible behaviour

- <behaviour>

## System behaviour

- <behaviour, including failure behaviour>

## Acceptance criteria

- AC1: <criterion>
- AC2: <criterion>

## Safety and security

### Safety

For each output, ask: can it be stale, wrong (scaling, units, byte order,
register map), missing, duplicated, out of range, or late? How does each
consumer DETECT it? Also: DB down, restart, clock change, network loss, a
write failure reported as success.

- H1: <hazard: what goes wrong, who or what is harmed>
- FM1: <failure mode> -> <detection> -> <safe-state behaviour> (AC<n>)
- Safe state: <how the failure becomes VISIBLE downstream: quality flag,
  timestamp, gap, alarm. Never substitute last-good or default values
  silently.>

### Security

- <access, secrets, input validation, audit>

## Open questions

- no open questions

## Resolved decisions

- <decision> (<yyyy-mm-dd>)

## Out of scope

- <excluded item>

## Tests

### Test cases

#### TC-01: <TestMethodName> (AC1)

    Given  <precondition>
    When   <action>
    Then   <expected outcome>

### Coverage

| AC / H / FM | Test cases |
|---|---|
| AC1: <summary> | TC-01 |
| FM1: <summary> | TC-02 (fault injection) |

### Manual checklist

- <what CI cannot test, and why. Safety-linked items need the user's sign-off
  in `99-tracking.md`.>
```

## 0N-<part>.md

```md
# <Part> specification

## Status

📝 Draft

## Scope

- <in scope>

## Affected files, modules, tables

- <item>

## Changes

- <change>

## Validation

- [ ] <command or check>

## Risks and assumptions

- <risk>
```

## 99-tracking.md

```md
# Tracking

## Implementation progress

- [ ] <part>: <step>

## Validation evidence

- <yyyy-mm-dd>: <what was run or reviewed, exact commands, results>

## Safety review findings

- <yyyy-mm-dd> <severity> <finding>: <fixed | accepted by user: reason |
  rejected: reason>

## Manual sign-offs

- <yyyy-mm-dd> <checklist item>: <signed off by the user>

## Current blockers

- <blocker, owner>

## Notes

- <yyyy-mm-dd> override of <named gate> at the user's request.
- <yyyy-mm-dd> Safety relevance set to `no` by the user: <reason>. Objection: <evidence>.
```
