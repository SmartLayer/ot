---
name: worklog
description: "The session's JSONL is gone or will expire and you need to continue the work later, on another machine, or in a fresh session: write a durable WORKLOG in the repository."
argument-hint: "[worklog filename, optional] [focus of the work, optional]"
---

# worklog

## Problem

Claude Code keeps each session as a JSONL transcript under `~/.claude/projects`. That file is not durable: it is retained for a limited period — on the order of 30 days — and can be deleted sooner. The repository outlives it. But the repository holds the code, not the knowledge of how the work reached its current state: why the design went the way it did, which approaches were tried and found closed, what the session learned about conditions the code does not record. When the JSONL is gone, a later agent picking up the same work starts cold — re-deriving what was already settled and re-walking dead-ends that were already mapped.

A worklog is a file in the repository that carries that knowledge forward, so the work continues with nothing lost, as though the JSONL were still there.

## Knowledge, not transcript

A faithful copy of the JSONL is the wrong target. Continuing the work does not need the transcript; it needs the knowledge the transcript happened to carry, and two things follow.

Most of a session does not bear on what to do next. The filter that decides what survives is single: does the record change what the next agent does. A change to the project's state changes it. A genuine unknown, once probed and mapped, changes it — the next agent does not re-probe. A step that led nowhere and left nothing behind changes nothing except how much there is to read.

And some of the transcript is worse than surplus. A misunderstanding — a misread instruction, a misdescribed issue or document — that has already been corrected at its source resurfaces in a copy of the transcript as a wrong turn the next agent has to read past. Because the source is already fixed, the turn can no longer be taken; recording that it once happened spends attention on a closed road. The worklog carries the knowledge forward, filtered; it does not replicate the session.

## What the worklog records

- **Impactful changes — the spine.** What is true of the project now that was not before, and the change that made it so. Write it forward: state the current reality, keep the prior state only as a parenthetical where the next agent needs it to act. This is the load of the document.
- **Genuine dead-ends.** A failed exploration or test that probed a real unknown condition — whether some property holds, whether an interface behaves a certain way, whether a path is viable. Record the condition probed and what was found. Omit it and the next agent reads the condition as still unknown and explores it again. This is the one kind of failure that earns its place: it is knowledge about the ground, not history of the walk.

## What the worklog leaves out

- **Non-impactful work.** A test run whose result was false, or a step that did not need to persist into the codebase. Note at most that it was done, kept separate from the spine, never phrased as part of the path that produced the current state. The separation is the point: the reader must be able to tell what moved the state from what merely occurred alongside it.
- **A mistake whose cause is already fixed.** A failed path that came from misreading the instruction, or from a misdescription in the issue, bug, or document that requested the work — when that source has since been corrected. Leave it out. If the run exposed such a misunderstanding and you have not yet corrected its source, correct it there first — that is where it belongs — rather than parking it in the worklog.

## Procedure

1. **Name the file.** If the caller gave a filename, use it. If the caller says *continue* while speaking of the worklog, write into the most recent existing worklog rather than opening a new one — a session that crossed midnight, or that belongs to the previous day's work, keeps the day it began. Otherwise write a new file in the working directory as `YYYY-MM-DD-WORKLOG.md`, or `YYYY-MM-DD-WORKLOG-<focus>.md` when the session has a clear focus. `WORKLOG` is upper-case, the name carries no spaces, and the date is today in `YYYY-MM-DD`.
2. **Write the spine.** The state the work reached and the impactful changes that produced it, forward-only.
3. **Add the dead-end map.** The genuine unknowns this session probed and what each returned, so they read as settled ground rather than open questions.
4. **Apply the filter to every discarded step.** Before recording any failed, reverted, or unneeded step, place it in one of the four classes above. Record it only if it is a genuine dead-end; a non-impactful run gets at most a separated note; a mistake with a corrected source gets nothing.
5. **The reader is the next agent, not a person.** Optimise for retrieval and density: keep every concrete specific (paths, identifiers, values, dates) and every epistemic marker (checked-empty, unobtainable, inferred, approximated). The like-human-do polish that governs human-facing text does not apply here.

## Resuming from a worklog

A session writes a new dated worklog unless it is continuing the previous one; the files accrete rather than overwrite. An agent resuming reads the most recent worklog first, and earlier ones only as far back as the work at hand reaches. The spine tells it the state; the dead-end map tells it which questions are already answered.
