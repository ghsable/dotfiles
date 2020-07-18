#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET input_devices(xinput)

Usage:
  sh ${0} mouse-button : SET Mouse-Button
  sh ${0} *            : USAGE

_EOT_
exit 1
}

case ${1} in
  mouse-button)
    # Button-Action
    # 1 : click-left
    # 2 : open-newtab
    # 3 : click-right
    # 4 : scroll-up
    # 5 : scroll-down
    # 6 : scroll-left
    # 7 : scroll-right
    # 8 : back-browser
    readonly MOUSE_NAME='Kensington Kensington Slimblade Trackball'
    xinput set-button-map "${MOUSE_NAME}" 1 8 3 4 5 6 7 2
    ;;
  *)
    usage
    ;;
esac
