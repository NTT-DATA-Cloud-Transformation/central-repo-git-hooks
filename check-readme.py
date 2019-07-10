#!/usr/bin/env python
import os, sys, fnmatch
def find(pattern, path):
    result = []
    for root, dirs, files in os.walk(path):
        for name in files:
            if fnmatch.fnmatch(name.lower(), pattern.lower()):
                result.append(os.path.join(root, name))
    return len(result)

dir_path = os.path.dirname(os.path.realpath(__file__))
count = find('README.MD', dir_path)

if not count >=1:
    print("ERROR: Readme file not found. Please add readme file and try again !!")
    sys.exit(1)

