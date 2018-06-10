#!/bin/bash

readonly AUR_DIR=~/aur

mkdir -pv ${AUR_DIR}

for GITREPOSITORY_URL in $(grep -v -e '^$' -e '^#' $(dirname ${0})/aur.txt)
do
  GITCLONEDIR_NAME=`echo ${GITREPOSITORY_URL} | cut -d "/" -f 4-4 | cut -d "." -f 1-1`
  git clone ${GITREPOSITORY_URL} ${AUR_DIR}/${GITCLONEDIR_NAME}
  cd ${AUR_DIR}/${GITCLONEDIR_NAME}
  vi PKGBUILD
  makepkg -si
  cd ..
done

echo '---------------------------------------->>(EOF)'
