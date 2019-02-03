#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Smart Card Command

Usage:
  sh ${0} pcsc_scan : SCAN  Smart_Card
  sh ${0} *         : USAGE

_EOT_
exit 1
}

case ${1} in
  pcsc_scan)
    ${1}
    ;;
  *)
    usage
    ;;
esac
