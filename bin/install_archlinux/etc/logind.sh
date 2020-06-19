#!/bin/bash

echo "${0} ..."

# --- [Systemd] Set Keymap
function add_config() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
HandlePowerKey=ignore
_EOT_
return 0
}
readonly ETC_FILE="/etc/systemd/logind.conf"
echo "UPDATE : ${ETC_FILE}"
add_config | sudo tee -a ${ETC_FILE} >/dev/null
sudo vi ${ETC_FILE}
