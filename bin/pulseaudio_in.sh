#!/bin/bash

# GET Input-Device-Number
readonly DEV_NUMBER=`pactl list sinks short | grep "Sony" | cut -f 1-1`

function usage() {
cat<< _EOT_
Description:
  SET PulseAudio(input sound)

Usage:
  sh ${0} mute   : OFF       sound
  sh ${0} unmute : ON        sound
  sh ${0} toggle : TOGGLE    sound
  sh ${0} +      : INCREMENT sound
  sh ${0} -      : DECREMENT sound
  sh ${0} *      : USAGE

EOF:
  pavucontrol
  alsamixer

_EOT_
exit 1
}

case ${1} in
  mute)
    pactl set-sink-mute ${DEV_NUMBER} true
    ;;
  unmute)
    pactl set-sink-mute ${DEV_NUMBER} false
    ;;
  toggle)
    pactl set-sink-mute ${DEV_NUMBER} toggle
    ;;
  + | -)
    readonly STEP="5"
    pactl set-sink-volume ${DEV_NUMBER} ${1}${STEP}%
    ;;
  *)
    usage
    ;;
esac
