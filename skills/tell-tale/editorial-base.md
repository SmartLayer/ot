# Editorial Base

The uppercase editorial codes shipped with `tell-tale` and loaded on every run. They pair with the lowercase anti-pattern codes in `anti-pattern.md`. A project may add its own uppercase codes through a profile passed with `--profile`; this base is always present underneath that profile.

The edit threshold treats every uppercase code alike: a line carrying any uppercase code is edited (the threshold and the rest of the process live in `SKILL.md`).

**Reserved prefixes.** This base owns the letters `W` and `D`. A project profile must use other letters for its own codes, so the namespaces never collide.

---

## Writing rules (Orwell)

Six rules from George Orwell's "Politics and the English Language" (1946), adopted as house style. They apply to content in any language: prefer the common word over the bureaucratic one in Chinese and Spanish as well.

**`W01` Never use a metaphor, simile, or other figure of speech which you are accustomed to seeing in print.** Dead metaphors ("level playing field," "move the needle," "at the end of the day") signal that the writer stopped thinking. If the image no longer produces a mental picture, drop it.

**`W02` Never use a long word where a short one will do.** "Use" not "utilise." "Begin" not "commence." "Help" not "facilitate."

**`W03` If it is possible to cut a word out, always cut it out.** Every word must earn its place. Remove filler ("it should be noted that," "in terms of," "the fact that"), qualifiers that add nothing ("very," "quite," "somewhat"), and throat-clearing introductions.

**`W04` Never use the passive where you can use the active.** "The board removed the maintainers" not "The maintainers were removed." Passive voice hides the actor, which is often the most important part of the sentence.

**`W05` Never use a foreign phrase, a scientific word, or a jargon word if you can think of an everyday equivalent.** If the audience is general, write "proof of origin" before introducing "provenance attestation." If the audience is technical, jargon is fine, but only jargon the audience actually uses, not jargon the writer finds impressive.

**`W06` Break any of these rules sooner than say anything outright barbarous.** `W01`–`W05` are defaults, not laws. When following a rule makes the sentence ugly, unclear, or misleading, break the rule.

---

## Dialect

**`D01` The text departs from its declared target language variety.** This code is a conformance *check*, not a declaration of how many varieties a project should maintain. It flags a line whose spelling, vocabulary, or idiom drifts away from the variety the run was told to target (for example British English flagged for an American spelling, or Castilian Spanish flagged for a Latin-American term).

The target variety, or set of varieties, is supplied from outside this base: by the `--dialect` argument or by a project profile that declares it. `D01` carries no default target of its own. With no target declared for the run, `D01` is inert and never fires, so a run that does not care about dialect raises no dialect flags.

**Fix:** Bring the flagged word or construction into the declared target variety. When the project maintains several varieties, each variety's own content is checked against that variety; `D01` does not ask one variety's text to match another.
