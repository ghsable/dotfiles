#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  CONVERT files

Usage:
  sh ${0} cut     <hh:dd>-<hh:dd>  <inputfile_path> : CUT     inputfile
  sh ${0} speedup <inputfile_path>                  : SPEEDUP inputfile
  sh ${0} to-gif  <inputfile_path>                  : CONVERT inputfile -> gif_file
  sh ${0} *                                         : USAGE

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
  speedup)
    readonly SPEED='2.0'
    ffmpeg -i ${2} -vf setpts=PTS/${SPEED} -af atempo=${SPEED} ${2%.*}_speedup.${2##*.}
    ;;
  to-gif)
    readonly RATE_VALUE='15'
    ffmpeg -i ${2} -vf palettegen=max_colors=32 -y palette.png
    ffmpeg -i ${2} -an -i palette.png -filter_complex 'paletteuse=diff_mode=1:dither=1' -r ${RATE_VALUE} -y ${2%.*}.gif
    rm -r palette.png
    ;;
  *)
    usage
    ;;
esac
