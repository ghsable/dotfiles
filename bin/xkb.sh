#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  Set XKB(X Keyboard extension)

Flow:
  1. startx
  2. sh ${0} make
  3. sh ${0} load

Usage:
  sh ${0} make : CREATE "~/.xkb/xkbmap"
  sh ${0} load : LOAD   "~/.xkb/xkbmap"
  sh ${0} help : this script usage

EOF:
  setxkbmap -print -verbose 10

_EOT_
}

if [ "${1}" = "make" ]; then
   mkdir -pv ~/.xkb
   xkbcomp -xkb $DISPLAY ~/.xkb/xkbmap
   :
elif [ "${1}" = "load" ]; then
   xkbcomp -w 0 ~/.xkb/xkbmap $DISPLAY 
   :
elif [ "${1}" = "help" ]; then
   usage
   :
else
   echo -e 'ERROR!!\n'
   usage
fi
