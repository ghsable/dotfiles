#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Picom is a standalone compositor for Xorg.

Usage:
  sh ${0} on  : ON  Darkmode
  sh ${0} off : OFF Darkmode
  sh ${0} *   : USAGE

_EOT_
exit 1
}

case ${1} in
  on)
    {
    killall picom
    picom -CGb -D 0 --invert-color-include '!class_g="URxvt" && !class_g="XTerm"'
    } >/dev/null 2>&1
    ;;
  off)
    {
    killall picom
    picom -CGb -D 0
    } >/dev/null 2>&1
    ;;
  *)
    usage
    ;;
esac
