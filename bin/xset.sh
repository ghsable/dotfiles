#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Set DPMS(Display Power Management Signaling)

Usage:
  sh ${0} on <sec> : ON  screen saver + Set timeout
  sh ${0} off      : OFF screen saver
  sh ${0} suspend  : SUSPEND -> LOCK screen
  sh ${0} *        : usage

EOF:
  xset q

_EOT_
exit 1
}

case ${1} in
  on | off)
    xset s ${1}
    xset s ${2} ${2}
    ;;
  suspend)
    xset dpms force ${1}
    slock
    ;;
  *)
    usage
    ;;
esac
