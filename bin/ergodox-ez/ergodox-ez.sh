#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  ErgoDox-EZ Command

Usage:
  sh ${0} edit    : EDIT   keymap.c
  sh ${0} keycode : OPEN   keycode.h
  sh ${0} deploy  : DEPLOY my-keymaps
  sh ${0} build   : BUILD  keymap.c
  sh ${0} teensy  : OPEN   Teensy Loader
  sh ${0} *       : USAGE

_EOT_
exit 1
}

case ${1} in
  edit)
    vim ${HOME}/bin/ergodox-ez/my-keymap/keymap.c
    ;;
  keycode)
    vim ${HOME}/tmp/ergodox-ez/qmk_firmware/tmk_core/common/keycode.h
    ;;
  deploy)
    \cp -frv "${HOME}/bin/ergodox-ez/my-keymap" "${HOME}/tmp/ergodox-ez/qmk_firmware/keyboards/ergodox_ez/keymaps"
    ;;
  build)
    cd ~/tmp/ergodox-ez/qmk_firmware
    docker run -e keymap=my-keymap -e keyboard=ergodox_ez --rm -v $('pwd'):/qmk:rw edasque/qmk_firmware
    ;;
  teensy)
    ${HOME}/tmp/ergodox-ez/teensy_linux64/teensy
    ;;
  *)
    usage
    ;;
esac
