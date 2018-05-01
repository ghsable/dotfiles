#!/bin/bash

# Set localtime
ln -snfv /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# Set hwclock UTC
hwclock --systohc --utc

# Set /etc/locale.gen
{
echo '#################### THIS CONFIG ####################'
echo 'en_US.UTF-8 UTF-8'
echo 'ja_JP.UTF-8 UTF-8'
}  >>/etc/locale.gen
locale-gen

# Set LANG/KEYMAP
echo 'LANG=en_US.UTF-8' >/etc/locale.conf
echo 'KEYMAP=jp106'     >/etc/vconsole.conf

# Set hostname
echo 'localarch' >/etc/hostname
echo -e "127.0.1.1\tlocalarch.localdomain\tlocalarch" >>/etc/hosts

# Set /etc/mkinitcpio.conf + Create 'Initial RAM Disk'
{
echo '#################### PLEASE REPLACE THIS LINE ####################'
echo 'HOOKS=(base udev block autodetect modconf block filesystems keyboard fsck)'
} >>/etc/mkinitcpio.conf
vi /etc/mkinitcpio.conf
mkinitcpio -p linux

# Set root passwd
passwd

# System Update
pacman -Syu

# grub-Install
pacman -S efibootmgr intel-ucode grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub --removable --recheck

# Add /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg

# OFF Kernel Mode Setting(KMS)
{
echo '#################### PLEASE REPLACE THIS LINE ####################'
echo 'GRUB_CMDLINE_LINUX_DEFAULT="nomodeset"'
} >>/etc/default/grub
vi /etc/default/grub

# Set Network(Install NetworkManager + systemctl enable)
pacman -S networkmanager
systemctl enable NetworkManager.service

# Install sudo + Set /etc/sudoers
pacman -S sudo
{
echo '#################### THIS CONFIG ####################'
echo 'Defaults env_keep += "HOME"'
echo '%wheel ALL=(ALL) ALL'
} >>/etc/sudoers

# Set journald(journal -> RAM)
{
echo '[Journal]'
echo 'Storage=volatile'
echo 'RuntimeMaxUse=30M'
} >/etc/systemd/journald.conf.d/usbstick.conf

# Install git
pacman -S git

# Check Status
vi /etc/locale.gen
vi /etc/locale.conf
vi /etc/vconsole.conf
vi /etc/hostname
vi /etc/sudoers
vi /boot/grub/grub.cfg
vi /etc/systemd/journald.conf.d/usbstick.conf
