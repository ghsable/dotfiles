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
    echo '# jre10-openjdk-headless,jre10-openjdk,'
    echo '# jdk10-openjdk,openjdk10-doc,openjdk10-src : Java SE 10'
    }
    sudo pacman -Syu
    sudo pacman -S jre10-openjdk-headless jre10-openjdk jdk10-openjdk openjdk10-doc openjdk10-src
    sudo pacman -Sc
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
