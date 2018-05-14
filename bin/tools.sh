#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  Tools Menu

Usage:
  sh ${0} launch_a : dmenu
  sh ${0} rec      : simplescreenrecorder
  sh ${0} note     : leafpad
  sh ${0} office   : libreoffice
  sh ${0} *        : usage

_EOT_
exit 1
}

case ${1} in
  launch_a)  dmenu_run             ;;
  rec     )  simplescreenrecorder  ;;
  note    )  leafpad               ;;
  office  )  libreoffice           ;;
  *       )  usage                 ;;
esac
