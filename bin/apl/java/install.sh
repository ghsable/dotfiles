#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Java

Usage:
  sh ${0} install-packages : INSTALL Packages
  sh ${0} *                : USAGE

EOF:
  java -version

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# jre-*,jdk-*,openjdk-* : OpenJDK'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S jre-openjdk-headless jre-openjdk jdk-openjdk openjdk-doc openjdk-src
    sudo pacman -Se
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
