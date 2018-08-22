#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET DPMS(Display Power Management Signaling)

Usage:
  sh ${0} on <sec> : ON  screen saver + Set timeout
  sh ${0} off      : OFF screen saver
  sh ${0} suspend  : SUSPEND -> LOCK screen
  sh ${0} *        : USAGE

EOF:
  xset q

_EOT_
exit 1
}

case ${1} in
  on)
    readonly STANDBY_SEC="${2}"
    readonly SUSPEND_SEC=`expr ${2} "*" 2`
    readonly POWEROFF_SEC=`expr ${2} "*" 3`
    xset dpms ${STANDBY_SEC} ${SUSPEND_SEC} ${POWEROFF_SEC}
    ;;
  off)
    xset dpms 0 0 0
    ;;
  suspend)
    sleep 1 && xset dpms force suspend
    slock
    ;;
  *)
    usage
    ;;
esac
