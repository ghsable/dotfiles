#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET display(XRandR)

  display1 = main
  display2 = sub

Usage:
  sh ${0} on1        : ON                  display1(full size)
  sh ${0} on2        : ON                  display2(full size)
  sh ${0} off1       : OFF                 display1
  sh ${0} off2       : OFF                 display2
  sh ${0} mirror     : ADD mirroring       display2
  sh ${0} above      : ADD above           display2
  sh ${0} below      : ADD below           display2
  sh ${0} left       : ADD left            display2
  sh ${0} right      : ADD right           display2
  sh ${0} rotate-n   : ROTATE normal       display2
  sh ${0} rotate-i   : ROTATE inverted     display2
  sh ${0} rotate-l   : ROTATE left         display2
  sh ${0} rotate-r   : ROTATE right        display2
  sh ${0} reflect-n  : REFLECT ( , )       display2
  sh ${0} reflect-x  : REFLECT (x, )       display2
  sh ${0} reflect-xy : REFLECT (x,y)       display2
  sh ${0} 0.[1-9]    : SET brightness      display1,2
  sh ${0} xinput     : SET usbtouchscreen  display2
  sh ${0} *          : USAGE

_EOT_
exit 1
}

readonly DISPLAY1_NAME=`xrandr --query | grep -e " connected" | cut -d " " -f 1-1 | head --lines=1`
readonly DISPLAY2_NAME=`xrandr --query | grep -e " connected" | cut -d " " -f 1-1 | head --lines=2 | tail --lines=1`
readonly DISPLAY1_SIZE="1366x768"
#readonly DISPLAY1_SIZE="1440x900"
readonly DISPLAY2_SIZE="1920x1080"
readonly DISPLAY2_MIRRORING_SIZE=""
#readonly DISPLAY2_MIRRORING_SIZE="1920x1080"
#readonly DISPLAY2_MIRRORING_SIZE="2560x1440"

case ${1} in
  on1)
    xrandr --output ${DISPLAY1_NAME} --mode ${DISPLAY1_SIZE}
    ;;
  on2)
    xrandr --output ${DISPLAY2_NAME} --mode ${DISPLAY2_SIZE}
    ;;
  off1)
    xrandr --output ${DISPLAY1_NAME} --off
    ;;
  off2)
    xrandr --output ${DISPLAY2_NAME} --off
    ;;
  mirror)
    xrandr --output ${DISPLAY2_NAME} --mode ${DISPLAY2_MIRRORING_SIZE} --same-as ${DISPLAY1_NAME}
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
  xinput)
    # xinput list --id-only "DEVICE NEME"
    readonly INPUTSTYLUS_ID1=`xinput list | grep -e 'Weida Hi-Tech' | cut -f 2-2 | tr -d 'id='`
    xinput --map-to-output ${INPUTSTYLUS_ID1} ${DISPLAY2_NAME}
    ;;
  *)
    usage
    ;;
esac
