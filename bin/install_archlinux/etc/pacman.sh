#!/bin/bash

echo "${0} ..."

# --- [Pacman] Set options
function add_config() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
[options]
Color
VerbosePkgLists
[multilib]
Include = /etc/pacman.d/mirrorlist
_EOT_
return 0
}
readonly ETC_FILE="/etc/pacman.conf"
echo "UPDATE : ${ETC_FILE}"
add_config | sudo tee -a ${ETC_FILE} >/dev/null
sudo vi ${ETC_FILE}
