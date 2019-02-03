#!/bin/bash

echo "${0} ..."

# ------ Smart Card ------
# --- install
# ccid,opensc : Driver
# pcsc-tools  : Utility(pcsc_scan)

sudo pacman -Syu
sudo pacman -S ccid opensc \
               pcsc-tools
sudo pacman -Sc

# --- systemctl enable
# ccid,opensc : Driver
sudo systemctl enable pcscd.service

echo '---------------------------------------->>(EOF)'
