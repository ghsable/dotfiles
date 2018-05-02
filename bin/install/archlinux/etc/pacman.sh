#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# [Pacman] ON -> Color,VerbosePkgLists
echo 'Update -> /etc/pacman.conf'
cat ./delimiter.txt ./pacman.conf | sudo tee -a /etc/pacman.conf
sudo vi /etc/pacman.conf
