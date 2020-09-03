#!/bin/bash

AUTHOR_EMAIL=$(git config user.email)
DOMAIN=$1

if [[ $AUTHOR_EMAIL == *"${DOMAIN}"* ]];
then
  echo "correct email configured"
  exit 0
else
  echo "######################################################"
  echo "Author email configured is not a $DOMAIN email"
  echo " run:"
  echo "     git config user.email ****$DOMAIN "
  echo "or"
  echo "     git config --global user.email *****$DOMAIN "
  echo "Then try commiting again"
  echo "######################################################"
  exit 1
fi;
