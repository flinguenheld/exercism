#!/usr/bin/env bash

sort_word () {
  local word="$1"
  echo "$word" | sed "s/./\n&/g" | sort | tr -d '\n'
}

BASE=$(sort_word "$1")
WORDS=$(echo "$2" | sed "s/ /\n/g")

echo "$WORDS" | while read WORD; do
  if [[ "$BASE" == "$(sort_word "$WORD")" ]]; then
    echo $WORD
  fi
done
