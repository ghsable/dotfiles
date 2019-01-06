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
readonly REFINDCONF_FILE=/boot/refind-linux.conf
tac ${REFINDCONF_FILE} | tee ${REFINDCONF_FILE}
vi ${REFINDCONF_FILE}

echo '---------------------------------------->>(EOF)'
