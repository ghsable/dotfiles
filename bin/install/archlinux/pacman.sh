#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# Upgrade(repository + packages)
sudo pacman -Syu

# Install(packages)
sudo pacman -S $(grep -v -e '^$' -e '^#' ./list/pacman.txt)

# Delete Cache(all packages)
sudo pacman -Sc

# End Message
cat ./complete.txt
