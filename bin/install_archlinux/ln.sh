#!/bin/bash

echo "${0} ..."

function mkdir_basedir() {
# Make Directory
mkdir -pv ~/.Trash ~/.config/fcitx ~/.local/share/applications ~/.xmonad

#################### NOT USING ####################
#mkdir -pv ~/.uim.d ~/.anthy
}

function ln_dotfiles() {
# Deploy(symbolic link) : "~/dotfiles/.??*"
cd ~/dotfiles
for DOT_FILE in .??*
do
  [ "${DOT_FILE}" = ".git"    ] && continue
  [ "${DOT_FILE}" = ".github" ] && continue
  [ "${DOT_FILE}" = ".xmonad" ] && continue
  [ "${DOT_FILE}" = ".local"  ] && continue
  [ "${DOT_FILE}" = ".config" ] && continue
  [ "${DOT_FILE}" = ".uim.d"  ] && continue
  [ "${DOT_FILE}" = ".anthy"  ] && continue

  ln -snfv ~/dotfiles/${DOT_FILE} ~/
done
}

function ln_notdotfiles() {
# Deploy(symbolic link) : "Not ~/dotfiles/.??*"
cd ~/dotfiles/bin/install_archlinux
for NOTDOT_FILE in $(grep -v -e '^$' -e '^#' ./ln.txt)
do
  ln -snfv ~/dotfiles/${NOTDOT_FILE} ~/${NOTDOT_FILE}
done
}

mkdir_basedir 
ln_dotfiles
ln_notdotfiles

echo '---------------------------------------->>(EOF)'
