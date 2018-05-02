#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# Deploy(symbolic link) - "./.??*"
for dotfile in .??*
do
  [ "${dotfile}" = ".DS_Store" ] && continue

  ln -snfv ~/dotfiles/bin/install/macos/${dotfile} ~/
done

# Deploy(symbolic link) - "Not ./.??*"
for lnlist in $(grep -v -e '^$' -e '^#' ./list/ln.txt)
do
  ln -snfv ~/dotfiles/${lnlist} ~/
done

# End Message
cat ./complete.txt
