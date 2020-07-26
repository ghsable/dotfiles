#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Finger print(fprintd) Commands

Usage:
  sh ${0} fprintd-enroll     <finger_name> : ENROLL  Finger print
  sh ${0} fprintd-enroll-all               : ENROLL  Finger print(All)
  sh ${0} fprintd-list                     : DISPLAY Finger print
  sh ${0} fprintd-delete                   : DELETE  Finger print
  sh ${0} *                                : USAGE

finger_name:
  # Left
  left-thumb
  left-index-finger
  left-middle-finger
  left-ring-finger
  left-little-finger
  # Right
  right-thumb
  right-index-finger
  right-middle-finger
  right-ring-finger
  right-little-finger.

_EOT_
exit 1
}

case ${1} in
  fprintd-enroll)
    ${1} -f ${2} $(whoami)
    ;;
  fprintd-enroll-all)
    for finger in {left,right}-{thumb,{index,middle,ring,little}-finger}; do fprintd-enroll -f ${finger} $(whoami); done
    ;;
  fprintd-list | fprintd-delete)
    ${1} $(whoami)
    ;;
  *)
    usage
    ;;
esac
