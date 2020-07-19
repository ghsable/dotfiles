#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Firefox

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  firefox

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# firefox : web browser'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S firefox firefox-i18n-ja
    sudo pacman -Sc
    ;;
  deploy)
    # userChrome.css
    ln -snfv "${HOME}/bin/firefox/chrome" "${HOME}/.mozilla/firefox/8im9ova9.default"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
