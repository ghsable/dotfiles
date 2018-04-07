#!/bin/sh

# Variable
delimiter=~/dotfiles/etc/archlinux/redirect/Delimiter.txt
dir_a=~/dotfiles/etc/archlinux/redirect/

### Command ###
# Keymap Setting on All System
# Alt + Shift -> Toggle Keymap JP/US
echo "Create -> /etc/X11/xorg.conf.d/00-keyboard.conf"
sudo localectl set-x11-keymap jp,us pc104 ,dvorak grp:alt_shift_toggle

### Redirect ###
# dmesg = null
echo "Redirect -> /etc/sysctl.d/20-quiet-printk.conf"
cat ${delimiter} ${dir_a}20-quiet-printk.conf 2>/dev/null | sudo tee -a /etc/sysctl.d/20-quiet-printk.conf

# HandlePowerKey = ignore
echo "Redirect -> /etc/systemd/logind.conf"
cat ${delimiter} ${dir_a}logind.conf 2>/dev/null | sudo tee -a /etc/systemd/logind.conf

# Pacman [ON]Color , VerbosePkgLists
echo "Redirect -> /etc/pacman.conf"
cat ${delimiter} ${dir_a}pacman.conf 2>/dev/null | sudo tee -a /etc/pacman.conf
