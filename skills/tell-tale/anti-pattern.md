# AI Writing Anti-Patterns

Numeric codes for labeling text that exhibits signs of AI-generated writing. Lines tagged with these codes are queued for review and AI-assisted rewriting.

Source: [Wikipedia:Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)

This is the living canonical home for the taxonomy. The "words to watch" drift across model eras, so expect to update them here over time. The codes are lowercase; they pair with the uppercase editorial codes in `editorial-base.md` and in any project profile passed via `--profile`.

---

## How to use

Annotate a line or passage with its code:

```
[c01] The founding of Idescat represented a significant shift toward regional statistical independence.
```

Multiple codes may apply to one passage:

```
[c01][c03][l01] This pivotal moment underscores the enduring legacy of the institution, fostering a vibrant tapestry of innovation.
```

---

## Content

### c01 — Undue emphasis on significance, legacy, and broader trends

Puffing up importance by claiming arbitrary aspects of a topic represent or contribute to broader trends. Adding statements about legacy, significance, or historical impact that are not supported by sources.

**Words to watch:** *stands/serves as, is a testament/reminder, a vital/significant/crucial/pivotal/key role/moment, underscores/highlights its importance/significance, reflects broader, symbolizing its ongoing/enduring/lasting, contributing to the, setting the stage for, marking/shaping the, represents/marks a shift, key turning point, evolving landscape, focal point, indelible mark, deeply rooted*

**Example:**
> The Statistical Institute of Catalonia was officially established in 1989, **marking a pivotal moment** in the evolution of regional statistics in Spain.

**Fix:** State facts without inflating their significance. Remove vague claims of broader importance unless sourced.

---

### c02 — Undue emphasis on notability, attribution, and media coverage

Asserting notability by listing sources that covered a subject, echoing guideline language like "independent coverage," or creating entire sections dedicated to proving media attention.

**Words to watch:** *independent coverage, local/regional/national media outlets, music/business/tech outlets, profiled in, written by a leading expert, active social media presence*

**Example:**
> Her insights have been featured in *Wired*, *Refinery29*, and other prominent media outlets.

**Fix:** Summarize what sources say about the subject, not that they covered it. Cite as footnotes, not in body text.

---

### c03 — Superficial analyses

Inserting shallow analysis of information, often through present-participle ("-ing") phrases appended to sentences. Claims about significance, recognition, or impact that add no real information.

**Words to watch:** *highlighting/underscoring/emphasizing ..., ensuring ..., reflecting/symbolizing ..., contributing to ..., cultivating/fostering ..., encompassing ..., valuable insights, align/resonate with*

**Example:**
> Situated just a few miles from the U.S.–Mexico border, the temple stands as a counter-symbol, **emphasizing unity, togetherness, and transcendent faith.**

**Fix:** Delete the participial analysis. If the claim has substance, rewrite it as a standalone sourced statement.

---

### c04 — Promotional and advertisement-like language

Adopting the tone of a press release, travel guide, or sales pitch. Even when no promotional intent exists, the output skews positive and uses language more suited to marketing.

**Words to watch:** *boasts a, vibrant, rich, profound, enhancing, showcasing, exemplifies, commitment to, natural beauty, nestled, in the heart of, groundbreaking, renowned, featuring, diverse array*

**Example:**
> Nestled within the breathtaking region of Gonder in Ethiopia, the town stands as a vibrant place with a rich cultural heritage.

**Fix:** Replace promotional language with neutral description. State facts; let readers assess value.

---

### c05 — Vague attributions and overgeneralization of opinions

Attributing claims to unnamed authorities ("researchers," "experts," "industry reports") or inflating the breadth of agreement — presenting one or two sources as widespread consensus.

**Words to watch:** *industry reports, observers have cited, experts argue, some critics argue, several sources/publications* (when few are cited), *such as* (before exhaustive lists presented as non-exhaustive)

**Example:**
> Due to its unique characteristics, the river is of interest to **researchers and conservationists.**

**Fix:** Name the specific source or remove the attribution. Do not imply broader agreement than evidence supports.

---

### c06 — Outline-like conclusions about challenges and future prospects

Formulaic closing sections that begin with "Despite its [positive words], [subject] faces challenges..." and end with vague optimism about future initiatives. Often appears with a rigid outline structure including separate "Challenges" and "Future Prospects" sections.

**Words to watch:** *Despite its... faces several challenges..., Despite these challenges, Challenges and Legacy, Future Outlook*

**Example:**
> Despite its industrial prosperity, Korattur faces challenges typical of urban areas. With its strategic location and ongoing initiatives, Korattur continues to thrive.

**Fix:** Remove formulaic challenge/prospect framing. If challenges are real and sourced, state them plainly without the optimistic coda.

---

### c07 — Leads treating titles as proper nouns

Introducing a topic or list title as if it were a standalone real-world entity, defining the article title rather than the subject.

**Example:**
> **"List of songs about Mexico" is a curated compilation** of musical works that reference Mexico.

**Fix:** Write about the subject directly, not about the title of the document.

---

### c08 — Vague see-also sections

Filling cross-reference sections with overly broad terms tangentially related to the topic.

**Example:** A page about a fintech startup linking to "Financial technology" and "Entrepreneurship" with no specificity.

**Fix:** Link to genuinely related, specific topics — or omit the section.

---

## Language and Grammar

### l01 — High density of AI-vocabulary words

Overuse of specific words that surged in frequency after LLM chatbots became widely accessible in late 2022. One or two may be coincidence; a cluster is a strong signal.

**Words to watch:**

- **2023–mid 2024 (GPT-4 era):** *Additionally, boasts, bolstered, crucial, delve, emphasizing, enduring, garner, intricate/intricacies, interplay, key, landscape, meticulous/meticulously, pivotal, underscore, tapestry, testament, valuable, vibrant*
- **Mid 2024–mid 2025 (GPT-4o era):** *align with, bolstered, crucial, emphasizing, enhance, enduring, fostering, highlighting, pivotal, showcasing, underscore, vibrant*
- **Mid 2025 onward (GPT-5 era):** *emphasizing, enhance, highlighting, showcasing*

**Example:**
> This culinary tapestry is a direct result of Somalia's longstanding heritage of vibrant trade. Additionally, Somali merchants played a pivotal role in the global coffee trade.

**Fix:** Replace with plain, precise words. Use "important" not "pivotal," "shows" not "showcasing," "complex" not "intricate."

For the vogue-metaphor cluster (anchor, enabler, load-bearing, leverage, robust, seamless), see `g01` below: those are handled as canaries, not by simple replacement.

---

### l02 — Avoidance of copulatives ("is"/"are")

Substituting simple copulas with more elaborate constructions: "serves as" instead of "is," "features" instead of "has," "marks" instead of "is."

**Words to watch:** *serves as/stands as/marks/represents [a], boasts/features/offers [a]*

**Example:**
> Gallery 825 on La Cienega Boulevard **serves as** LAAA's exhibition space for contemporary art. The gallery **features** four separate spaces.

**Fix:** Use "is" and "has" where they work. Simpler constructions are usually clearer.

---

### l03 — Negative parallelisms

Framing descriptions as corrections to misconceptions the reader never had. "Not just X, but also Y" or "Not X, but Y" constructions that add false dramatic tension.

**Subtype A — "Not just X, but also Y":**
> The self-portrait constitutes **not only** a work of self-representation, **but** a visual document of her obsessions.

**Subtype B — "Not X, but Y":**
> This dispersal **is not** dissolution. **Rather, it constitutes** what Deleuze might describe as "becoming."

**Fix:** State the positive claim directly. Remove the imagined misconception being corrected.

---

### l04 — Rule of three

Overusing triple-item lists ("adjective, adjective, and adjective" or "phrase, phrase, and phrase") to make superficial analysis appear comprehensive.

**Example:**
> The conference brings together **global SEO professionals, marketing experts, and growth hackers** to discuss trends. The event features **keynote sessions, panel discussions, and networking opportunities.**

**Fix:** If three items genuinely matter, keep them. If the triad is padding, cut to what's relevant.

---

### l05 — Elegant variation

Replacing repeated references to the same thing with different synonyms each time (e.g., "the artist," "the creator," "the visionary," "the master") due to repetition-penalty algorithms. Leads to purple, overwrought prose.

**Example:**
> Vierny committed to supporting **non-conformist artists** [...] these **like-minded artists** [...] the **Russian avant-garde artists** [...] the **diverse yet united front of non-conformist artists.**

**Fix:** Repeat the natural term. Consistent naming is clearer than forced variation.

---

### g01 — Signal words (AI-speech canaries)

A small set of words whose mere presence signals the sentence was probably produced in "improve" mode. A model that can speak plainly, when asked to polish, drifts toward these words, so the harder it is pushed to improve, the closer it gets to cliché and the worse the result. The word is a canary, not a banned item.

The point is not to forbid the word. The point is that when one appears, you stop and re-examine the whole sentence under the high-level reader tests (the "Reader state" section of the editorial base) and the say-it-aloud rewrite in the edit pass, harder than a clean sentence would get. The sentence usually fails and is re-said; sometimes the word is a genuine literal use (a ship's anchor, physical leverage) and survives. Either way the re-examination is not optional.

Why a canary and not a blocklist: a model cannot feel these words as unusual, because they are common in its training text. Telling it "do not use them" patches the named word while the AI-speech mode that produced it stays on, and the same mode reaches for the next unlisted cliché. The canary instead trips the high-level rules, which repair the sentence and the mode together.

**Signal words (living list):** *anchor* (as a metaphor), *enabler/enabling*, *load-bearing*, *leverage*, *robust*, *seamless*, *unlock(s)*, *driver/drives*, *harness* (as a verb), *surface* (as a verb), *cornerstone*, *ecosystem*, *delve*. Add a word when it recurs in real drafts.

**Trigger:** the label pass emits `[g01]` for any in-scope line containing a signal word. A `g01` line is always re-examined by the say-it-aloud method and the reader tests, even if it is otherwise below the edit threshold; the word is never swapped for a fancier synonym, the sentence is re-said and kept only if it then reads as speech.

---

## Style

### s01 — Title case in headings

Capitalizing all main words in section headings instead of using sentence case.

**Example:**
> ### Global Context: Critical Mineral Demand
> ### Strategic Negotiations and Global Partnerships

**Fix:** Use sentence case: "Global context: critical mineral demand."

---

### s02 — Overuse of boldface

Bolding phrases mechanically for emphasis in a "key takeaways" fashion, inherited from slide decks and listicles.

**Example:**
> A **leveraged buyout (LBO)** is characterized by **debt financing** to acquire a company. This enables **private equity firms** and **financial sponsors** to control businesses.

**Fix:** Bold only proper-noun introductions or genuinely critical terms. Remove decorative boldface.

---

### s03 — Inline-header vertical lists

Lists where each item begins with a bolded inline header followed by a colon, then descriptive text. Resembles a slide deck or README more than prose.

**Example:**
> - **SEO (Search Engine Optimization):** Traditional methods for improving visibility.
> - **AEO (Answer Engine Optimization):** Techniques focused on voice assistants.
> - **GIO (Generative Engine Optimization):** Strategies for LLM citations.

**Fix:** Convert to prose where possible. If a list is genuinely needed, use it without the bolded-header-colon format.

---

### s04 — Emoji in prose

Decorating section headings or bullet points with emoji.

**Example:**
> 🧠 Cognitive Dissonance Pattern:
> 🧱 Structural Gatekeeping:
> 🚨 Underlying Motivation:

**Fix:** Remove emoji from all formal content.

---

### s05 — Overuse of em dashes (moved to `W07`)

Em dashes are handled by the editorial base as a forcing rule, not by this taxonomy. See `W07` in `editorial-base.md`: a single em dash forces its line to be rewritten, with two exemptions (quotation attribution and the en-dash numeric range). The labeller emits `W07` for an em-dash line, never `s05`; this entry is kept only so the code number is not reused.

The original Wikipedia description, for reference: using em dashes (—) where commas, parentheses, or colons would be more natural, especially when mimicking "punched up" sales-like writing.

---

### s06 — Unnecessary tables

Creating small tables for information better presented as prose.

**Example:** A two-row, two-column table for "Market Valuation: ~USD 2.1 billion" and "Major Facilities: NLDB, CBR Biobank."

**Fix:** Use prose or a simple list unless the data is genuinely tabular (many rows, consistent columns).

---

### s07 — Curly quotation marks and apostrophes

Using typographic ("smart") quotes and apostrophes inconsistently or in contexts where straight quotes are standard. May indicate ChatGPT or DeepSeek origin.

**Fix:** Normalize to the project's chosen convention. Flag inconsistent mixing of curly and straight quotes.

---

### s08 — Subject lines in body text

Including "Subject: Request for..." lines meant for email forms pasted into body content.

**Example:**
> Subject: Request for Permission to Edit Wikipedia Article - "Dog"

**Fix:** Remove subject-line artifacts. Integrate the intent into normal prose.

---

### s09 — Skipping heading levels

Jumping from H1 to H3 (or H2 to H4), skipping intermediate levels. Caused by LLMs defaulting to Markdown `###` for all subsections.

**Fix:** Use sequential heading levels: H1 → H2 → H3.

---

## Communication Artifacts

### u01 — Collaborative communication leaked into content

Pasting chatbot responses that include conversational scaffolding: "I hope this helps," "Would you like me to...," "Here is a draft for you."

**Words to watch:** *I hope this helps, Of course!, Certainly!, You're absolutely right!, Would you like..., is there anything else, let me know, more detailed breakdown, here is a*

**Fix:** Strip all conversational scaffolding. Content should read as standalone text, not one side of a dialogue.

---

### u02 — Knowledge-cutoff disclaimers

Statements indicating incomplete information due to training data limits or failed web searches. Often paired with speculation about what the missing information "likely" is.

**Words to watch:** *as of [date], as of my last knowledge update, while specific details are limited/scarce..., not widely available/documented/disclosed, based on available information, keeps much of his personal life private*

**Example:**
> While specific details about the town's economy **are not extensively documented in readily available sources**, ...

**Fix:** Delete the disclaimer. If information is unavailable, omit the topic rather than speculating.

---

### u03 — Phrasal templates and placeholder text

Fill-in-the-blank templates left unresolved: `[Entertainer's Name]`, `[Describe the specific section]`, `INSERT_SOURCE_URL`, `PASTE_YOUTUBE_VIDEO_URL_HERE`.

**Fix:** Fill in the blanks or delete the entire passage.

---

## Markup

### m01 — Markdown in non-Markdown contexts

Using `**bold**`, `## Heading`, `[link](url)` in contexts that expect different markup (e.g., wikitext, HTML, or plain text).

**Fix:** Convert to the correct markup language for the target format.

---

### m02 — Broken or hallucinated markup

Generating syntactically invalid code for templates, infoboxes, or formatting constructs that don't exist.

**Fix:** Validate all generated markup against the target system.

---

### m03 — LLM citation artifacts (turn0search, oaicite, contentReference)

Residual internal reference tokens from chatbot interfaces that were not resolved before pasting: `citeturn0search0`, `oaicite:0`, `contentReference[oaicite:0]{index=0}`, `[attached_file:1]`, `grok_card`.

**Fix:** Delete all citation artifacts. Replace with actual references or remove.

---

### m04 — Attribution/index JSON artifacts

JSON-formatted attribution metadata embedded in text: `({"attribution":{"attributableIndex":"1009-1"}})`.

**Fix:** Delete all JSON artifacts. Replace with proper citations.

---

### m05 — Non-existent categories or templates

Hallucinated categories, template names, or template parameters that don't exist in the target system.

**Fix:** Verify all referenced categories and templates exist. Replace with valid equivalents.

---

## Citations

### r01 — Broken external links

Multiple citations with URLs that return 404 errors and were never archived — the URLs were fabricated.

**Fix:** Verify every URL. Remove fabricated links; find real sources or remove the claim.

---

### r02 — Invalid DOIs and ISBNs

Digital Object Identifiers or ISBNs that fail checksum validation or resolve to nothing.

**Fix:** Validate all DOIs and ISBNs. Remove or correct invalid ones.

---

### r03 — DOIs leading to unrelated articles

DOIs that resolve but point to completely different articles than cited.

**Fix:** Follow every DOI link and verify it matches the cited claim.

---

### r04 — Book citations without page numbers

Citing a 500-page book for a specific claim with no page number or URL to a searchable version.

**Fix:** Add page numbers. If unavailable, find a more specific source.

---

### r05 — Incorrect or unconventional citation format

Mangled reference syntax, duplicate reference artifacts, footnote markers like `↩`, or PMID references that point to unrelated articles.

**Fix:** Normalize to the project's citation style. Verify each reference resolves correctly.

---

### r06 — UTM tracking parameters from chatbot interfaces

URLs containing `utm_source=chatgpt.com`, `utm_source=openai`, `utm_source=copilot.com`, or `referrer=grok.com` — proving the URL was retrieved via an AI chatbot.

**Fix:** Strip UTM parameters from all URLs. The presence of these parameters does not invalidate the source itself, only reveals its retrieval method.

---

### r07 — Declared but unused references

References defined in a references section (often as named refs) that are never actually cited in the body text.

**Fix:** Either cite them in the body or remove them from the references section.

---

## Miscellaneous

### x01 — Sudden shift in writing style

An abrupt change in register, grammar quality, or English variety that doesn't match surrounding text or the author's other writing.

**Fix:** Normalize voice and register across the document.

---

### x02 — Verbose edit summaries or commit messages

Unusually long, formal, first-person paragraphs explaining changes in exhaustive detail, often itemizing style guidelines.

**Example:**
> I formalized the tone, clarified technical content, ensured neutrality, and indicated citation needs. Historical narratives were streamlined, allocation details specified with regulatory references...

**Fix:** Write concise summaries. Focus on *what* changed and *why*, not on listing every guideline followed.

---

### x03 — Pre-placed maintenance tags

Documents that arrive with review tags, declined-submission templates, or protection markers already in place — artifacts of the LLM simulating an editorial workflow.

**Fix:** Remove all spurious maintenance tags.

---

## Historical Patterns (pre-2025)

These patterns were common in older LLM output and are less frequent in newer models. Still useful for identifying legacy AI-generated text.

### h01 — Didactic disclaimers

"It's important to note," "It is crucial to remember," "may vary." Older LLMs added safety disclaimers and hedge statements reflexively.

**Fix:** Delete the disclaimer. State the fact or omit it.

---

### h02 — Section summaries and conclusions

Adding "In summary," "In conclusion," or "Overall" sections that restate what was already said.

**Fix:** Delete summary sections. Each section should stand on its own.

---

### h03 — Prompt refusal remnants

"As an AI language model, I cannot..." text that leaked into the output.

**Fix:** Delete entirely.

---

### h04 — Abrupt cutoffs

Text that stops mid-sentence because the LLM hit its token limit.

**Fix:** Complete the thought or delete the fragment.

---

### h05 — Outdated access-date parameters

Citations with access dates that predate the document's creation, reflecting the LLM's training data rather than actual retrieval.

**Fix:** Update access dates to actual retrieval dates, or remove them.

---

## Register note

This taxonomy was first tuned for encyclopedic text. Several codes do not transfer to every register: the citation codes (`r01`–`r07`), the markup codes (`m01`–`m05`), and the wiki-structural codes (`c07`, `c08`, `s09`) rarely fire on an email, a release note, or a blog post. The labeler should apply only the codes that fit the document in front of it. The two-pass machinery and the rest of the codes are register-agnostic.

---

## Quick Reference

| Code | Pattern |
|------|---------|
| c01 | Undue emphasis on significance/legacy/broader trends |
| c02 | Undue emphasis on notability/media coverage |
| c03 | Superficial analyses (participial "-ing" phrases) |
| c04 | Promotional/advertisement-like language |
| c05 | Vague attributions and overgeneralized opinions |
| c06 | Formulaic challenges-and-prospects conclusions |
| c07 | Leads treating titles as proper nouns |
| c08 | Vague see-also/cross-reference sections |
| l01 | AI-vocabulary word clusters |
| l02 | Avoidance of "is"/"are" (copula substitution) |
| l03 | Negative parallelisms ("not just X, but Y") |
| l04 | Rule-of-three padding |
| l05 | Elegant variation (forced synonym cycling) |
| s01 | Title case in headings |
| s02 | Overuse of boldface |
| s03 | Inline-header vertical lists |
| s04 | Emoji in formal prose |
| s05 | Overuse of em dashes |
| s06 | Unnecessary tables |
| s07 | Curly/smart quotation marks (inconsistent) |
| s08 | Subject lines in body text |
| s09 | Skipping heading levels |
| u01 | Collaborative communication artifacts |
| u02 | Knowledge-cutoff disclaimers |
| u03 | Placeholder text / phrasal templates |
| m01 | Markdown in non-Markdown contexts |
| m02 | Broken/hallucinated markup |
| m03 | LLM citation artifacts (turn0search, oaicite) |
| m04 | Attribution/index JSON artifacts |
| m05 | Non-existent categories/templates |
| r01 | Broken (fabricated) external links |
| r02 | Invalid DOIs/ISBNs |
| r03 | DOIs pointing to unrelated articles |
| r04 | Book citations without page numbers |
| r05 | Incorrect/unconventional citation format |
| r06 | UTM tracking parameters from chatbot interfaces |
| r07 | Declared but unused references |
| x01 | Sudden shift in writing style |
| x02 | Verbose edit summaries/commit messages |
| x03 | Pre-placed maintenance tags |
| h01 | Didactic disclaimers ("important to note") |
| h02 | Section summaries/conclusions |
| h03 | Prompt refusal remnants |
| h04 | Abrupt cutoffs |
| h05 | Outdated access-date parameters |
