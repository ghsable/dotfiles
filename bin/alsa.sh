#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  Set ALSA(Advanced Linux Sound Architecture)

Usage:
  sh ${0} mute   : OFF sound
  sh ${0} unmute : ON  sound
  sh ${0} +      : increment sound
  sh ${0} -      : decrement sound
  sh ${0} help   : this script usage

EOF:
  alsamixer

_EOT_
}

if [ "${1}" = "mute" -o "${1}" = "unmute" ]; then
   amixer sset Master ${1}
   :
elif [ "${1}" = "+" -o "${1}" = "-" ]; then
   readonly STEP="5"
   amixer set Master ${STEP}%${1}
   :
elif [ "${1}" = "help" ]; then
   usage
   :
else
   echo -e 'ERROR!!\n'
   usage
fi
