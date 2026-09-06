#!/usr/bin/env bash

sort_word () {
  echo "${1,,}" | sed "s/./\n&/g" | sort | tr -d '\n'
}

LOWER=${1,,}
SORTED=$(sort_word "$1")
WORDS=$(echo "$2" | sed "s/ /\n/g")

for CURR in $2; do
  if [[ "$LOWER" != "${CURR,,}" && "$SORTED" == "$(sort_word "$CURR")" ]]; then
    ANAGRAMS+="$CURR "
  fi
done

echo "${ANAGRAMS::-1}"
