#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Tex Live

Usage:
  sh ${0} install-packages : INSTALL Packages
  sh ${0} deploy           : DEPLOY  Configs
  sh ${0} *                : USAGE

EOF:
  tex -version

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# texlive-most      : Applications'
    echo '# texlive-lang      : Character set & Non-English speaking function'
    echo '# texlive-core      : texmf-dist tree'
    echo '# texlive-bin       : Binary and library'
    echo '# texlive-langextra : Language support(Africa,Arabia,Armenia,Croatia,Hebrew India,Mongolia,Tibet,Vietnam)'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S texlive-most  \
                   texlive-lang \
                   texlive-core \
                   texlive-bin  \
                   texlive-langextra
    sudo pacman -Sc
    ;;
  deploy)
    readonly THIS_DIR="${HOME}/bin/apl/tex"
    ln -snfv "${THIS_DIR}/.latexmkrc" "${HOME}"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
