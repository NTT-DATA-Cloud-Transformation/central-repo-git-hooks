#!/bin/bash

## Check for print keyword used for logging in the repository.

count=`grep -r "print" . | wc -l`

if [[ ! $count -ge 1 ]]; then
    echo "ERROR: print statement found in the repository. Please use custom_logger or python logging module and try again !!"
    exit 1
else
    exit 0
fi
