#!/bin/bash

echo "${0} ..."

# --- mkdir VIM-Plugins-Directory
readonly VIM_START_DIR=~/.vim/pack/mypackage/start
readonly VIM_OPT_DIR=~/.vim/pack/mypackage/opt
[ -d ${VIM_START_DIR} ] || mkdir -pv ${VIM_START_DIR}
[ -d ${VIM_OPT_DIR}   ] || mkdir -pv ${VIM_OPT_DIR}

function usage() {
cat<< _EOT_
Description:
  SETUP ZSH

Usage:
  sh ${0} install-packages : INSTALL Vim_Packages
  sh ${0} install-plugins  : INSTALL Vim_Plugins
  sh ${0} update-plugins   : UPDATE  Vim_Plugins
  sh ${0} deploy           : DEPLOY  Vim_Configs
  sh ${0} *                : USAGE

EOF:
  ls -l ${VIM_START_DIR}
  ls -l ${VIM_OPT_DIR}

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '# vim   : text editor'
    echo '# ctags : tagjump(<C-]>,<C-t>,<C-x><C-]>)($ ctags -R -f .tags)'
    }
    sudo pacman -Syu
    sudo pacman -S vim \
                   ctags
    sudo pacman -Sc
    ;;
  install-plugins)
    for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/install.txt)
    do
      GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 5-5 | rev | cut -c 5- | rev`
      git clone --depth=1 ${GITREPOSITORY_URL} ${VIM_START_DIR}/${GITCLONEDIR_NAME} 2>/dev/null
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
      if [ -d ${VIM_START_DIR}/${GITCLONEDIR_NAME} ]; then
        cd ${VIM_START_DIR}/${GITCLONEDIR_NAME}
        GITPULL_STDOUT=`git pull`
        if [ "${GITPULL_STDOUT}" != "Already up to date." ]; then
          git pull
          echo "-> (1/1) ${GITCLONEDIR_NAME}"
          cd ${VIM_START_DIR}
        else
          echo "UPDATED : ${GITCLONEDIR_NAME}"
          cd ${VIM_START_DIR}
        fi 
      else
        echo "PLEASE INSTALL : ${GITCLONEDIR_NAME}"
      fi
    done
    ;;
  deploy)
    readonly THIS_DIR="${HOME}/bin/vim"
    ln -snfv "${THIS_DIR}/.vimrc"   "${HOME}"
    ln -snfv "${THIS_DIR}/myconfig" "${HOME}/.vim/myconfig"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
