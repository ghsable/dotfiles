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
  cd ~/.config/fcitx5

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# fcitx5-im         : Input method Framework(Group)'
    echo '# fcitx5-configtool : fcitx-config-gtk3'
    echo '# fcitx5-mozc       : Input System'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S fcitx5-im fcitx5-configtool \
                   fcitx5-mozc
    sudo pacman -Sc
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
