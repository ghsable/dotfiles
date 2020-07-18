#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  adjusts the color temperature of your screen according to your surroundings.

Usage:
  sh ${0} -O : ON  Blue light mode
  sh ${0} -x : OFF Blue light mode
  sh ${0} *  : USAGE

EOF:
  redshift -p

_EOT_
exit 1
}

case ${1} in
  -O | -x)
    readonly TEMP="4500K"
    redshift ${1} ${TEMP} >/dev/null
    ;;
  *)
    usage
    ;;
esac
