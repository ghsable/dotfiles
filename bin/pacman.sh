#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  PACMAN is Package Manager on Arch Linux

Usage:
  sh ${0} update                   : UPDATE    All Installed Packages
  sh ${0} search    <SEARCH_WORD>  : SEARCH    Packages
  sh ${0} install   <PACKAGE_NAME> : INSTALL   Packages
  sh ${0} uninstall <PACKAGE_NAME> : UNINSTALL Packages
  sh ${0} list                     : DISPLAY   Installed Packages
  sh ${0} *                        : USAGE

EOF:
  pacman --version

_EOT_
exit 1
}

case ${1} in
  update)
    sudo pacman -Syu
    ;;
  search)
    pacman -Ss ${2}
    ;;
  install)
    sudo pacman -S ${2}
    ;;
  uninstall)
    sudo pacman -Rs ${2}
    ;;
  list)
    pacman -Q | less -R
    ;;
  *)
    usage
    ;;
esac
