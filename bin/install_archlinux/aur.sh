#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  SET XXX

Usage:
  sh ${0} XXX : xxx
  sh ${0} XXX : xxx
  sh ${0} *   : USAGE

EOF:
  XXX

_EOT_
exit 1
}

readonly AUR_DIR=~/aur

case ${1} in
  mkdir)
    mkdir -pv ${AUR_DIR}
    ;;
  cd)
    cd ${AUR_DIR}
    ;;
  clone)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/aur.txt)
    do
      git clone ${GITREPOSITORY_URL} ${AUR_DIR}
    done
    ;;
  echo)
    echo $(grep -v -e '^$' -e '^#' $(dirname ${0})/aur.txt)
    ;;
  *)
    usage
    ;;
esac


echo '---------------------------------------->>(EOF)'
