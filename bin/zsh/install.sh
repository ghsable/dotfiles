#!/bin/bash

echo "${0} ..."

# --- mkdir ZSH-Plugins-Directory
readonly ZSHPLUGINS_DIR=~/.zsh/plugins
[ -d ${ZSHPLUGINS_DIR} ] || mkdir -pv ${ZSHPLUGINS_DIR}

function usage() {
cat<< _EOT_
Description:
  INSTALL ZSH

Usage:
  sh ${0} install-packages : INSTALL Packages
  sh ${0} install-plugins  : INSTALL Plugins
  sh ${0} update-plugins   : UPDATE  Plugins
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
    {
    echo '--------------------------------------------------'
    echo '# zsh : shell'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S zsh
    sudo pacman -Sc
    ;;
  install-plugins)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/install.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | rev | cut -c 5- | rev`
      git clone --depth=1 ${GITREPOSITORY_URL} ${ZSHPLUGINS_DIR}/${GITCLONEDIR_NAME} 2>/dev/null
      if [ "${?}" = "0" ]; then
        echo "-> (1/1) ${GITCLONEDIR_NAME}"
      else
        echo "INSTALLED : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  update-plugins)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/install.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | rev | cut -c 5- | rev`
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
