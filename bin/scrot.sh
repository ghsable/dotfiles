#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  Screen Shot

Usage:
  sh ${0}       : Desktop
  sh ${0} -u    : Focus Window
  sh ${0} -s    : Select Size
  sh ${0} -help : this script usage

_EOT_
}

if [ "${1}" = "" -o "${1}" = "-u" -o "${1}" = "-s" ]; then
   readonly SLEEP_SEC="0.5"
   readonly OPTION="${1}"
   readonly SCREENSHOT_FILENAME=~/Screenshots/%m%d_%H%M%S.png
   sleep ${SLEEP_SEC}
   scrot ${OPTION} ${SCREENSHOT_FILENAME}
   :
elif [ "${1}" = "-help" ]; then
   usage
   :
else
   echo -e 'ERROR!!\n'
   usage
   :
fi
