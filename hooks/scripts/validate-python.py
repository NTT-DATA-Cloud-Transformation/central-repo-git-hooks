#!/usr/bin/env bash

set -e


# Get only staged files 
# - Don't check deleted files
# - only check files with '.yaml' suffix (convention: reserve '.yml' for ansible)
# - Use CF_CHECK to determine if actually a CloudFormation Template
# - Catch return code for additional output

current_commit=$(git rev-parse HEAD)
templates=($(git ls-tree -r ${current_commit} --name-only))

[[ -z ${templates[@]} ]] && exit 0

flake8 ${templates[@]} || flake8_exit=$?

if [ -z ${flake8_exit} ] ; then
  echo "✓ flake8 passed"
else
  echo "✘ flake8 failed!" 1>&2
  exit ${flake8_exit}
fi