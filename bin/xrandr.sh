#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Set Display(XRandR)

  Display1 = MAIN
  Display2 = SUB

Usage:
  sh ${0} on1        : on Display1(full size)
  sh ${0} on2        : on Display2(full size)
  sh ${0} off1       : off Display1
  sh ${0} off2       : off Display2
  sh ${0} mirror     : add Mirroring Display2
  sh ${0} above      : add Above Display2
  sh ${0} below      : add Below Display2
  sh ${0} left       : add Left Display2
  sh ${0} right      : add Right Display2
  sh ${0} rotate-n   : rotate Normal Display2
  sh ${0} rotate-i   : rotate Inverted Display2
  sh ${0} rotate-l   : rotate Left Display2
  sh ${0} rotate-r   : rotate Right Display2
  sh ${0} reflect-n  : reflect ( , ) Display2
  sh ${0} reflect-x  : reflect (x, ) Display2
  sh ${0} reflect-xy : reflect (x,y) Display2
  sh ${0} 0.[1-9]    : set brightness Display1,2

_EOT_
exit 1
}

readonly DISPLAY1_NAME=`xrandr --query | grep -e " connected" | cut -d " " -f 1-1 | head --lines=1`
readonly DISPLAY2_NAME=`xrandr --query | grep -e " connected" | cut -d " " -f 1-1 | head --lines=2 | tail --lines=1`
readonly DISPLAY1_SIZE="1440x900"
readonly DISPLAY2_SIZE="1920x1080"
readonly DISPLAY2_MIRROR_SIZE="1440x900"

case ${1} in
  on1)
    xrandr --output ${DISPLAY1_NAME} --mode ${DISPLAY1_SIZE} --rate 70
    ;;
  on2)
    xrandr --output ${DISPLAY2_NAME} --mode ${DISPLAY2_SIZE} --rate 70
    ;;
  off1)
    xrandr --output ${DISPLAY1_NAME} --off
    ;;
  off2)
    xrandr --output ${DISPLAY2_NAME} --off
    ;;
  mirror)
    xrandr --output ${DISPLAY2_NAME} --mode ${DISPLAY2_MIRROR_SIZE} --same-as ${DISPLAY1_NAME}
    ;;
  above)
    xrandr --output ${DISPLAY2_NAME} --above ${DISPLAY1_NAME}
    ;;
  below)
    xrandr --output ${DISPLAY2_NAME} --below ${DISPLAY1_NAME}
    ;;
  left)
    xrandr --output ${DISPLAY2_NAME} --left-of ${DISPLAY1_NAME}
    ;;
  right)
    xrandr --output ${DISPLAY2_NAME} --right-of ${DISPLAY1_NAME}
    ;;
  rotate-n)
    xrandr --output ${DISPLAY2_NAME} --rotate normal
    ;;
  rotate-i)
    xrandr --output ${DISPLAY2_NAME} --rotate inverted
    ;;
  rotate-l)
    xrandr --output ${DISPLAY2_NAME} --rotate left
    ;;
  rotate-r)
    xrandr --output ${DISPLAY2_NAME} --rotate right
    ;;
  reflect-n)
    xrandr --output ${DISPLAY2_NAME} --reflect normal
    ;;
  reflect-x)
    xrandr --output ${DISPLAY2_NAME} --reflect x
    ;;
  reflect-xy)
    xrandr --output ${DISPLAY2_NAME} --reflect xy
    ;;
  0\.[1-9])
    xrandr --output ${DISPLAY1_NAME} --brightness ${1}
    xrandr --output ${DISPLAY2_NAME} --brightness ${1}
    ;;
  *)
    usage
    ;;
esac
