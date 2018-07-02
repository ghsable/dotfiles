#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  CONVERT character code(file)

Charset:
  Windows : CP932(unknown-8bit)
  macOS   : UTF-8
  Linux   : UTF-8

Usage:
  sh ${0} display cp932 utf8  <file_path> : DISPLAY CP932 -> UTF-8
  sh ${0} display utf8  cp932 <file_path> : DISPLAY UTF-8 -> CP932
  sh ${0} convert cp932 utf8  <file_path> : CONVERT CP932 -> UTF-8(utf8_filename)
  sh ${0} convert utf8  cp932 <file_path> : CONVERT UTF-8 -> CP932(cp932_filename)
  sh ${0} *                               : USAGE

EOF:
  file -i <file_path>

_EOT_
exit 1
}

case ${1} in
  display)
    iconv -f ${2} -t ${3} ${4}
    ;;
  convert)
    readonly CONVERTED_DIR=`dirname ${4}`
    readonly CONVERTEDFILE_NAME=`basename ${4}`
    iconv -f ${2} -t ${3} <${4}> ${CONVERTED_DIR}/${3}_${CONVERTEDFILE_NAME}
    ;;
  *)
    usage
    ;;
esac
