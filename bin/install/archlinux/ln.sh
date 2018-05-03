#!/bin/bash

echo "${0} ..."

# Make Directory
# general
mkdir -pvm 700 ~/.config ~/.local/share/applications
mkdir -pvm 700 ~/Downloads ~/Pictures ~/Screenshots
# anthy,xmonad,uim
mkdir -pvm 700 ~/.anthy ~/.xmonad ~/.uim.d

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

# Deploy(symbolic link) - "Not ~/dotfiles/.??*"
cd ~/dotfiles/bin/install/archlinux
for lnlist in $(grep -v -e '^$' -e '^#' ./list/ln.txt)
do
  ln -snfv ~/dotfiles/${lnlist} ~/${lnlist}
done

# End Message
cat ./complete.txt
