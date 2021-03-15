#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Input Method Framework

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} *       : USAGE

EOF:
  ibus-setup

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# ibus       : Input Method Framework'
    echo '# ibus-anthy : Input System'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S ibus \
                   ibus-anthy
    sudo pacman -Sc
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
