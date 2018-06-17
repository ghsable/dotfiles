#!/bin/bash

readonly SCREENSHOT_DIR=~/Screenshot
[ -d ${SCREENSHOT_DIR} ] || mkdir -pv ${SCREENSHOT_DIR}

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
    readonly SCREENSHOT_FILENAME=${SCREENSHOT_DIR}/%m%d_%H%M%S.png
    readonly SLEEP_SEC="0.5"
    sleep ${SLEEP_SEC}
    scrot ${1} ${SCREENSHOT_FILENAME}
    echo "SCREENSHOT : ${SCREENSHOT_DIR}/*.png"
    ;;
  *)
    usage
    ;;
esac
