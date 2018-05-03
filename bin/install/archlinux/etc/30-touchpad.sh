#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

### LIBINPUT(input driver) ###
# install(libinput,xorg-wrapper,xorg_now-change_config)
sudo pacman -S libinput xf86-input-libinput xorg-xinput

# Set default libinput
sudo ln -snfv /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

# redirect config
echo 'Update -> /etc/X11/xorg.conf.d/30-touchpad.conf'
cat ./delimiter.txt ./30-touchpad.conf | sudo tee -a /etc/X11/xorg.conf.d/30-touchpad.conf
sudo vi /etc/X11/xorg.conf.d/30-touchpad.conf
