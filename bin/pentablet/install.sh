#!/bin/bash

echo "${0} ..."

# ------ Pentablet ------
# --- install
# xf86-input-wacom : Driver

sudo pacman -Syu
sudo pacman -S xf86-input-wacom
sudo pacman -Sc

echo '---------------------------------------->>(EOF)'
