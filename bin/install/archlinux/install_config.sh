#!/bin/bash

chsh -s $(which zsh)                                                      &&  #Change SHELL
sudo tee /sys/class/backlight/acpi_video0/brightness <<< 3                &&  #Default backlight
sudo systemctl enable tlp.service                                         &&  #TLP
sudo systemctl enable tlp-sleep.service                                   &&  #TLP
sudo ln -sfv /dev/null /etc/systemd/system/systemd-rfkill@.service        &&  #rfkill Mask by TLP

mkdir -pvm 700 ~/.anthy ~/.xmonad ~/.config ~/.local/share/applications   &&  #~/Config
mkdir -pvm 700 ~/Downloads ~/Pictures ~/Screenshots                       &&  #~/File
mkdir -pvm 700 ~/Develop/java ~/Develop/cs                                    #~/Develop/ProgrammingLanguage
