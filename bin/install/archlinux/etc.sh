#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

readonly DELIMITER_FILE="../all/delimiter.txt"
readonly REDIRECT_DIR="./etc/redirect"

### Function ###
function create_etc() {
# [X11] Keymap Setting on All System
# Alt + Shift -> Toggle Keymap JP/US
echo 'Create -> /etc/X11/xorg.conf.d/00-keyboard.conf'
sudo localectl set-x11-keymap jp,us pc104 ,dvorak grp:alt_shift_toggle
sudo vi /etc/X11/xorg.conf.d/00-keyboard.conf
}

function redirect_etc() {
# [Sysctl] dmesg = null
echo 'Redirect -> /etc/sysctl.d/20-quiet-printk.conf'
cat ${DELIMITER_FILE} ${REDIRECT_DIR}/20-quiet-printk.conf 2 >/dev/null | sudo tee -a /etc/sysctl.d/20-quiet-printk.conf
sudo vi /etc/sysctl.d/20-quiet-printk.conf

# [Systemd] HandlePowerKey = ignore
echo 'Redirect -> /etc/systemd/logind.conf'
cat ${DELIMITER_FILE} ${REDIRECT_DIR}/logind.conf 2 >/dev/null | sudo tee -a /etc/systemd/logind.conf
sudo vi /etc/systemd/logind.conf

# [Pacman] ON -> Color,VerbosePkgLists
echo 'Redirect -> /etc/pacman.conf'
cat ${DELIMITER_FILE} ${REDIRECT_DIR}/pacman.conf 2 >/dev/null | sudo tee -a /etc/pacman.conf
sudo vi /etc/pacman.conf

# [ACPI] Set Backlight
echo 'Redirect -> /sys/class/backlight/acpi_video0/brightness
sudo tee /sys/class/backlight/acpi_video0/brightness<<< 3                
}

function set_systemctl {
# [TLP] enable
sudo systemctl enable tlp.service                                         
sudo systemctl enable tlp-sleep.service                                   
# [TLP] systemd service MASK
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# [eof] Display systemctl service
sudo systemctl list-unit-files
}

function set_other {
# [SHELL] Set ZSH
chsh -s $(which zsh)                                                      
}

### Run ###
create_etc
redirect_etc
set_systemctl
set_other

# End Message
cat ../all/complete.txt
