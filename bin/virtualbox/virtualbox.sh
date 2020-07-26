#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  VirtualBox Commands

Usage:
  sh ${0} virtualbox : START VirtualBox
  sh ${0} *          : USAGE

_EOT_
exit 1
}

case ${1} in
  virtualbox)
    ${1}
    ;;
  *)
    usage
    ;;
esac
