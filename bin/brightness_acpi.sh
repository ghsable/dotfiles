#!/bin/bash

function usage() {
cat <<_EOT_
Description:
  Set Brightness

Usage:
  sh ${0} +    : increment brightness(max:15)
  sh ${0} -    : decrement brightness
  sh ${0} help : this script usage

_EOT_
}

if [ "${1}" = "+" -o "${1}" = "-" ]; then
   readonly SYMBOL="${1}"
   readonly STEP="1"
   BRIGHTNESS=$(expr $(cat /sys/class/backlight/acpi_video0/brightness) ${SYMBOL} ${STEP})

   # [ACPI] Set Backlight
   # /sys/devices/pci0000:00/0000:00:02.0/backlight/acpi_video0/brightness
   echo 'Update -> /sys/class/backlight/acpi_video0/brightness'
   sudo tee /sys/class/backlight/acpi_video0/brightness<<< ${BRIGHTNESS}
   #sudo vi /sys/class/backlight/acpi_video0/brightness
   :
elif [ "${1}" = "help" ]; then
   usage
   :
else
   echo -e 'ERROR!!\n'
   usage
   :
fi
