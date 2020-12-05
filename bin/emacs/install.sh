#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Emacs

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  -

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# emacs : text editor'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S emacs
    sudo pacman -Sc
    ;;
  deploy)
    readonly THIS_DIR="${HOME}/bin/emacs"
    ln -snfv "${THIS_DIR}/.emacs.d" "${HOME}"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
