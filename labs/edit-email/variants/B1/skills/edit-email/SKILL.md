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

1. Read `like-human-do.md` and `email-rulebook.md`.
2. **Connection-point pass.** From the conversation log, list (to yourself) every concrete thing this recipient personally said or shared that was *not* business: a story, a thing they are proud of, a side topic, something you both noticed. Then list the business points separately. You will reach instinctively for a business point because it is the salient thing in memory; resist it and prefer a personal one.
3. **Ask audit.** State plainly what, if anything, this email is trying to get for the sender. If the honest answer is "business" (a referral, a listing, a sale), do not write that want into the email. Either find a genuine give, or tell the user there is no human note to send here.
4. Write the email directly, applying like-human-do: give rather than seek, lead with the personal connection point, keep it short. Do not spawn a subeditor for this variant.
5. Output exactly the line `[[B1]]` on its own, then a blank line, then the finished email (`to:`/`cc:`/`subject:` then body). Print nothing else.
6. The skill does not send.
