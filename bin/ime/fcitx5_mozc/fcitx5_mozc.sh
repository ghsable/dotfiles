#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET Fcitx5/Mozc

Usage:
  sh ${0} fcitx5_a : OPEN  Fcitx(config_dialog)
  sh ${0} mozc_a   : OPEN  Mozc(config_dialog)
  sh ${0} mozc_b   : OPEN  Mozc(dictionary_tool)
  sh ${0} mozc_c   : OPEN  Mozc(word_register_dialog)
  sh ${0} mozc_d   : OPEN  Mozc(hand_writing)
  sh ${0} mozc_e   : OPEN  Mozc(character_palette)
  sh ${0} *        : USAGE

EOF:
  cd ~/.config/fcitx5

_EOT_
exit 1
}

case ${1} in
  fcitx5_a)
    fcitx5-configtool
    ;;
  mozc_a)
    /usr/lib/mozc/mozc_tool --mode=config_dialog
    ;;
  mozc_b)
    /usr/lib/mozc/mozc_tool --mode=dictionary_tool
    ;;
  mozc_c)
    /usr/lib/mozc/mozc_tool --mode=word_register_dialog
    ;;
  mozc_d)
    /usr/lib/mozc/mozc_tool --mode=hand_writing
    ;;
  mozc_e)
    /usr/lib/mozc/mozc_tool --mode=character_palette
    ;;
  *)
    usage
    ;;
esac
