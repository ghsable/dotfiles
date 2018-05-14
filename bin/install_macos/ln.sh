#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

### FUNCTION ###
function ln_dotfiles() {
# Deploy(symbolic link) : "./.??*"
for dotfile in .??*
do
  [ "${dotfile}" = ".git"      ] && continue
  [ "${dotfile}" = ".github"   ] && continue
  [ "${dotfile}" = ".DS_Store" ] && continue

  ln -snfv ~/dotfiles/bin/install_macos/${dotfile} ~/
done
}

function ln_notdotfiles() {
# Deploy(symbolic link) : "Not ./.??*"
for notdotfile in $(grep -v -e '^$' -e '^#' ./ln.txt)
do
  ln -snfv ~/dotfiles/${notdotfile} ~/${notdotfile}
done
}

### RUN ###
ln_dotfiles
ln_notdotfiles

echo '---------------------------------------->>(EOF)'
