#!/usr/bin/env bash

set -e

STAGED=`git diff --name-only --cached`

for file in "$STAGED"; do
  # This check could be a little more robust I think
  if [[ "$file_with_path" == "packer.json" ]]; then

    packer validate $file || rc=$?
    # fail on first failed template
    if ! $rc ; then
      exit
    fi
  fi

done
