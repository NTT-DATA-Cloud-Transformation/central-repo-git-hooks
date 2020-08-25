#!/bin/bash

## Pre-commit hook validation script for the developers.


## Variables
HOOK_FILE_URL="https://raw.githubusercontent.com/Flux7Labs/central-repo-git-hooks/master/.pre-commit-config.yaml"
ARGS="--all-files"
PKGS="pre-commit cfn-lint flake8 checkov"
BASEDIR="/tmp/hooks"
HOOK_FILE="${BASEDIR}/hookfile"

# create directory to store hook file temporarily
mkdir -p ${BASEDIR}

# cURL to fetch the hook file
curl ${HOOK_FILE_URL} > ${HOOK_FILE}


if [[ -s ${HOOK_FILE} ]]; then
    pip3 install $PKGS
    pre-commit install
    pre-commit clean
    pre-commit run -c ${HOOK_FILE} ${ARGS}
    pre-commit clean
    rm -f ${HOOK_FILE}
else
    echo "Unable to download ${HOOK_FILE_URL}. Exiting.."
fi
