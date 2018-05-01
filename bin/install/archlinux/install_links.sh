#!/bin/bash

mkdir -pvm 700 ~/.anthy ~/.xmonad ~/.config ~/.local/share/applications
mkdir -pvm 700 ~/Downloads ~/Pictures ~/Screenshots
mkdir -pvm 700 ~/Develop/java ~/Develop/cs

echo "${0} ..."

cd ~/dotfiles

# Deploy(symbolic link) - "./.??*"
for dotfile in .??*
do
  [ "${dotfile}" = ".xmonad" ] && continue
  [ "${dotfile}" = ".loacal" ] && continue
  [ "${dotfile}" = ".config" ] && continue
  [ "${dotfile}" = ".uim.d"  ] && continue
  [ "${dotfile}" = ".anthy"  ] && continue

  ln -snfv ~/dotfiles/${dotfile} ~/
done

cd $(dirname ${0})

# Deploy(symbolic link) - "Not ./.??*"
for lnlist in $(grep -v -e '^$' -e '^#' ./list/ln.txt)
do
  ln -snfv ~/dotfiles/${lnlist} ~/
done


${CMND02} ${PATH01_0}${PATH01_2}.uim.d/                    ${PATH03}                            &&  #Uim
${CMND02} ${PATH01_0}${PATH01_2}imported_words_default.d/  ${PATH03}.anthy/                     &&  #Anthy(cannadic)
