#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  UNZIP files

Usage:
  sh ${0} unzip <inputfile_path> : UNZIP files
  sh ${0} *                      : USAGE

_EOT_
exit 1
}

case ${1} in
  unzip)
    readonly OUTPUTFILE_DIR=`dirname ${2}`
    unzip -v ${2}
    unzip -d ${OUTPUTFILE_DIR} ${2}
    ;;
  *)
    usage
    ;;
esac
