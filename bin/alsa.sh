#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  Set ALSA(Advanced Linux Sound Architecture)

Usage:
  sh ${0} mute   : OFF       sound
  sh ${0} unmute : ON        sound
  sh ${0} toggle : TOGGLE    sound
  sh ${0} +      : increment sound
  sh ${0} -      : decrement sound
  sh ${0} *      : usage

EOF:
  alsamixer

_EOT_
exit 1
}

case ${1} in
  mute | unmute | toggle)
    amixer sset Master ${1}
    ;;
  + | -)
    readonly STEP="5"
    amixer set Master ${STEP}%${1}
    ;;
  *)
    usage
    ;;
esac
