#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Finger print Command

Finger:
  left_
  left_

Usage:
  sh ${0} fprintd-enroll <finger> : ENROLL  Finger print
  sh ${0} fprintd-list            : DISPLAY Finger print
  sh ${0} fprintd-delete          : DELETE  Finger print
  sh ${0} *                       : USAGE

_EOT_
exit 1
}

case ${1} in
  fprintd-enroll)
    ${1} -f ${2} $(whoami)
    ;;
  fprintd-list | fprintd-delete)
    ${1} $(whoami)
    ;;
  *)
    usage
    ;;
esac
