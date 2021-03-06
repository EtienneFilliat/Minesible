#!/bin/sh

if [ -f vault_passwd.clear ]; then
  cat vault_passwd.clear
elif [ -f vault_passwd.gpg ]; then
  gpg --decrypt vault_passwd.gpg 2>/dev/null
else
  read -s -p "Password: " password
  echo $password
fi
