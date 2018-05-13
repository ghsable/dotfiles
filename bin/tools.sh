#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  MENU(tools)

Usage:
  sh ${0} launch_a : dmenu
  sh ${0} rec      : simplescreenrecorder
  sh ${0} *        : usage

_EOT_
exit 1
}

case ${1} in
  launch_a)
    dmenu_run
    ;;
  rec)
    simplescreenrecorder
    ;;
  *)
    usage
    ;;
esac
