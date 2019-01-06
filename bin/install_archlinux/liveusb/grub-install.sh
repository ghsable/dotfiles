#!/bin/bash

echo "${0} ..."

# ------ GRUB ------
# --- install
# intel-ucode : update Microcode
# efibootmgr  : operation UEFI-firmware
# grub        : boot loader
pacman -Syu
pacman -S intel-ucode \
          efibootmgr grub
pacman -Sc

# --- grub-install
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --removable --recheck

# --- Add /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg
vi /boot/grub/grub.cfg

# --- OFF Kernel Mode Setting(KMS)
{
echo '#################### PLEASE REPLACE THIS LINE ####################'
echo 'GRUB_CMDLINE_LINUX_DEFAULT="nomodeset"'
} >>/etc/default/grub
vi /etc/default/grub

echo '---------------------------------------->>(EOF)'
