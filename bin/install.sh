#!/bin/bash

function gitclone_cd_dotfiles() {
  readonly DOTFILES_URL="https://github.com/ghsable/dotfiles.git"
  git clone ${DOTFILES_URL} ~/dotfiles
  cd ~/dotfiles
  return 0
}

function select_install() {
  {
  echo '--------------------'
  echo '# Please type ...'
  echo '# macos | archlinux'
  echo '--------------------'
  }
  read -r OS_NAME
  {
  echo '--------------------'
  }
  make ${OS_NAME}_install
  return 0
}

gitclone_cd_dotfiles
select_install
