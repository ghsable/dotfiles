#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  OPEN any files(console)

Usage:
  sh ${0} <inputfile_path> : OPEN  any files(console)
  sh ${0} *                : USAGE

_EOT_
exit 1
}

case ${1##*.} in
  zip)
    unar -o ${HOME}/Downloads ${1}
    ;;
  txt)
    cat ${1}
    ;;
  html)
    w3m -dump ${1}
    ;;
  doc | docx | xls | xlsm)
    unoconv -f html ${1} &&
    w3m -dump ${1%.*}.html
    ;;
  pdf)
    pdftotext ${1} -
    ;;
  *)
    echo 'not supported...'
    usage
    ;;
esac
