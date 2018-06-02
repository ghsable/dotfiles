#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET brightness(intel)

Usage:
  sh ${0} + : INCREMENT brightness
  sh ${0} - : DECREMENT brightness
  sh ${0} * : USAGE

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
