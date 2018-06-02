#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Set Brightness(intel)

Usage:
  sh ${0} + : increment brightness
  sh ${0} - : decrement brightness
  sh ${0} * : usage

EOF:
  cat /sys/class/backlight/intel_backlight/brightness

_EOT_
exit 1
}

case ${1} in
  + | -)
    readonly SYS_FILE="/sys/class/backlight/intel_backlight/brightness"
    readonly STEP="100"
    readonly BRIGHTNESS="$(expr $(cat ${SYS_FILE}) ${1} ${STEP})"
    echo "UPDATE : ${SYS_FILE}"
    sudo tee ${SYS_FILE}<<< ${BRIGHTNESS}
    ;;
  *)
    usage
    ;;
esac
