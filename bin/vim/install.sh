#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Vim

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  vim ~/.vimrc

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# vim   : text editor'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S vim
    sudo pacman -Sc
    ;;
  deploy)
    readonly THIS_DIR="${HOME}/bin/vim"
    ln -snfv "${THIS_DIR}/.vimrc" "${HOME}"
    ln -snfv "${THIS_DIR}/.vim/init.vim"    "${HOME}/.vim"
    ln -snfv "${THIS_DIR}/.vim/package-config" "${HOME}/.vim"
    ln -snfv "${THIS_DIR}/.vim/plugin-config"  "${HOME}/.vim"
    # vimpacks(my plugins list)
    ln -snfv "${THIS_DIR}/.config/vimpacks" "${HOME}/.config/vimpacks"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
