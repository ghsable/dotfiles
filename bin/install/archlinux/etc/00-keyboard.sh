#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# [X11] Keymap Setting on All System
# Alt + Shift -> Toggle Keymap JP/US
echo 'Update -> /etc/X11/xorg.conf.d/00-keyboard.conf'
sudo localectl set-x11-keymap jp,us pc104 ,dvorak grp:alt_shift_toggle
sudo vi /etc/X11/xorg.conf.d/00-keyboard.conf
