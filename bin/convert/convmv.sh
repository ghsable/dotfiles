#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  CONVERT character code(filename)

Charset:
  Windows : CP932(unknown-8bit)
  macOS   : UTF-8
  Linux   : UTF-8

Usage:
  sh ${0} display cp932 utf8  <inputfile_path> : DISPLAY CP932 -> UTF-8
  sh ${0} display utf8  cp932 <inputfile_path> : DISPLAY UTF-8 -> CP932
  sh ${0} convert cp932 utf8  <inputfile_path> : CONVERT CP932 -> UTF-8(utf8_filename)
  sh ${0} convert utf8  cp932 <inputfile_path> : CONVERT UTF-8 -> CP932(cp932_filename)
  sh ${0} *                                    : USAGE

_EOT_
exit 1
}

case ${1} in
  display)
    convmv -f ${2} -t ${3} ${4}
    ;;
  convert)
    convmv -f ${2} -t ${3} ${4} --notest
    ;;
  *)
    usage
    ;;
esac
