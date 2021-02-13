#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET Xmodmap

Usage:
  sh ${0} make_jp : CREATE [jp] "~/.Xmodmap"
  sh ${0} make_us : CREATE [us] "~/.Xmodmap"
  sh ${0} load    : LOAD   "~/.Xmodmap"
  sh ${0} *       : USAGE

EOF:
  cat ~/.Xmodmap

_EOT_
exit 1
}

function add_config_jp() {
cat<< _EOT_
!!!!!!!!!!!!!!!!!!!! THIS CONFIG !!!!!!!!!!!!!!!!!!!!
!!! HHKB PRO-JP
keysym Muhenkan = Hangul_Hanja
keysym Henkan_Mode = Hangul
keysym Zenkaku_Hankaku = Control_L
keysym Hiragana_Katakana = Super_R

!!! ThinkPad
remove Lock = Eisu_toggle
keysym Eisu_toggle = Control_L

!!! Xmonad
!clear Shift
!clear Lock
clear Control
!clear Mod1
!clear Mod2
!clear Mod3
clear Mod4
!clear Mod5
!add Shift = Shift_L Shift_R
!add Lock = Num_Lock
add Control = Super_L Super_R
!add Mod1 = Alt_L Alt_R
!add Mod2 = Mode_switch
!add Mod3 =
add Mod4 = Control_L
!add Mod5 =
_EOT_
return 0
}

function add_config_us() {
cat<< _EOT_
!!!!!!!!!!!!!!!!!!!! THIS CONFIG !!!!!!!!!!!!!!!!!!!!
!!! Realforce
remove Lock = Caps_Lock
keysym Caps_Lock = Control_L

!!! Xmonad
!clear Shift
!clear Lock
clear Control
!clear Mod1
!clear Mod2
!clear Mod3
clear Mod4
!clear Mod5
!add Shift = Shift_L Shift_R
!add Lock = Num_Lock
add Control = Super_L Super_R
!add Mod1 = Alt_L Alt_R
!add Mod2 = Mode_switch
!add Mod3 =
add Mod4 = Control_L
!add Mod5 =
_EOT_
return 0
}

case ${1} in
  make_jp)
    xmodmap -pke >~/.Xmodmap
    add_config_jp >>~/.Xmodmap
    ;;
  make_us)
    xmodmap -pke >~/.Xmodmap
    add_config_us >>~/.Xmodmap
    ;;
  load)
    xmodmap ~/.Xmodmap
    ;;
  *)
    usage
    ;;
esac
