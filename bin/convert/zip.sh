#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  ZIP files

Usage:
  sh ${0} -r  <inputfile/dir_path> : ZIP files(off password)
  sh ${0} -re <inputfile/dir_path> : ZIP files(on  password)
  sh ${0} *                        : USAGE

_EOT_
exit 1
}

case ${1} in
  -r | -re)
    readonly INPUTFILE_NAME=`basename ${2}`
    readonly OUTPUTFILE_DIR=`dirname ${2}`
    readonly OUTPUTFILE_NAME=`basename ${2} | cut -d '.' -f 1-1`
    cd ${OUTPUTFILE_DIR}
    zip ${1} ${OUTPUTFILE_NAME}.zip ${INPUTFILE_NAME}
    ;;
  *)
    usage
    ;;
esac
