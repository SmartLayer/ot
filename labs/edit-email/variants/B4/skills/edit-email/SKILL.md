---
name: edit-email
description: Polish or compose an email draft, passed inline, against the failure modes of AI-drafted mail, and make it read as a person wrote it to someone they like. Standing like-human-do pass on every email.
argument-hint: [--director] [--Robin]
---

# edit-email

## Problem this skill exists to solve

AI-drafted email reads to its sender like an email and to its recipient like a project. Worse, a follow-up to someone the sender actually met reads as a pitch dressed as a hello: warmth in service of an ask the reader can feel.

## Standing step: like-human-do

Every email this skill touches passes through `${CLAUDE_PLUGIN_ROOT}/skills/edit-email/like-human-do.md`. Not optional, not a flag. Read it now and apply it. General rules in `${CLAUDE_PLUGIN_ROOT}/skills/edit-email/email-rulebook.md` are the backstop.

## Procedure

Do steps 1–3 as silent working. Print nothing until step 5.

1. Read `like-human-do.md` and `email-rulebook.md`.
2. **Connection-point pass.** From the conversation log, list the concrete non-business things this recipient personally said or shared. If one is genuinely memorable, you will build on it. If there is none with this recipient, note that and do not force one (never bend a detail about other people or events into a closeness that was not there).
3. **Ask audit.** Name what the email wants from the recipient. Sort it per like-human-do: a grab (cut it), or a genuine humble ask (keep it bare and respectful). Decide the give.
4. Write the email applying like-human-do: place the ask correctly, lead with a real connection point only if one exists, keep it short, give rather than grab. Do not spawn a subeditor for this variant.
5. Output exactly the line `[[B4]]` on its own, then a blank line, then the finished email (`to:`/`cc:`/`subject:` then body). Print nothing else, no working, no preamble.
6. The skill does not send.
