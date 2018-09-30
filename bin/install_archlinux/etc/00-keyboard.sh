#!/bin/bash

echo "${0} ..."

# --- [X11] Keymap Setting on All System
readonly ETC_FILE="/etc/X11/xorg.conf.d/00-keyboard.conf"
readonly ETC_OPTIONS="jp,us pc104 ,dvorak grp:alt_shift_toggle"
#readonly ETC_OPTIONS="setxkbmap -model jp106 -layout jp,us -option grp:alt_shift_toggle"
echo "UPDATE : ${ETC_FILE}"
sudo localectl set-x11-keymap ${ETC_OPTIONS}
sudo vi ${ETC_FILE}
