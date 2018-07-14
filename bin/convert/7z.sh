#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  ZIP/UNZIP files

Usage:
  sh ${0} zipr  <inputfile/dir_path> : ZIP   files(off password)
  sh ${0} zipre <inputfile/dir_path> : ZIP   files(on  password)
  sh ${0} unzip <inputfile/dir_path> : UNZIP files
  sh ${0} *                          : USAGE

_EOT_
exit 1
}

case ${1} in
  zipr)
    7za a -tzip ${2%.*}.zip ${2}
    ;;
  zipre)
    7za a -tzip -p ${2%.*}.zip ${2}
    ;;
  unzip)
    readonly OUTPUTFILE_DIR=`dirname ${2}`
    7za x -o${OUTPUTFILE_DIR} ${2}
    ;;
  *)
    usage
    ;;
esac
