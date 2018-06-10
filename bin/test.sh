#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET XXX

Usage:
  sh ${0} XXX : xxx
  sh ${0} XXX : xxx
  sh ${0} *   : USAGE

EOF:
  XXX

_EOT_
exit 1
}

case ${1} in
  XXX | XXX)
    XXX
    ;;
  xxx)
    XXX
    ;;
  *)
    usage
    ;;
esac
