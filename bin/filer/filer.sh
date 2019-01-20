#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  MENU(filer)

Usage:
  sh ${0} a : ranger
  sh ${0} b : thunar
  sh ${0} * : USAGE

_EOT_
exit 1
}

case ${1} in
  a) ranger ;;
  b) thunar ;;
  *) usage  ;;
esac
