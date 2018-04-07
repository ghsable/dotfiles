#!/bin/bash

STRG00="<------------------ Menu ------------------>"
STRG01="[Step.01] ## ... Install Applications ... ##"
STRG02="[Step.02] ## ... Set Configurations ..... ##"
STRG03="[Step.03] ## ... Set Symbolic Links ..... ##"
STRG04="<-------------- Let's Start! -------------->"
STRG05="<------------- Installed Apps ------------->" 
STRG06="<-------------- Please Check -------------->" 
STRG07="<------------ Finished! Thanks!------------>"

PATH01=~/dotfiles/bin/install_apps.sh
PATH02=~/dotfiles/bin/install_config.sh
PATH03=~/dotfiles/bin/install_links.sh
PATH04=~/dotfiles/bin/install_check.sh

CMND01='sleep 1s'


date           && ${CMND01} &&   #Date
echo ${STRG00} && ${CMND01} &&   #Message "Menu"
echo ${STRG01} && ${CMND01} &&   #Message "Install Applications"
echo ${STRG02} && ${CMND01} &&   #Message "Set Configurations"
echo ${STRG03} && ${CMND01} &&   #Message "Set Symbolic Links"
echo ${STRG04} && ${CMND01} &&   #Message "Let's Start!"

echo ${STRG01} && ${CMND01} &&   #Message "Install Applications"
sh   ${PATH01} && ${CMND01} &&   #sh      'install_apps.sh'

echo ${STRG02} && ${CMND01} &&   #Message "Set Configurations"
sh   ${PATH02} && ${CMND01} &&   #sh      'install_config.sh'

echo ${STRG03} && ${CMND01} &&   #Message "Set Symbolic Links"
sh   ${PATH03} && ${CMND01} &&   #sh      'install_links.sh'
echo ${STRG05} && ${CMND01} &&   #Message "Installed Apps"

echo ${STRG06} && ${CMND01} &&   #Message "Please Check"
sh   ${PATH04} && ${CMND01} &&   #sh      'install_check.sh'

echo ${STRG07}                   #Message "Finished! Thanks!"
