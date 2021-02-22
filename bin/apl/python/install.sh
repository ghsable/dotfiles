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
  ls ~/.local/bin

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
    echo '# flake8   : lint(http://flake8.pycqa.org/en/latest/)'
    echo '# pytest   : test suite(https://docs.pytest.org/en/stable/contents.html)'
    echo '# codecov  : test suite(https://codecov.io/)'
    echo '# sphixn   : documents(https://github.com/sphinx-doc/sphinx)'
    echo '# Flask    : Web Application Framework(https://flask.palletsprojects.com/en/1.1.x/)'
    echo '# gunicorn : WSGI(https://gunicorn.org/)'
    echo '# uWSGI    : WSGI(https://uwsgi-docs.readthedocs.io/en/latest/)'
    }
    python -m pip install --user flake8 pytest codecov sphinx \
                                 Flask gunicorn uWSGI \
                                 line-bot-sdk pya3rt
    ;;
  update-components)
    pip install $(pip freeze --local | cut -d "=" -f 1-1) -U --user
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
