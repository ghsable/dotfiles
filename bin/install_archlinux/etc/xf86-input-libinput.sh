#!/bin/bash

echo "${0} ..."

# ------ LIBINPUT(touch driver) ------
# --- install(libinput)
sudo pacman -Syu
sudo pacman -S xf86-input-libinput
sudo pacman -Sc

# --- setting
# trackpoint speed(udev rules)
# *sensitivity(default:200) : /sys/devices/platform/i8042/serio1/serio2/sensitivity
#  speed      (default:97 ) : /sys/devices/platform/i8042/serio1/serio2/speed
readonly SYS_FILE="/etc/udev/rules.d/10-trackpoint.rules"
echo 'KERNEL=="serio2", SUBSYSTEM=="serio", DRIVERS=="psmouse", ATTR{sensitivity}:="100", ATTR{speed}:="97"' | sudo tee ${SYS_FILE}
sudo vi ${SYS_FILE}
udevadm test /sys/devices/platform/i8042/serio1
