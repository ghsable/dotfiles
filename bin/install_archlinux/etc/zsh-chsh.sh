#!/bin/bash

echo "${0} ..."

# ------ INSTALL pkgs ------
# --- pacman
# Shell
sudo pacman -S zsh

# ------ INSTALL plugins ------
# --- mkdir/cd ZSH-Plugins-Directory
readonly ZSHPLUGINS_DIR=~/.zsh/plugins
[ -d ${ZSHPLUGINS_DIR} ] || mkdir -pv ${ZSHPLUGINS_DIR}
cd ${ZSHPLUGINS_DIR}
# --- git clone -> ${ZSHPLUGINS_DIR}
# zsh-users/zsh-syntax-highlighting(https://github.com/zsh-users/zsh-syntax-highlighting)
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
cd zsh-syntax-highlighting
git pull
cd ${ZSHPLUGINS_DIR}

# --- Change Shell
chsh -s $(which zsh)
