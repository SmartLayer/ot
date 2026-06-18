---
name: edit-email
description: Polish or compose an email draft, passed inline, against the failure modes of AI-drafted mail, and make it read as a person wrote it to someone they like. Standing like-human-do pass on every email.
argument-hint: [--director] [--Robin]
---

# edit-email

## Problem this skill exists to solve

AI-drafted email reads to its sender like an email and to its recipient like a project: paraphrased, hedged, padded, anchored to the drafting session, with asks turned into lists. Worse, a follow-up to someone the sender actually met reads as a pitch to a stranger rather than the next line of a relationship.

## Standing step: like-human-do

Every email this skill touches passes through `${CLAUDE_PLUGIN_ROOT}/skills/edit-email/like-human-do.md`. This is not optional and not a flag. Read it now and apply it before you finalise.

The general email rules are in `${CLAUDE_PLUGIN_ROOT}/skills/edit-email/email-rulebook.md`; apply them as a backstop.

## Procedure

1. Read `like-human-do.md` and `email-rulebook.md`.
2. Assemble what you know: the recipient, why this email is being sent, and everything in the conversation log that genuinely passed between the sender and this person.
3. Write the email directly, applying like-human-do. Do not spawn a subeditor for this variant. Produce the email the sender would actually send to someone they liked.
4. Output exactly the line `[[A2]]` on its own, then a blank line, then the finished email (header preamble `to:`/`cc:`/`subject:` then the body). Print nothing else.
5. The skill does not send.
