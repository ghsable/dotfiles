#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

readonly DELIMITER_FILE="../all/delimiter.txt"
readonly REDIRECT_DIR="./etc/redirect"

### FUNCTION ###
function create_etc() {
# [X11] Keymap Setting on All System
# Alt + Shift -> Toggle Keymap JP/US
echo 'Create -> /etc/X11/xorg.conf.d/00-keyboard.conf'
sudo localectl set-x11-keymap jp,us pc104 ,dvorak grp:alt_shift_toggle
sudo vi /etc/X11/xorg.conf.d/00-keyboard.conf
}

function redirect_etc() {
# [Sysctl] kernel dmesg = null
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
echo 'Redirect -> /sys/class/backlight/acpi_video0/brightness'
sudo tee /sys/class/backlight/acpi_video0/brightness<<< 3                
}

function set_pacmanpkgs() {
### TLP(battery manager) ###
# install(tlp,Radio Device Wizard)
sudo pacman -S tlp tlp-rdw
# systemctl enable
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
# systemctl mask
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
#sudo ln -s /dev/null /etc/systemd/system/systemd-rfkill@.service
#sudo ln -s /dev/null /etc/systemd/system/systemd-rfkill@.socket
# redirect config
echo 'Redirect -> /etc/default/tlp'
cat ${DELIMITER_FILE} ${REDIRECT_DIR}/tlp 2 >/dev/null | sudo tee -a /etc/default/tlp
sudo vi /etc/default/tlp

### LIBINPUT(input driver) ###
# install(libinput,xorg-wrapper,xorg_now-change_config)
sudo pacman -S libinput xf86-input-libinput xorg-xinput
# Set default libinput
ln -s /usr/share/X11/xorg.conf.d/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
# redirect config
echo 'Redirect -> /etc/X11/xorg.conf.d/40-libinput.conf'
cat ${DELIMITER_FILE} ${REDIRECT_DIR}/40-libinput.conf 2 >/dev/null | sudo tee -a /etc/X11/xorg.conf.d/40-libinput.conf
sudo vi /etc/X11/xorg.conf.d/40-libinput.conf
}

function eof_etc() {
# Display systemctl service
sudo systemctl list-unit-files
}

function set_other() {
# [SHELL] Set ZSH
chsh -s $(which zsh)                                                      
}

### RUN ###
create_etc
redirect_etc
set_pacmanpkgs
eof_etc
set_other

# End Message
cat ../all/complete.txt
