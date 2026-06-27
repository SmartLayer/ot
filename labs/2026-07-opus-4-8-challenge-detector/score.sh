#!/usr/bin/env bash
# Reproduce the challenge-detector regex scoring against the labelled corpus.
# Run from this directory (reads positives.txt / negatives.txt beside it).
# Re-run a year later, or with a new model's data, by replacing the two corpora
# and running this unchanged: the regex set and the arithmetic are fixed here.
cd "$(dirname "$0")"
P=positives.txt; N=negatives.txt
np=$(grep -c . "$P"); nn=$(grep -c . "$N")

# --- SHIPPED set (live in the hook) ---
declare -A R
R[definite_cause]='the (reason|cause|culprit|problem|answer|diagnosis|explanation|fix|tell) (is|was)|is the (reason|cause|culprit|problem|answer|diagnosis)'
R[confident_absence]='no (such|public|server|native|other|usable|team|hsm|cash|inbox|trace|rebase|web)|there (is|are) no |does.?t exist|not (on|in|present|externally|built|documented|needed)|nothing (breaks|exists)'
R[dichotomy_not]=', not (a|an|the|just|merely|add)|is a real'
R[modal_must]='must be|has to be|have to be|had to be|can only be|cannot|can.?t |would (conflict|break|fail|be a no-op)'
R[causal_so]='[,;] so (it|that|this|the|i)\b'
R[certainty_adverb]='clearly|obviously|evidently|undoubtedly|certainly|definitely|unambiguously|of course|in fact|actually'
R[proof_verb]='proves|confirms|confirming|demonstrates|shows that'
SHIPPED="definite_cause confident_absence dichotomy_not modal_must causal_so certainty_adverb proof_verb"

# --- REJECTED candidate (documented, NOT live) ---
REJ_unsourced_number='~ ?[0-9$£]|approximately [0-9]|roughly [0-9]|[0-9][0-9,]*[–-][0-9][0-9,]*|[0-9]+%|[0-9]{3,}'

pct(){ awk "BEGIN{printf \"%.0f\", $1*100/$2}"; }
printf '%-18s %8s %7s\n' "regex" "recall" "FP%"
for k in $SHIPPED; do
  printf '%-18s %3d/%-3d %5s%%\n' "$k" "$(grep -icE "${R[$k]}" "$P")" "$np" "$(pct "$(grep -icE "${R[$k]}" "$N")" "$nn")"
done
printf '%-18s %3d/%-3d %5s%%   (REJECTED, not live)\n' "unsourced_number" "$(grep -icE "$REJ_unsourced_number" "$P")" "$np" "$(pct "$(grep -icE "$REJ_unsourced_number" "$N")" "$nn")"

ALL_SHIPPED=$(for k in $SHIPPED; do printf '%s|' "${R[$k]}"; done | sed 's/|$//')
WITH_NUM="${ALL_SHIPPED}|${REJ_unsourced_number}"
echo "---"
echo "SHIPPED (7 regexes):        recall $(grep -icE "$ALL_SHIPPED" "$P")/$np ($(pct "$(grep -icE "$ALL_SHIPPED" "$P")" "$np")%)   FP $(grep -icE "$ALL_SHIPPED" "$N")/$nn ($(pct "$(grep -icE "$ALL_SHIPPED" "$N")" "$nn")%)"
echo "+ unsourced_number:         recall $(grep -icE "$WITH_NUM" "$P")/$np ($(pct "$(grep -icE "$WITH_NUM" "$P")" "$np")%)   FP $(grep -icE "$WITH_NUM" "$N")/$nn ($(pct "$(grep -icE "$WITH_NUM" "$N")" "$nn")%)"

if [ "$1" = "--per-line" ]; then
  echo "--- per positive: matched_by ---"
  while IFS= read -r line; do
    hits=""
    for k in $SHIPPED; do echo "$line" | grep -qiE "${R[$k]}" && hits="${hits:+$hits,}$k"; done
    echo "$line" | grep -qiE "$REJ_unsourced_number" && hits="${hits:+$hits,}unsourced_number*"
    printf '%s\t%s\n' "${hits:-NONE}" "$line"
  done < "$P"
fi
