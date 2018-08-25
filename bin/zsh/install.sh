#!/bin/bash

echo "${0} ..."

# --- mkdir ZSHPLUGINS-Directory
readonly ZSHPLUGINS_DIR=~/.zsh/plugins
[ -d ${ZSHPLUGINS_DIR} ] || mkdir -pv ${ZSHPLUGINS_DIR}

function usage() {
cat<< _EOT_
Description:
  SETUP ZSH

Usage:
  sh ${0} install-packages : INSTALL ZSHPLUGINS_PKGS
  sh ${0} install-plugins  : INSTALL ZSHPLUGINS_PKGS
  sh ${0} update           : UPDATE  ZSHPLUGINS_PKGS 
  sh ${0} deploy           : DEPLOY  Configs
  sh ${0} chsh             : CHANGE  Shell
  sh ${0} *                : USAGE

EOF:
  ls -l ${ZSHPLUGINS_DIR}

_EOT_
exit 1
}

case ${1} in
  install-packages)
    sudo pacman -Syu
    sudo pacman -S zsh
    sudo pacman -Sc
    ;;
  install-plugins)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/install.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | cut -d "." -f 1-1`
      git clone ${GITREPOSITORY_URL} ${ZSHPLUGINS_DIR}/${GITCLONEDIR_NAME} 2>/dev/null
      if [ "${?}" = "0" ]; then
        echo "-> (1/1) ${GITCLONEDIR_NAME}"
      else
        echo "INSTALLED : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  update)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/install.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | cut -d "." -f 1-1`
      if [ -d ${ZSHPLUGINS_DIR}/${GITCLONEDIR_NAME} ]; then
        cd ${ZSHPLUGINS_DIR}/${GITCLONEDIR_NAME}
        GITPULL_STDOUT=`git pull`
        if [ "${GITPULL_STDOUT}" != "Already up to date." ]; then
          git pull
          echo "-> (1/1) ${GITCLONEDIR_NAME}"
          cd ${ZSHPLUGINS_DIR}
        else
          echo "UPDATED : ${GITCLONEDIR_NAME}"
          cd ${ZSHPLUGINS_DIR}
        fi 
      else
        echo "PLEASE INSTALL : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  deploy)
    readonly THIS_DIR="${HOME}/bin/zsh"
    ln -snfv "${THIS_DIR}/.zlogin" "${HOME}"
    ln -snfv "${THIS_DIR}/.zshrc"  "${HOME}"
    ;;
  chsh)
    chsh -s $(which zsh)
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
