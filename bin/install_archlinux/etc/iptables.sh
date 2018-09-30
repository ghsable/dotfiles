#!/bin/bash

echo "${0} ..."

# ------ iptables ------
# --- install
sudo pacman -Syu
sudo pacman -S iptables
sudo pacman -Sc

# --- systemctl enable
sudo cp /etc/iptables/empty.rules /etc/iptables/iptables.rules
sudo systemctl enable iptables

# --- check rules
sudo iptables -nvL --line-numbers

readonly ETC_FILE="/etc/iptables/iptables.rules"
echo "UPDATE : ${ETC_FILE}"
sudo iptables-save | sudo tee ${ETC_FILE}
sudo vi ${ETC_FILE}
