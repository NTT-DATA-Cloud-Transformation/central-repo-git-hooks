#!/bin/bash

AUTHOR_EMAIL=`git config user.email`

if [[ $AUTHOR_EMAIL == *"@flux7.com"* ]];
then
  echo "correct email configured"
  exit 0
else
  echo "######################################################"
  echo "Author email configured is not a flux7 email"
  echo " run:"
  echo '     git config user.email "****@flux7.com"'
  echo "or"
  echo '     git config --global user.email "*****@flux7.com"'
  echo "Then try commiting again"
  echo "######################################################"
  exit 1
fi;