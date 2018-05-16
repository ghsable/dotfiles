#!/bin/bash

### FUNCTION ###
function gitclone_cd_dotfiles() {
  git clone https://github.com/ghsable/dotfiles.git ~/dotfiles
  cd ~/dotfiles/
  return 0
}

function select_install() {
  {
  echo "--------------------"
  echo "# Please type ..."
  echo "# macos | archlinux"
  echo "--------------------"
  }
  read -r os_name
  {
  echo "--------------------"
  }
  make ${os_name}_install
  return 0
}

### RUN ###
gitclone_cd_dotfiles
select_install
