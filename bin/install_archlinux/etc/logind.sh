#!/bin/bash

echo "${0} ..."

function add_config() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
HandlePowerKey=ignore
_EOT_
return 0
}

# [Systemd] Set Keymap
readonly ETCCONF_FILE="/etc/systemd/logind.conf"
echo "UPDATE : ${ETCCONF_FILE}"
add_config | sudo tee -a ${ETCCONF_FILE}
sudo vi ${ETCCONF_FILE}
