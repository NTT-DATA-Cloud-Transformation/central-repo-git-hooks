#!/usr/bin/env bash

set -e


# Get all the files
# This hook is only required by a PR build and not required to be used by developers
# - only check files with '.yaml' suffix (convention: reserve '.yml' for ansible)
# - Use CF_CHECK to determine if actually a CloudFormation Template

CF_CHECK='AWSTemplateFormatVersion'
current_commit=$(git rev-parse HEAD)
templates=($(git ls-tree -r ${current_commit} --name-only | xargs grep -l $CF_CHECK))

[[ -z ${templates[@]} ]] && exit 0

cfn-lint ${templates[@]} || cfnlint_exit=$?

if [ -z ${cfnlint_exit} ] ; then
  echo "✓ cfn-lint passed"
else
  echo "✘ cfn-lint failed!" 1>&2
  exit ${cfnlint_exit}
fi
