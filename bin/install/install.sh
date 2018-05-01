#!/bin/bash

### Function ###
function cd_dotfiles() {
  git clone https://github.com/ghsable/dotfiles.git ~/dotfiles
  cd ~/dotfiles/
  return 0
}

function select_install() {
  echo "--------------------"
  echo "# Please type ..."
  echo "# macos | archlinux"
  echo "--------------------"
  read -r _os
  echo "--------------------"
  make ${_os}_install
  return 0
}

### Run ###
cd_dotfiles
select_install
