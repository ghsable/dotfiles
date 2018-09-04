#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Sound Command

Usage:
  sh ${0} alsamixer             : SETTING ALSA
  sh ${0} pavucontrol           : SETTING PulseAudio-Config
  sh ${0} qpaeq                 : SETTING PulseAudio-Equalizer-Config
  sh ${0} rec                   : RECORD Voice
  sh ${0} play <soundfile_path> : PLAY Sound_file
  sh ${0} *                     : USAGE

_EOT_
exit 1
}

case ${1} in
  alsamixer | pavucontrol | qpaeq)
    ${1}
    ;;
  rec)
    readonly DATE_YYMMDDHHMM=`date "+%Y%m%d%H%M"`
    rec record_${DATE_YYMMDDHHMM}.wav
    ;;
  play)
    play ${2}
    ;;
  *)
    usage
    ;;
esac
