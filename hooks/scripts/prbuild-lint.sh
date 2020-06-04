#!/usr/bin/env bash

set -e


# Get all the files
# This hook is only required by a PR build and not required to be used by developers
# - only check files with '.yaml' suffix (convention: reserve '.yml' for ansible)
# - Use CF_CHECK to determine if actually a CloudFormation Template

./cfn_lint.sh prbuild
