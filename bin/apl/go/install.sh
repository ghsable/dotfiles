#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Go

Usage:
  sh ${0} install-packages : INSTALL Packages
  sh ${0} *                : USAGE

EOF:
  go version

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# go     : Compilation tool interface'
    echo '# gcc-go : gcc front end'
    echo '# hugo   : a static HTML and CSS website generator'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S go \
                   gcc-go \
                   hugo
    sudo pacman -Sc
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
