#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  OPEN any files(graphical)

Usage:
  sh ${0} <inputfile_path> : OPEN  any files(graphical)
  sh ${0} *                : USAGE

_EOT_
exit 1
}

case ${1##*.} in
  txt)
    leafpad ${1}
    ;;
  html)
    firefox ${1}
    ;;
  doc | docx | xls | xlsm | potx | pptx)
    libreoffice ${1}
    ;;
  pdf)
    evince ${1}
    ;;
  jpg | jpeg | png | gif)
    sh ${HOME}/bin/feh/feh_browser.sh ${1}
    ;;
  mp4)
    firefox ${1}
    ;;
  *)
    echo 'not supported...'
    usage
    ;;
esac
