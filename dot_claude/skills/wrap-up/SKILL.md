---
name: wrap-up
description: Use when the user explicitly asks to wrap up finished work and fold durable rules into a CLAUDE.md, agent file or skill.
argument-hint: "target instruction file + changed files"
disable-model-invocation: true
---

# Wrap Up

Extract the smallest useful rule set from finished work and add it to the target instruction file.

## Inputs

1. Target instruction file (repo `CLAUDE.md`, a `.github/agents/*` or `.github/skills/*` file, or `~/.claude/CLAUDE.md`).
2. Changed files.
3. Nearest existing pattern the work followed.
4. Validations run.

## Keep only

- Code ownership rules.
- Layer boundaries.
- File placement rules.
- Durable validation workflow rules.
- Reusable architecture constraints.

## Reject

- Feature summaries and decision history.
- Feature-specific behaviour and one-off bug notes.
- Wording-only edits.
- Rules the target file already has, or implies.
- Gaps that come from lack of time (thin docs, few tests), not from a choice.

## Rule test

Add a rule only if ALL are true:

- It applies to future work.
- It is tied to the repo's architecture or workflow.
- No existing rule already implies it.

If any check fails, do not add the rule.

## Procedure

1. Read the target file first.
2. Inspect the changed code only enough to find durable rules.
3. Write each rule as a strict imperative sentence. Add a short code example if it helps.
4. Merge overlapping rules. Keep the strongest wording only.
5. Edit the target file only if at least one rule survives. Prefer no edit over a weak edit.
6. If the repo's `CLAUDE.md` is an index of trigger tables, update the table when a file's scope changed.

## Output

Return only:

1. Target file.
2. Rules added.
3. Rules rejected, each with the check it failed.

No prose recap, no retrospective language.
