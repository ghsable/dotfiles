#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Mono

Usage:
  sh ${0} install-packages : INSTALL Packages
  sh ${0} *                : USAGE

EOF:
  mono -V

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# mono  : cross-platform(C#/CLR)'
    echo '# xterm : terminal emulator'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S mono \
                   xterm
    sudo pacman -Sc
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
