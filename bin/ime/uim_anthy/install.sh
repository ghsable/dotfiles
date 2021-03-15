#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Input Method Framework

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  cd ~/.uim.d
  cd ~/.anthy

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '# uim   : Input Method Framework'
    echo '# anthy : Input System'
    }
    sudo pacman -Syu
    sudo pacman -S uim \
                   anthy
    sudo pacman -Sc
    ;;
  deploy)
    mkdir -pv ~/.uim.d ~/.anthy
    # --- ln
    readonly THIS_DIR="${HOME}/bin/ime/uim_anthy"
    # Input Method Framework(Uim)
    ln -snfv "${THIS_DIR}/.uim.d/customs" "${HOME}/.uim.d"
    # Authy(cannadic)
    ln -snfv "${THIS_DIR}/.anthy/imported_words_default.d" "${HOME}/.anthy"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
