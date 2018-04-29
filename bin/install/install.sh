#!/bin/bash

### Function ###
# A
function cd_dotfiles() {
  cd ~/
  git clone https://github.com/ghsable/dotfiles.git ~/dotfiles
  cd ~/dotfiles/
  return 0
}

# B
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
# A
cd_dotfiles
# B
select_install
