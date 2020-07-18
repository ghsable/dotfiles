#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  CONVERT Documents

Usage:
  sh ${0} pandoc <inputfile_path> <outputfile_path> : CONVERT <inputfile_path> -> <outputfile_path>
  sh ${0} demos                                     : OPEN Pandoc-Demos
  sh ${0} *                                         : USAGE

Examples:
  https://pandoc.org/demos.html

_EOT_
exit 1
}

case ${1} in
  pandoc)
    pandoc ${2} -s -o ${3}
    ;;
  demos)
    firefox "https://pandoc.org/try/"
    ;;
  *)
    usage
    ;;
esac
