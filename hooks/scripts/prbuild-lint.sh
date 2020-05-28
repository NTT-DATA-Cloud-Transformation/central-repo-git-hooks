#!/usr/bin/env bash

set -e


# Get only staged files 
# - Don't check deleted files
# - only check files with '.yaml' suffix (convention: reserve '.yml' for ansible)
# - Use CF_CHECK to determine if actually a CloudFormation Template
# - Catch return code for additional output

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
