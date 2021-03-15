#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Input Method Framework

Usage:
  sh ${0} install-packages : INSTALL Packages
  sh ${0} install-themes   : INSTALL Themes
  sh ${0} deploy           : DEPLOY  Configs
  sh ${0} *                : USAGE

EOF:
  cd ~/.config/fcitx5
  cd ~/.local/share/fcitx5/themes

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# fcitx5-im         : Input Method Framework(Group)'
    echo '# fcitx5-configtool : fcitx-config-gtk3'
    echo '# fcitx5-mozc       : Input System'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S fcitx5-im fcitx5-configtool \
                   fcitx5-mozc
    sudo pacman -Sc
    ;;
  install-themes)
    readonly CONF_DIR="${HOME}/.local/share/fcitx5/themes"

    mkdir -pv ${CONF_DIR}

    # c25vdw/fcitx5-gruvbox(https://github.com/c25vdw/fcitx5-gruvbox)
    rm -rf ${CONF_DIR}/gruvbox-dark
    git clone https://github.com/c25vdw/fcitx5-gruvbox.git ${CONF_DIR}/gruvbox-dark
    cp ${CONF_DIR}/gruvbox-dark/gruvbox-dark/theme.conf ${CONF_DIR}/gruvbox-dark

    # cjxgm/fcitx5-dark-numix(https://github.com/cjxgm/fcitx5-dark-numix)
    rm -rf ${CONF_DIR}/fcitx5-dark-numix
    git clone https://github.com/cjxgm/fcitx5-dark-numix.git ${CONF_DIR}/fcitx5-dark-numix
    ;;
  deploy)
    # --- ln
    readonly THIS_DIR="${HOME}/bin/ime/fcitx5_mozc"
    # ------ DIRECTORY PATH ------
    ln -snfv "${THIS_DIR}/fcitx5" "${HOME}/.config"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
