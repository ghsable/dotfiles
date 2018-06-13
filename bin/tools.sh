#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  MENU(tools)

Usage:
  sh ${0} launch_a : dmenu
  sh ${0} rec1     : simplescreenrecorder
  sh ${0} rec2     : peek(AUR)
  sh ${0} note     : leafpad
  sh ${0} movie    : mplayer
  sh ${0} office   : libreoffice
  sh ${0} *        : USAGE

_EOT_
exit 1
}

case ${1} in
  launch_a)  dmenu_run             ;;
  rec1    )  simplescreenrecorder  ;;
  rec2    )  peek                  ;;
  note    )  leafpad               ;;
  movie   )  gnome-mplayer         ;;
  office  )  libreoffice           ;;
  *       )  usage                 ;;
esac
