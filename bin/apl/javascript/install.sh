#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL JavaScript

Usage:
  sh ${0} install-packages   : INSTALL Packages
  sh ${0} install-components : INSTALL Components(npm)
  sh ${0} *                  : USAGE

EOF:
  node
  npm

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# nodejs : JavaScript runtime environment combined with useful libraries'
    echo '# npm    : Node Package Manager'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S nodejs npm
    sudo pacman -Sc
    ;;
  install-components)
    {
    echo '--------------------------------------------------'
    echo '# addons-linter : Firefox Add-ons linter(https://github.com/mozilla/addons-linter)'
    echo '--------------------------------------------------'
    }
    readonly NODE_DIR=~/javascript
    [ -d ${NODE_DIR} ] || mkdir -pv ${NODE_DIR}
    cd ${NODE_DIR}
    npm install addons-linter
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
