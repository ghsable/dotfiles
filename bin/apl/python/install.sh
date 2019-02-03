#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Python

Usage:
  sh ${0} install-packages   : INSTALL Packages
  sh ${0} install-components : INSTALL Components(pip)
  sh ${0} update-components  : UPDATE  Components(pip)
  sh ${0} *                  : USAGE

EOF:
  python -V
  pip -V

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '--------------------------------------------------'
    echo '# python     : generic scripting language'
    echo '# python-pip : Python ecosystem(https://pip.pypa.io/en/stable/)'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S python \
                   python-pip
    sudo pacman -Sc
    ;;
  install-components)
    {
    echo '# flake8 : lint(http://flake8.pycqa.org/en/latest/)'
    }
    pip install flake8 --user
    ;;
  update-components)
    pip install $(pip freeze --local | cut -d "=" -f 1-1) -U --user
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
