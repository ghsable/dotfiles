#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Set Brightness(ACPI)

Usage:
  sh ${0} + : increment brightness(max:15)
  sh ${0} - : decrement brightness
  sh ${0} * : usage

EOF:
  cat /sys/class/backlight/acpi_video0/brightness
  cat /sys/devices/pci0000:00/0000:00:02.0/backlight/acpi_video0/brightness

_EOT_
exit 1
}

case ${1} in
  + | -)
    readonly STEP="1"
    BRIGHTNESS=$(expr $(cat /sys/class/backlight/acpi_video0/brightness) ${1} ${STEP})
    echo 'UPDATE : /sys/class/backlight/acpi_video0/brightness'
    sudo tee /sys/class/backlight/acpi_video0/brightness<<< ${BRIGHTNESS}
    ;;
  *)
    usage
    ;;
esac
