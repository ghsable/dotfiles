#!/bin/bash

echo "${0} ..."

# --- Upgrade(repository + packages)
sudo pacman -Syu

# --- Install(packages)
sudo pacman -S $(grep -v -e '^$' -e '^#' $(dirname ${0})/pacman.txt)

# --- Delete Cache(all packages)
sudo pacman -Sc

echo '---------------------------------------->>(EOF)'
