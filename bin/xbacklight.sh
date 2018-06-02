#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET brightness(xbacklight)

Usage:
  sh ${0} -set <value> : SET       brightness
  sh ${0} -inc <step>  : INCREMENT brightness
  sh ${0} -dec <step>  : DECREMENT brightness
  sh ${0} *            : USAGE

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
