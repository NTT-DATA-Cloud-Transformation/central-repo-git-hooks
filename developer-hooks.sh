#!/bin/bash

## Pre-commit hook validation script for the developers.

## Variables
HOOK_FILE="https://raw.githubusercontent.com/Flux7Labs/central-repo-git-hooks/blob/master/.pre-commit-config.yaml"
ARGS="--all-files"
PKGS=" pre-commit cfn-lint flake8"

## Validate the HOOK_FILE ResponseCode.
RESP_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" ${HOOK_FILE})

if ${RESP_CODE} == 200; then
    ## Pre-commit install and validation
    pip install ${PKGS}
    pre-commit install
    pre-commit clean
    pre-commit run -c ${HOOK_FILE} ${ARGS}
    pre-commit clean
else
    echo "Unable to download ${HOOK_FILE}. Exiting.."
fi
