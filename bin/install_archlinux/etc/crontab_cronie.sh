#!/bin/bash

echo "${0} ..."

### CRONIE(crontab) ###
# install(cronie)
sudo pacman -S cronie

# systemctl enable
sudo systemctl enable cronie

# crontab
readonly ETC_FILE=~/dotfiles/bin/install_archlinux/etc/crontab
vi ${ETC_FILE}
echo "LOAD : ${ETC_FILE}"
crontab ${ETC_FILE}
crontab -l
