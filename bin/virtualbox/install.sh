#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  INSTALL VirtualBox

Usage:
  sh ${0} install   : INSTALL Packages
  sh ${0} gpasswd   : ADD     Group
  sh ${0} systemctl : ENABLE  System_services
  sh ${0} modprobe  : LOAD    Modules
  sh ${0} *         : USAGE

EOF:
  virtualbox

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# virtualbox,virtualbox-host-modules-arc : Virtual PC emulator(linux kernel)'
    echo '# net-tools                              : host-only network'
    echo '# virtualbox-guest-*                     : Guest Additions(linux kernel)'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S virtualbox virtualbox-host-modules-arch \
                   net-tools \
                   virtualbox-guest-iso virtualbox-guest-utils virtualbox-guest-modules-arch
    sudo pacman -Sc
    ;;
  gpasswd)
    sudo gpasswd -a $(whoami) vboxusers
    groups
    ;;
  systemctl)
    systemctl enable vboxservice.service
    ;;
  modprobe)
    modprobe -a vboxdrv \
                vboxnetadp vboxnetflt \
                vboxpci \
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)
