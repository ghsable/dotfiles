#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Wine Command

Usage:
  sh ${0} wine     <exefile_path> : START *.exe (change user)
  sh ${0} winejail <exefile_path> : START *.exe (firejail)
  sh ${0} *                       : USAGE

_EOT_
exit 1
}

case ${1} in
  wine)
    xhost +SI:localuser:wineuser
    sudo -u wineuser env HOME=/home/wineuser USER=wineuser USERNAME=wineuser LOGNAME=wineuser && wine "${2}"
    ;;
  winejail)
    firejail wine ${2}
    ;;
  *)
    usage
    ;;
esac
