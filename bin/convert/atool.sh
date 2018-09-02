#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  ZIP/UNZIP files

Usage:
  sh ${0} zip   <inputfile/dir_path> : ZIP files(apack)
  sh ${0} unzip <inputfile/dir_path> : UNZIP files(aunpack)
  sh ${0} list  <inputfile/dir_path> : DISPLAY files(als)
  sh ${0} *                          : USAGE

_EOT_
exit 1
}

case ${1} in
  zip)
    readonly INPUTFILE_NAME=`basename ${2}`
    readonly OUTPUTFILE_DIR=`dirname ${2}`
    readonly OUTPUTFILE_NAME=`basename ${2} | cut -d '.' -f 1-1`
    cd ${OUTPUTFILE_DIR}
    atool -a ${OUTPUTFILE_NAME}.zip ${INPUTFILE_NAME}
    ;;
  unzip)
    readonly OUTPUTFILE_DIR=`dirname ${2}`
    readonly OUTPUTFILE_NAME=`basename ${2}`
    cd ${OUTPUTFILE_DIR}
    atool -x ${OUTPUTFILE_NAME}
    ;;
  list)
    atool -l ${2}
    ;;
  *)
    usage
    ;;
esac
