#!/usr/bin/env bash

sort_word () {
  local WORD="$1"
  echo "${WORD,,}" | sed "s/./\n&/g" | sort | tr -d '\n'
}

ORIGINAL_LOWER=${1,,}
SORTED=$(sort_word "$1")
WORDS=$(echo "$2" | sed "s/ /\n/g")

while read WORD; do
  if [[ "$ORIGINAL_LOWER" != "${WORD,,}" && "$SORTED" == "$(sort_word "$WORD")" ]]; then
    ANAGRAMS+="$WORD "
  fi
done <<< "$WORDS"

if [[ -n "$ANAGRAMS" ]]; then
  echo "${ANAGRAMS::-1}"
fi
