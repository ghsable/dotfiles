#!/bin/bash

echo "${0} ..."

# --- cd Dotfiles-Directory
cd $(dirname ${0})

function ln_dotfiles() {
# --- Deploy(symbolic link) : "./.??*"
for DOT_FILE in .??*
do
  [ "${DOT_FILE}" = ".git"      ] && continue
  [ "${DOT_FILE}" = ".github"   ] && continue
  [ "${DOT_FILE}" = ".DS_Store" ] && continue

  ln -snfv ~/dotfiles/bin/install_macos/${DOT_FILE} ~/
done
}

function ln_notdotfiles() {
# --- Deploy(symbolic link) : "Not ./.??*"
for NOTDOT_FILE in $(grep -v -e '^$' -e '^#' ./ln.txt)
do
  ln -snfv ~/dotfiles/${NOTDOT_FILE} ~/${NOTDOT_FILE}
done
}

ln_dotfiles
ln_notdotfiles

echo '---------------------------------------->>(EOF)'
