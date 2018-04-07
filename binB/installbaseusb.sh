#!/bin/bash

# Set localtime
ln -sfv /usr/share/zoneinfo/Asia/Tokyo /etc/localtime                                                     &&

# Set hwclock UTC
hwclock --systohc --utc                                                                                   &&

# Set /etc/locale.gen
echo '### My Config ###' >> /etc/locale.gen                                                               &&
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen                                                               &&
echo 'ja_JP.UTF-8 UTF-8' >> /etc/locale.gen                                                               &&
locale-gen                                                                                                &&

# Set LANG/KEYMAP
echo 'LANG=en_US.UTF-8' > /etc/locale.conf                                                                &&
echo 'KEYMAP=jp106'     > /etc/vconsole.conf                                                              &&

# Set hostname
echo 'localarch' > /etc/hostname                                                                          &&
echo '127.0.1.1 localarch.localdomain localarch' >> /etc/hosts                                            &&
vi /etc/hosts                                                                                             &&

# UPDATE + Install
pacman -Syu                                                                                               &&
pacman -S networkmanager modemmanager sudo grub efibootmgr intel-ucode                                    &&

# Set /etc/sudoers
echo '### My Config ###' >> /etc/sudoers                                                                  &&
echo 'Defaults env_keep += "HOME"' >> /etc/sudoers                                                        && 
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers                                                               &&

# Set /etc/mkinitcpio.conf + Create 'Initial RAM Disk'
echo '### My Config ###' >> /etc/mkinitcpio.conf                                                          &&
echo 'HOOKS="base udev block autodetect modconf block filesystems keyboard fsck"' >> /etc/mkinitcpio.conf &&
vi /etc/mkinitcpio.conf                                                                                   &&
mkinitcpio -p linux                                                                                       &&

# Set root passwd
passwd                                                                                                    &&

# Install grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --removable --recheck         &&

# Add /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg                                                                      &&

# Check Status
vi /etc/locale.gen                                                                                        &&
vi /etc/locale.conf                                                                                       &&
vi /etc/vconsole.conf                                                                                     &&
vi /etc/hostname                                                                                          &&
vi /etc/sudoers                                                                                           &&
vi /boot/grub/grub.cfg
