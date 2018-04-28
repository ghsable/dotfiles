#!/bin/bash

CMND01='sleep 1s'


timedatectl status                && ${CMND01} &&   #Show System Clock
screenfetch                       && ${CMND01} &&   #Show System Info
echo ${SHELL}                     && ${CMND01} &&   #Show Default SHELL
lspci | grep -e VGA -e 3D         && ${CMND01} &&   #Show VGA
lsmod | grep '^snd' | column -t   && ${CMND01} &&   #Show SoundModule
systemctl list-unit-files         && ${CMND01}      #Show ServicesList
