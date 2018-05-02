#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

### TLP(battery manager) ###
# install(tlp,Radio Device Wizard)
sudo pacman -S tlp tlp-rdw

# systemctl enable
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service

# systemctl mask
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
#sudo ln -snfv /dev/null /etc/systemd/system/systemd-rfkill@.service
#sudo ln -snfv /dev/null /etc/systemd/system/systemd-rfkill@.socket

# redirect config
echo 'Update -> /etc/default/tlp'
cat ./delimiter.txt ./tlp | sudo tee -a /etc/default/tlp
sudo vi /etc/default/tlp
