#!/bin/bash

AUTHOR_EMAIL=`git config user.email`
echo $AUTHOR_EMAIL
DOMAIN=$1
echo "Domain = $DOMAIN"

if [[ $DOMAIN = "" ]]; then
  DOMAIN="@flux7.com"
fi

if [[ $AUTHOR_EMAIL == *"${DOMAIN}"* ]];
then
  echo "correct email configured"
  echo "Author Email = $AUTHOR_EMAIL, Domain = $DOMAIN"
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
