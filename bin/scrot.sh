#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SCREENSHOT

Usage:
  sh ${0}    : SCREENSHOT desktop
  sh ${0} -u : SCREENSHOT focus window
  sh ${0} -s : SCREENSHOT select size
  sh ${0} *  : USAGE

_EOT_
exit 1
}

case ${1} in
  "" | -u | -s)
    readonly SLEEP_SEC="0.5"
    readonly SCREENSHOT_FILENAME=~/Screenshots/%m%d_%H%M%S.png
    sleep ${SLEEP_SEC}
    scrot ${1} ${SCREENSHOT_FILENAME}
    ;;
  *)
    usage
    ;;
esac
