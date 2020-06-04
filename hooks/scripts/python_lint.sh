#!/usr/bin/env bash

set -e


# Get only staged files 
# - Don't check deleted files
# - only check files with '.py' suffix (convention: reserve '.yml' for ansible)
# - Catch return code for additional output

current_commit=$(git rev-parse HEAD)

if [ "$1" == "prbuild" ] ; then
	templates=($(git ls-tree -r ${current_commit} --name-only))
else
	templates=(
		$(git diff --diff-filter=d --name-only --cached -- '*.py')
	)
fi


[[ -z ${templates[@]} ]] && exit 0

flake8 ${templates[@]} || flake8_exit=$?

if [ -z ${flake8_exit} ] ; then
  echo "✓ flake8 passed"
else
  echo "✘ flake8 failed!" 1>&2
  exit ${flake8_exit}
fi
