#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Set Xmodmap

Usage:
  sh ${0} make : CREATE "~/.Xmodmap"
  sh ${0} load : LOAD   "~/.Xmodmap"
  sh ${0} *    : usage

EOF:
  cat ~/.Xmodmap

_EOT_
exit 1
}

function add_config() {
cat<< _EOT_
!!!!!!!!!!!!!!!!!!!! THIS CONFIG !!!!!!!!!!!!!!!!!!!!
!clear Shift
clear Lock
clear Control
!clear Mod1
!clear Mod2
!clear Mod3
clear Mod4
!clear Mod5
!add Shift = Shift_L Shift_R
!add Lock = Caps_Lock
add Control = Super_L Super_R
!add Mod1 = Alt_L Alt_R
!add Mod2 = Mode_switch
!add Mod3 =
add Mod4 = Control_L Control_R
!add Mod5 =
_EOT_
return 0
}

case ${1} in
  make)
    xmodmap -pke >~/.Xmodmap
    add_config >>~/.Xmodmap
    ;;
  load)
    xmodmap ~/.Xmodmap
    ;;
  *)
    usage
    ;;
esac
