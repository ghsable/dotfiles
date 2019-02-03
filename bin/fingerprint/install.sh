#!/bin/bash

echo "${0} ..."

# ------ Finger print ------
# --- install
# fprintd     : Driver
# imagemagick : Library

sudo pacman -Syu
sudo pacman -S fprintd \
               imagemagick
sudo pacman -Sc

# --- add config
# login(/etc/pam.d/system-local-login)
# sudo(/etc/pam.d/sudo)
function add_config() {
cat<< _EOT_
#################### PLEASE ADD THIS LINE(The first line) ####################
auth     sufficient pam_fprintd.so
_EOT_
return 0
}

readonly ETC_LOGIN_FILE="/etc/pam.d/system-local-login"
readonly ETC_SUDO_FILE="/etc/pam.d/sudo"
echo "UPDATE : ${ETC_LOGIN_FILE}"
echo "UPDATE : ${ETC_SUDO_FILE}"
add_config | sudo tee -a ${ETC_LOGIN_FILE}
add_config | sudo tee -a ${ETC_SUDO_FILE}
sudo vi ${ETC_LOGIN_FILE}
sudo vi ${ETC_SUDO_FILE}

echo '---------------------------------------->>(EOF)'
