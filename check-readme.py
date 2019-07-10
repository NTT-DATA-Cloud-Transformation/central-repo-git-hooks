#!/usr/bin/env python
import os, fnmatch
def find(pattern, path):
    result = []
    for root, dirs, files in os.walk(path):
        for name in files:
            if fnmatch.fnmatch(name.lower(), pattern.lower()):
                result.append(os.path.join(root, name))
    print result
    return result

dir_path = os.path.dirname(os.path.realpath(__file__))
find('README.MD', dir_path)

