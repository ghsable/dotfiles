#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  OPEN any archive(The Unarchiver)

Usage:
  sh ${0} unar <file_path> : OPEN archive
  sh ${0} lsar <file_path> : VIEW archive
  sh ${0} *                : USAGE

_EOT_
exit 1
}

case ${1} in
  unar)
    readonly ARCHIVE_DIR=`dirname ${2}`
    ${1} -o ${ARCHIVE_DIR} ${2}
    ;;
  lsar)
    ${1} ${2}
    ;;
  *)
    usage
    ;;
esac
