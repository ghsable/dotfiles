#!/bin/bash

echo "${0} ..."

# ------ Docker ------
# --- install(docker)
sudo pacman -Syu
sudo pacman -S docker
sudo pacman -Sc

# --- systemctl enable
# $ docker info
sudo systemctl enable docker.service

# --- setting
function add_config() {
cat<< _EOT_

_EOT_
return 0
}
#readonly ETC_FILE="/etc/"
#echo "UPDATE : ${ETC_FILE}"
#add_config | sudo tee -a ${ETC_FILE}
#sudo vi ${ETC_FILE}
