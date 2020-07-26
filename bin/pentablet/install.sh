#!/bin/bash

echo "${0} ..."

# ------ Pentablet ------
# --- install
{
echo '--------------------------------------------------'
echo '# xf86-input-wacom : Driver'
echo '--------------------------------------------------'
}
sudo pacman -Syu
sudo pacman -S xf86-input-wacom
sudo pacman -Sc

echo '---------------------------------------->>(EOF)'
