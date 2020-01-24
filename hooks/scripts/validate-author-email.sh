#!/bin/bash

AUTHORINFO=$(git var GIT_AUTHOR_IDENT) || exit 1
AUTHOR_EMAIL=$(printf '%s\n\n' "${AUTHORINFO}" | sed -n 's/^.* <\(.*\)> .*$/\1/p')
DOMAIN="@flux7.com"

if [[ $AUTHOR_EMAIL == *"${DOMAIN}"* ]];
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
