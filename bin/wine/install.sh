#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET Wine

Usage:
  sh ${0} pacman    : INSTALL packages
  sh ${0} useradd   : ADD     users
  sh ${0} *         : USAGE

EOF:
  virtualbox

_EOT_
exit 1
}

case ${1} in
  pacman)
    sudo pacman -Syu
    sudo pacman -S firejail \
                   wine wine_gecko wine-mono \
                   lib32-alsa-lib lib32-alsa-plugins lib32-libpulse
    sudo pacman -Sc
    ;;
  useradd)
    sudo useradd -m -s /bin/bash wineuser
    ;;
  *)
    usage
    ;;
esac
