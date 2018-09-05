#!/bin/bash

echo "${0} ..."

# ------ Bluetooth ------
# --- install
# bluez*    : bluetooth-protocol/utility
# blueberry : bluetooth-gui-front-end

sudo pacman -Syu
sudo pacman -S bluez bluez-utils \
               blueberry
sudo pacman -Sc

# --- load bluetooth-driver
modprobe btusb

# --- systemctl enable
sudo systemctl enable bluetooth

# --- setting
# auto on bluetooth-adapter
function add_config_bluetooth() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
[Policy]
AutoEnable=true
_EOT_
return 0
}
readonly ETC_BLUETOOTH_FILE="/etc/bluetooth/main.conf"
echo "UPDATE : ${ETC_BLUETOOTH_FILE}"
add_config_bluetooth | sudo tee -a ${ETC_BLUETOOTH_FILE}
sudo vi ${ETC_BLUETOOTH_FILE}

echo '---------------------------------------->>(EOF)'
