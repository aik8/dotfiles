---
name: feature-spec
description: Use when the user asks for a new feature, asks to plan, spec or design a change before coding, or when a change touches safety-related behaviour, production data or several parts of a system (DB, service, API, UI).
---

# Feature Spec

Every non-trivial feature gets a written, approved spec before any code. The
spec lives in the repo, not in chat. Code starts only after the user sends
`Start implementation`.

**If the repo already has its own spec workflow** (e.g. a development agent
file, `docs/specs/` with other templates), follow the repo's workflow instead.

## When NOT to use

Bug fixes with a clear cause, refactors that do not change behaviour, and
one-file changes the user asked for directly.

**These exemptions do not apply** when the change can alter the values,
timing or availability of safety-relevant data or behaviour (e.g. a register
scaling factor, a timeout, an alarm threshold). Then write at least a short
`01-specification.md` with the Safety section, plus `99-tracking.md`. Get the
safety review, the user's approval and `Start implementation` as usual.

## Folder and files

`docs/specs/yyyymmdd-short-name/` (ISO 8601 basic date, UTC; whole folder name
50 characters or fewer). Templates: `templates.md` in this skill's folder.

| File | Created when |
|---|---|
| `00-idea.md` + `99-tracking.md` | At the start |
| `01-specification.md` | `00-idea.md` is `👍 Approved` |
| `02-<part>.md`, `03-<part>.md`, ... | `01-specification.md` is `👍 Approved`. One file per part, in dependency order (e.g. `02-db`, `03-service`, `04-ui`). With fewer than three parts, use one `02-implementation.md`. |

Small feature: `00-idea.md` may be the first section of `01-specification.md`.
Its Safety relevance still needs the user's explicit confirmation.

## Status lifecycle

Each spec file has a `## Status` section. It is the only place a file's
status lives.

- `📝 Draft`: you are editing it.
- `🔍 Ready for review`: waiting for the user.
- `👍 Approved`: the user EXPLICITLY approved it.
- `✅ Done`: implemented, and its evidence is recorded (see below).

Allowed: `🔍 <-> 📝 -> 👍 -> ✅`. Set `👍 Approved` only on an explicit approval
from the user ("reviewed", "approved", "ok, next"). An answer to a question
is not an approval. If a reply might be an approval ("let's get going"), ask:
"Is `<file>` approved?"

## Gates

1. Do not create the next file until the current one is `👍 Approved`.
2. Do not write, edit or scaffold code, tests, migrations or branches until
   every spec file is `👍 Approved` AND the user sends `Start implementation`.
3. Gate names: `idea approval`, `spec approval`, `part approval`,
   `Start implementation`. The user may override one only by naming it
   ("skip the idea approval"). Record the override with its date in the
   `## Notes` section of `99-tracking.md`.
4. The safety review is not a gate the user can override. It always runs
   when its trigger applies.

General hurry ("skip the paperwork", "we need it by Friday") is not an
override. Ask which gate the user wants to skip, and offer to cut scope
(move items to `Out of scope`) instead.

## Questions

- Keep questions in the file's `## Open questions` section, each with a
  `**Proposal**:` (your recommended answer) and an empty `**Answer**:`.
- Ask in chat only the few questions that block the current file.
- When the user answers: apply the answer to the file, move it to
  `## Resolved decisions`, and remove it from `Open questions`. With no open
  questions left, write exactly `- no open questions`.
- If the codebase can answer a question, read the code instead of asking.

## Traceability

- Number acceptance criteria `AC1`, `AC2`, ..., hazards `H1`, `H2`, ..., and
  failure modes `FM1`, `FM2`, ....
- Every hazard and failure mode maps to an AC for its detection or safe-state
  behaviour, and to a fault-injection test case.
- Every AC gets at least one test case `TC-NN`, named after the test method it
  becomes (the repo's test naming convention). Resolved edge-case decisions
  get their own test cases.
- The coverage table in `01-specification.md` maps AC and H/FM to TCs. No AC,
  hazard or failure mode without a test. Anything CI cannot test goes on the
  manual checklist, with a reason.

## Safety

`01-specification.md` always has a `## Safety and security` section. Keep
safety (harm to people, equipment, product) and security (attacks, access,
secrets) apart.

- **When the review is mandatory:** Safety relevance in `00-idea.md` is `yes`
  or `unknown`. `no` needs a one-line reason, and the user confirms it
  explicitly when approving `00-idea.md`.
- **When it runs:** a safety software expert subagent reviews
  `01-specification.md` before you set it to `🔍 Ready for review`. It runs
  again when the Safety section, failure behaviour or a hazard-linked AC
  changes. Before the last part is `✅ Done`, it reviews the diff against the
  Safety section.
- **Findings:** record each one in `99-tracking.md` with a disposition: fixed,
  accepted by the user (reason), or rejected (reason). An open high-severity
  finding blocks `🔍 Ready for review`.
- **User says `no` against the evidence:** state the evidence (who acts on
  the output). If the user still decides `no`, record their decision, their
  reason and your objection in `## Notes` of `99-tracking.md`.

## During implementation

- Work in part order. The approved spec files are the source of truth. If the
  code needs a change to the spec, stop, update the spec, set it back to
  `🔍 Ready for review`, re-run the safety review if its trigger applies, and
  ask.
- After each part, update `99-tracking.md`: progress, changed files,
  blockers, and validation evidence (exact commands, results, UTC dates).
- A part is `✅ Done` only when its TCs pass and the evidence is recorded.
  A safety-linked item on the manual checklist also needs the user's recorded
  sign-off.

## Common mistakes

| Mistake | Fix |
|---|---|
| Plan and ACs only in a chat message | Write them into the spec files |
| Asking a batch of questions without proposals | Proposals in the file; ask only what blocks the current file |
| Treating an answered question as approval | Approval is explicit |
| Writing tests "first" before `Start implementation` | Tests are code. They wait for the gate too |
| Treating "hurry" as an override | Ask which gate; offer to cut scope |
| Marking Safety relevance `no` to skip the review | `no` needs a reason and the user's confirmation; record objections |
| Pushing fault-injection tests to the manual checklist | Only what CI truly cannot test, with a reason |
