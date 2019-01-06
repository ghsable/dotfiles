#!/bin/bash

echo "${0} ..."

# ------ rEFInd ------
# --- install
# intel-ucode : update Microcode
# efibootmgr  : operation UEFI-firmware
# refind-efi  : boot loader
pacman -Syu
pacman -S intel-ucode \
          efibootmgr refind-efi
pacman -Sc

# --- refind-install
refind-install

# --- Edit UEFI-boot-menu-entries
tac /boot/refind_linux.conf | tee /boot/refind_linux.conf
vi /boot/refind_linux.conf

# --- update automation
mkdir -pv /etc/pacman.d/hooks
{
echo '[Trigger]'
echo 'Operation=Upgrade'
echo 'Type=Package'
echo 'Target=refind-efi'
echo ''
echo '[Action]'
echo 'Description = Updating rEFInd on ESP'
echo 'When=PostTransaction'
echo 'Exec=/usr/bin/refind-install'
} >/etc/pacman.d/hooks/refind.hook
vi /etc/pacman.d/hooks/refind.hook

echo '---------------------------------------->>(EOF)'
