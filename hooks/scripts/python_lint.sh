#!/usr/bin/env bash

set -e


# Get only staged files 
# - Don't check deleted files
# - only check files with '.py' suffix (convention: reserve '.yml' for ansible)
# - Catch return code for additional output

flake8
