#!/bin/bash

## Check for readme.md files in the repository.

count=`find . -type f -iname 'readme.md' | wc -l`

if [[ ! $count -ge 1 ]]; then
    echo "ERROR: ReadMe.md not found in the repository. Please create one and try again !!"
    exit 1
else
    exit 0
fi

