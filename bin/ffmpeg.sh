#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  CONVERT files

Usage:
  sh ${0} cut    <hh:dd>-<hh:dd>  <inputfile_path> : CUT     movie_file
  sh ${0} to-gif <inputfile_path>                  : CONVERT movie_file -> gif_file
  sh ${0} *                                        : USAGE

_EOT_
exit 1
}

case ${1} in
  cut)
    readonly SCALE_VALUE='640:-1'
    readonly DATE_YYMMDDHHMM=`date "+%Y%m%d%H%M"`
    cd $(dirname ${3})
    ffmpeg -ss ${2%-*} -i ${3} -t ${2#*-} -vf "scale=${SCALE_VALUE}" -y ffmpeg_${DATE_YYMMDDHHMM}.${3##*.}
    ;;
  to-gif)
    readonly RATE_VALUE='15'
    ffmpeg -i ${2} -vf "palettegen" -y palette.png
    ffmpeg -i ${2} -an -i palette.png -filter_complex paletteuse -r ${RATE_VALUE} -y ${2%.*}.gif
    ;;
  *)
    usage
    ;;
esac
