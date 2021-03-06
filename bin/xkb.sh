#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET XKB(X Keyboard extension)

Flow:
  1. startx
  2. sh ${0} make
  3. sh ${0} load

Usage:
  sh ${0} make    : CREATE "~/.xkbmap"
  sh ${0} load    : LOAD   "~/.xkbmap"
  sh ${0} map_jp  : MAPPING [jp] keyboad Layout
  sh ${0} map_us  : MAPPING [us] keyboad Layout
  sh ${0} *       : USAGE

EOF:
  setxkbmap -print -verbose 10

_EOT_
exit 1
}

case ${1} in
  make)
    xkbcomp -xkb ${DISPLAY} ~/.xkbmap
    ;;
  load)
    xkbcomp -w 0 ~/.xkbmap ${DISPLAY}
    ;;
  map_jp)
    setxkbmap -layout jp
    ;;
  map_us)
    setxkbmap -layout us
    ;;
  *)
    usage
    ;;
esac
