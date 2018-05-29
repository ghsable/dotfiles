#!/bin/bash

echo "${0} ..."

function add_config() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
[options]
Color
VerbosePkgLists
_EOT_
return 0
}

# [Pacman] Set options
readonly ETCCONF_FILE="/etc/pacman.conf"
echo "UPDATE : ${ETCCONF_FILE}"
add_config | sudo tee -a ${ETCCONF_FILE}
sudo vi ${ETCCONF_FILE}
