#!/bin/bash

echo "${0} ..."

### FUNCTION ###
function mkdir_confdir() {
# Make Directory
# general
mkdir -pvm 700 ~/Downloads ~/Pictures ~/Screenshots
mkdir -pvm 700 ~/.config ~/.local/share/applications
# anthy,xmonad,uim
mkdir -pvm 700 ~/.uim.d ~/.anthy ~/.xmonad 
}

function ln_dotfiles() {
# Deploy(symbolic link) - "~/dotfiles/.??*"
cd ~/dotfiles
for dotfile in .??*
do
  [ "${dotfile}" = ".git"    ] && continue
  [ "${dotfile}" = ".github" ] && continue
  [ "${dotfile}" = ".xmonad" ] && continue
  [ "${dotfile}" = ".loacal" ] && continue
  [ "${dotfile}" = ".config" ] && continue
  [ "${dotfile}" = ".uim.d"  ] && continue
  [ "${dotfile}" = ".anthy"  ] && continue

  ln -snfv ~/dotfiles/${dotfile} ~/
done
}

function ln_otherfiles() {
# Deploy(symbolic link) - "Not ~/dotfiles/.??*"
cd ~/dotfiles/bin/install/archlinux
for lnlist in $(grep -v -e '^$' -e '^#' ./list/ln.txt)
do
  ln -snfv ~/dotfiles/${lnlist} ~/${lnlist}
done
}

### RUN ###
mkdir_confdir 
ln_dotfiles
ln_otherfiles

# End Message
cat ./complete.txt
