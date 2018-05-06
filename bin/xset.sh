#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  Set DPMS(Display Power Management Signaling)

Usage:
  sh ${0} on <sec> : ON  screen saver + Set timeout
  sh ${0} off      : OFF screen saver
  sh ${0} suspend  : SUSPEND -> LOCK screen
  sh ${0} help     : this script usage

EOF:
  xset q

_EOT_
}

if [ "${1}" = "on" ]; then
   readonly TIMEOUT_SEC=${2}
   xset s on
   xset s ${TIMEOUT_SEC} ${TIMEOUT_SEC}
   :
elif [ "${1}" = "off" ]; then
   xset s off
   :
elif [ "${1}" = "suspend" ]; then
   xset dpms force suspend
   slock
   :
elif [ "${1}" = "help" ]; then
   usage
   :
else
   echo -e 'ERROR!!\n'
   usage
   :
fi
