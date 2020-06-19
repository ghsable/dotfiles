#!/bin/bash

echo "${0} ..."

# ------ CRONIE(crontab) ------
# --- install(cronie)
sudo pacman -Syu
sudo pacman -S cronie
sudo pacman -Sc

# --- auto-load
sudo systemctl enable cronie

# --- crontab
readonly ETC_FILE=~/dotfiles/bin/install_archlinux/etc/crontab
vi ${ETC_FILE}
echo "LOAD : ${ETC_FILE}"
crontab ${ETC_FILE}
crontab -l
