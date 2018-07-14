#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  OPEN any files

Usage:
  sh ${0} <inputfile_path> : OPEN  any files
  sh ${0} *                : USAGE

_EOT_
exit 1
}

case ${1##*.} in
  txt)
    leafpad ${1}
    ;;
  html)
    w3m -dump ${1}
    ;;
  doc | docx | xls | xlsm)
    unoconv -f html ${1} &&
    w3m -dump ${1%.*}.html
    ;;
  potx)
    libreoffice ${1}
    ;;
  pdf)
    pdftotext ${1} -
    #mupdf ${1}
    #firefox ${1}
    ;;
  *)
    echo 'not supported...'
    usage
    ;;
esac
