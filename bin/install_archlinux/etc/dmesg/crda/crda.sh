#!/bin/bash

echo "${0} ..."

# ------ CRDA(Setting up regulation of radio channels for each country) ------
# --- install(crda)
sudo pacman -Syu
sudo pacman -S crda
sudo pacman -Sc

# -> resolution errors(platform regulatory.0: Direct firmware load for regulatory.db failed with error -2)

# --- setting
function add_config() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
WIRELESS_REGDOM="JP"
_EOT_
return 0
}
readonly ETC_FILE="/etc/conf.d/wireless-regdom"
echo "UPDATE : ${ETC_FILE}"
add_config | sudo tee -a ${ETC_FILE} >/dev/null
sudo vi ${ETC_FILE}
