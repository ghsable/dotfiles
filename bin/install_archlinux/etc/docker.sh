#!/bin/bash

echo "${0} ..."

# ------ Docker ------
# --- install(docker)
sudo pacman -Syu
sudo pacman -S docker
sudo pacman -Sc

# --- auto-load
# $ docker info
sudo systemctl enable docker.service

# --- add docker group
sudo gpasswd -a $(whoami) docker
groups
