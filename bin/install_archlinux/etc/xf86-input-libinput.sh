#!/bin/bash

echo "${0} ..."

# ------ LIBINPUT(touch driver) ------
# --- install(libinput)
sudo pacman -Syu
sudo pacman -S xf86-input-libinput
sudo pacman -Sc

# --- setting
# trackpoint speed
readonly SYS_FILE="/sys/devices/platform/i8042/serio1/serio2/sensitivity"
echo '80' | sudo tee ${SYS_FILE}
sudo vi ${SYS_FILE}
