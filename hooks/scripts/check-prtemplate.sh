#!/bin/bash

## Check for readme.md files in the repository.

count=`find . -type f -iname 'pull_request_template.md' | wc -l`

if [[ ! $count -ge 1 ]]; then
    echo "ERROR: PR Template not found in the repository. Please create one and try again !!"
    echo "Standard Location: .github/pull_request_template.md"
    echo "EX: https://github.com/NTT-DATA-Cloud-Transformation/ansible-role-nginx/blob/master/.github/pull_request_template.md"
    exit 1
else
    exit 0
fi

