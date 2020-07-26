#!/bin/bash

echo "${0} ..."

# ------ Disk ------
# --- install
{
echo '--------------------------------------------------'
echo '# mplayer      : movie/music player'
echo '# libdvd*      : play dvd'
echo '# cdrtools     : create *.iso'
echo '# ccd2iso      : convert *.img/ccd -> *.iso'
echo '# dvd+rw-tools : format dvd-rw , write dvd(growisofs)'
echo '--------------------------------------------------'
}
sudo pacman -Syu
sudo pacman -S mplayer gnome-mplayer \
               libdvdread libdvdcss libdvdnav \
               cdrtools \
               ccd2iso \
               dvd+rw-tools
sudo pacman -Sc

echo '---------------------------------------->>(EOF)'
