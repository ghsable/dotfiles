#!/bin/bash

echo "${0} ..."

### FUNCTION ###
function mkdir_basedir() {
# Make Directory
mkdir -pv ~/data
mkdir -pv ~/.config ~/.local/share/applications ~/.uim.d ~/.anthy ~/.xmonad
}

function ln_dotfiles() {
# Deploy(symbolic link) : "~/dotfiles/.??*"
cd ~/dotfiles
for dotfile in .??*
do
  [ "${dotfile}" = ".git"    ] && continue
  [ "${dotfile}" = ".github" ] && continue
  [ "${dotfile}" = ".xmonad" ] && continue
  [ "${dotfile}" = ".local"  ] && continue
  [ "${dotfile}" = ".config" ] && continue
  [ "${dotfile}" = ".uim.d"  ] && continue
  [ "${dotfile}" = ".anthy"  ] && continue

  ln -snfv ~/dotfiles/${dotfile} ~/
done
}

function ln_notdotfiles() {
# Deploy(symbolic link) : "Not ~/dotfiles/.??*"
cd ~/dotfiles/bin/install_archlinux
for notdotfile in $(grep -v -e '^$' -e '^#' ./ln.txt)
do
  ln -snfv ~/dotfiles/${notdotfile} ~/${notdotfile}
done
}

### RUN ###
mkdir_basedir 
ln_dotfiles
ln_notdotfiles

echo '---------------------------------------->>(EOF)'
