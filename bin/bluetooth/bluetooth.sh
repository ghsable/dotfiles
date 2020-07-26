#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Bluetooth Commands

Usage:
  sh ${0} bluetoothctl : SETTING Bluetooth(CUI)
  sh ${0} blueberry    : SETTING Bluetooth(GUI)
  sh ${0} *            : USAGE

_EOT_
exit 1
}

case ${1} in
  bluetoothctl | blueberry)
    ${1}
    ;;
  *)
    usage
    ;;
esac
