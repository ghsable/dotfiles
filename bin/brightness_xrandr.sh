#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Set Brightness(xrandr)

Usage:
  sh ${0} 0.[1-9] : set brightness

_EOT_
exit 1
}

case ${1} in
  0\.[1-9])
    readonly DISPLAY_NAME=`xrandr --query | grep -e " connected" | cut -d " " -f 1-1`
    xrandr --output ${DISPLAY_NAME} --brightness ${1}
    ;;
  *)
    usage
    ;;
esac
