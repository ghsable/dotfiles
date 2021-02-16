#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Input method Framework

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  cd ~/.config/fcitx

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# fcitx-im         : Input method Framework(Group)'
    echo '# fcitx-configtool : fcitx-config-gtk3'
    echo '# fcitx-mozc       : Input System'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S fcitx-im fcitx-configtool \
                   fcitx-mozc
    sudo pacman -Sc
    ;;
  deploy)
    # --- mkdir
    mkdir -pv ~/.config/fcitx
    # --- ln
    readonly THIS_DIR="${HOME}/bin/ime/fcitx_mozc"
    # ------ FILE PATH ------
    # Input Method Framework(fcitx)
    ln -snfv "${THIS_DIR}/.config/fcitx/config" "${HOME}/.config/fcitx"
    # ------ DIRECTORY PATH ------
    # Input Method Framework(fcitx)
    ln -snfv "${THIS_DIR}/.config/fcitx/conf" "${HOME}/.config/fcitx"
    ln -snfv "${THIS_DIR}/.config/fcitx/data" "${HOME}/.config/fcitx"
    ln -snfv "${THIS_DIR}/.config/fcitx/skin" "${HOME}/.config/fcitx"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
