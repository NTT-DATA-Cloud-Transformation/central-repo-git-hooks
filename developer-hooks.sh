#!/bin/bash

## Pre-commit hook validation script for the developers.

## Variables
HOOK_FILE = "https://github.com/Flux7Labs/central-repo-git-hooks/blob/master/.pre-commit-config.yaml"
ARGS = "--all-files"
PKGS = " pre-commit cfn-lint flake8"

## Pre-commit install and validation
pre-commit install ${PKGS}
pre-commit clean
pre-commit run -c ${HOOK_FILE} ${ARGS}
pre-commit clean

