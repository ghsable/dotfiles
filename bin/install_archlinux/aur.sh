#!/bin/bash

echo "${0} ..."

readonly AUR_DIR=~/aur
[ -d ${AUR_DIR} ] || mkdir -pv ${AUR_DIR}

function usage() {
cat<< _EOT_
Description:
  SETUP AUR(Arch User Repository)

Usage:
  sh ${0} install : INSTALL AUR_PKGS
  sh ${0} update  : UPDATE  AUR_PKGS 
  sh ${0} *       : USAGE

EOF:
  ls -l ${AUR_DIR}

_EOT_
exit 1
}

case ${1} in
  install)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/aur.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 4-4 | cut -d "." -f 1-1`
      git clone ${GITREPOSITORY_URL} ${AUR_DIR}/${GITCLONEDIR_NAME} 2>/dev/null
      if [ "${?}" = "0" ]; then
        cd ${AUR_DIR}/${GITCLONEDIR_NAME}
        vi PKGBUILD
        makepkg -si
        cd ${AUR_DIR}
      else
        echo "INSTALLED : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  update)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/aur.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 4-4 | cut -d "." -f 1-1`
      if [ -d ${AUR_DIR}/${GITCLONEDIR_NAME} ]; then
        cd ${AUR_DIR}/${GITCLONEDIR_NAME}
        GITPULL_STDOUT=`git pull`
        if [ "${GITPULL_STDOUT}" != "Already up to date." ]; then
          git pull
          vi PKGBUILD
          makepkg -si
          cd ${AUR_DIR}
        else
          echo "UPDATED : ${GITCLONEDIR_NAME}"
          cd ${AUR_DIR}
        fi 
      else
        echo "PLEASE INSTALL : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
