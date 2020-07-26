#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  INSTALL Wine

Usage:
  sh ${0} install   : INSTALL packages
  sh ${0} useradd   : ADD     users
  sh ${0} *         : USAGE

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# wine                              : a compatibility layer capable of running Windows applications'
    echo '# wine_gecko,wine-mono              : support Internet Explorer and .NET'
    echo '# lib32-alsa-lib,lib32-alsa-plugins : ALSA driver'
    echo '# lib32-libpulse                    : PulseAudio driver'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S wine \
                   wine_gecko wine-mono \
                   lib32-alsa-lib lib32-alsa-plugins \
                   lib32-libpulse
    sudo pacman -Sc
    ;;
  useradd)
    sudo useradd -m -s /bin/bash wineuser
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)
