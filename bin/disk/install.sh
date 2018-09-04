#!/bin/bash

echo "${0} ..."

# ------ Disk ------
# --- install
# mplayer      : movie/music player
# libdvd*      : play dvd
# cdrtools     : create *.iso
# ccd2iso      : convert *.img/ccd -> *.iso
# dvd+rw-tools : format dvd-rw , write dvd(growisofs)

sudo pacman -Syu
sudo pacman -S mplayer gnome-mplayer \
               libdvdread libdvdcss libdvdnav \
               cdrtools \
               ccd2iso \
               dvd+rw-tools
sudo pacman -Sc

echo '---------------------------------------->>(EOF)'
