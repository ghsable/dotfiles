#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  UNZIP files(The Unarchiver)

Usage:
  sh ${0} unar <inputfile_path> : UNZIP   files
  sh ${0} lsar <inputfile_path> : DISPLAY files
  sh ${0} *                     : USAGE

_EOT_
exit 1
}

case ${1} in
  unar)
    readonly OUTPUTFILE_DIR=`dirname ${2}`
    unar -o ${OUTPUTFILE_DIR} ${2}
    ;;
  lsar)
    lsar ${2}
    ;;
  *)
    usage
    ;;
esac
