#!/usr/bin/env bash

BRANCHES=$(git branch --all)

while read -r BRANCH; do

  echo "- Merge & delete: ${BRANCH}"
  git merge "$BRANCH"
  git branch -d "$BRANCH"

done <<< $BRANCHES
