---
name: tell-tale
description: Run on a draft that must not read as AI-written. Labels each line for AI tells (vocabulary clusters, negative parallelisms, rule-of-three padding, em-dash overuse, promotional tone), rewrites only the flagged lines, then smooths the seams. Optional project profile and dialect target.
argument-hint: <draft-path> [--profile <path>] [--dialect <varieties>] [--two-pass]
---

# tell-tale

The tell-tale signs that give AI authorship away. This skill finds them line by line and edits them out, leaving the rest of the draft untouched. It works on any prose a model emits: documentation, posts, release notes, messages, briefs. It is in the family of `edit-email` and `edit-economistly`, and unlike those it is tied to no single register.

## Problem this skill exists to solve

A model writing prose leaves fingerprints: vocabulary that surged after late 2022, "not just X but Y" parallelisms, padded triads, em dashes where a comma would do, a press-release lilt. A reader who senses these stops trusting the text. The job is to remove them without flattening the writing into something a model would equally have produced.

A single sweeping rewrite cannot do that, because it cannot tell a clean sentence from a tainted one and ends up rewriting both. The discipline here is to separate the two acts: first decide which lines read as AI, then rewrite only those, then repair the joins. Labelling and editing are kept apart so neither contaminates the other.

The codes come in two registers. Lowercase codes (`anti-pattern.md`) are AI tells, drawn from Wikipedia's "Signs of AI writing". Uppercase codes are editorial rules: the shipped base (`editorial-base.md`, Orwell's `W01`–`W06` and the `D01` dialect check) plus whatever a project adds through `--profile`. The two registers drive the edit threshold differently, below.

## Procedure

The draft must already be a file on disk; the passes read it by path, never from pasted text, so a shortened copy cannot blind them. Each pass runs as a fresh-context subagent (the reasons are below).

1. **Pass 1, label.** Spawn a subagent with the prompt at `${CLAUDE_PLUGIN_ROOT}/skills/tell-tale/label-prompt.md`. Substitute `$ANTIPATTERN_PATH` with `${CLAUDE_PLUGIN_ROOT}/skills/tell-tale/anti-pattern.md`, `$EDITORIAL_BASE_PATH` with `${CLAUDE_PLUGIN_ROOT}/skills/tell-tale/editorial-base.md`, `$PROFILE_PATH` with the `--profile` path or `(none)`, `$DIALECT_TARGETS` with the `--dialect` value or `(none)`, and `$FILE` with the draft's absolute path. The subagent writes a `.sc` sidecar beside the draft (`report.md` to `report.sc`), one line per draft line, codes in brackets or empty. It judges only; it does not edit.
2. **Pass 2, edit.** Spawn a subagent with the prompt at `${CLAUDE_PLUGIN_ROOT}/skills/tell-tale/edit-prompt.md`, the same substitutions plus `$SC_PATH` for the sidecar. The subagent rewrites every line over the threshold, then makes a minimum-touch smoothing pass over the whole file, writes the draft back, and updates the `.sc` (clearing fixed codes, suffixing unresolved ones with `?`).
3. **Review gate.** Present the summary report below to the user. Nothing is committed and no `.sc` is deleted until the user accepts.
4. With `--two-pass`, run a second label-then-edit cycle on the now-revised draft, to catch tells the first edit surfaced. Otherwise stop after one cycle.

### Edit threshold

A line is edited if its label holds **any uppercase code**, or **two or more lowercase codes**. A single lone lowercase code is tolerated: one AI-ism in an otherwise sound sentence is acceptable, a cluster is not. The threshold never inspects which letter an uppercase code carries, so base codes (`W`, `D`) and profile codes are treated alike.

### The `.sc` sidecar

The `.sc` is the diagnostic; the `.md` is the patient. Each `.sc` line corresponds to the same line number in the draft. The files are ephemeral working artifacts between Pass 1 and the user's accept or reject: they are not committed. A consuming repository should gitignore `*.sc`.

### Summary report

```
## Revision summary

### Counts
- Lines labelled:       <n>
- Lines edited:         <n>
- Lines tolerated:      <n>  (single lowercase code, not edited)
- Lines needing human:  <n>  (marked [code?])

### By code (most frequent first)
  c01  ██████████  14
  c04  ████████    11
  W02  ████         5
  ...

### Sample edits (a few of the most changed lines)
  line 23  [c01][c04]  BEFORE: ...   AFTER: ...

### Lines needing human review
  line 67  [c05?]  Vague attribution, source unclear
```

Then ask: accept these edits? On accept, delete the `.sc` files and let the caller commit the edited draft. On reject, leave the `.sc` files in place as an audit trail and commit nothing; the user reviews with `git diff` and adjusts by hand.

## The profile and dialect seam

Without `--profile` and `--dialect`, the skill catches the lowercase AI tells and applies the Orwell base; `D01` stays inert. A project adds its own house rules by passing an editorial guide of uppercase-coded rules through `--profile`, and its target language variety through `--dialect` (or declared inside the profile). The profile's codes join the base under the same threshold. A profile must avoid the reserved prefixes `W` and `D`, which belong to the base.

## Model selection

Pass 1 is classification and runs well on the session's default tier. Pass 2 on a draft with only lowercase codes is mechanical and runs there too; a draft carrying uppercase codes asks for editorial judgement, so escalating Pass 2 to a stronger model is worthwhile. This is guidance, not a hard pin.

## Files

`${CLAUDE_PLUGIN_ROOT}/skills/tell-tale/`:

- `anti-pattern.md` — the lowercase AI-tell taxonomy, the living canonical home
- `editorial-base.md` — the shipped uppercase codes (`W01`–`W06`, `D01`)
- `label-prompt.md` — the Pass 1 subagent prompt
- `edit-prompt.md` — the Pass 2 subagent prompt

## Why fresh-context subagents

The labeller must judge the draft on the text alone, not on the intent the calling context remembers. A pass forked inside the caller's context would label what the author meant rather than what the page says. A brand-new agent reads only what a future reader will read. Keeping label and edit in separate subagents also stops the editor from trusting its own labelling instead of re-reading the line.
