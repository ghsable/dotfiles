#!/bin/bash

echo "${0} ..."

# ------ iptables ------
# --- install
sudo pacman -Syu
sudo pacman -S iptables
sudo pacman -Sc

# --- set local rules
sudo cp /etc/iptables/empty.rules /etc/iptables/iptables.rules

# --- setting
readonly ETC_FILE="/etc/iptables/iptables.rules"
echo "UPDATE : ${ETC_FILE}"
sudo iptables-save | sudo tee ${ETC_FILE} >/dev/null
sudo vi ${ETC_FILE}

# --- auto-load
sudo systemctl enable iptables

# --- check rules
sudo iptables -nvL --line-numbers
