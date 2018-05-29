#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Set Brightness(xbacklight)

Usage:
  sh ${0} -set <value> : set       brightness
  sh ${0} -inc <step>  : increment brightness
  sh ${0} -dec <step>  : decrement brightness
  sh ${0} *            : usage

_EOT_
exit 1
}

case ${1} in
  -set | -inc | -dec)
    xbacklight ${1} ${2}
    ;;
  *)
    usage
    ;;
esac
