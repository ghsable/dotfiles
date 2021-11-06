#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL VSCode

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  code

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# code          : VSCode(OSS)'
    echo '# gnome-keyring : Copilot needs it'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S code \
                   gnome-keyring
    sudo pacman -Sc
    ;;
  deploy)
    readonly THIS_DIR="${HOME}/bin/code"
    ln -snfv "${THIS_DIR}/.vscode-oss/argv.json" "${HOME}/.vscode-oss"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
