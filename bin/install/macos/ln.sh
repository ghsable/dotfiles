#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

### FUNCTION ###
function ln_dotfiles() {
# Deploy(symbolic link) - "./.??*"
for dotfile in .??*
do
  [ "${dotfile}" = ".git"      ] && continue
  [ "${dotfile}" = ".github"   ] && continue
  [ "${dotfile}" = ".DS_Store" ] && continue

  ln -snfv ~/dotfiles/bin/install/macos/${dotfile} ~/
done
}

function ln_otherfiles() {
# Deploy(symbolic link) - "Not ./.??*"
for lnlist in $(grep -v -e '^$' -e '^#' ./list/ln.txt)
do
  ln -snfv ~/dotfiles/${lnlist} ~/${lnlist}
done
}

### RUN ###
ln_dotfiles
ln_otherfiles

# End Message
cat ./complete.txt
