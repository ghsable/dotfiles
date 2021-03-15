#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET IBus/Anthy

Usage:
  sh ${0} ibus : OPEN ibus-setup
  sh ${0} *    : USAGE

_EOT_
exit 1
}

case ${1} in
  ibus)
    ibus-setup
    ;;
  *)
    usage
    ;;
esac
