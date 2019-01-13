#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Rust

Usage:
  sh ${0} install-packages   : INSTALL packages
  sh ${0} set-stable         : SET     stable channnel(rustup)
  sh ${0} install-components : INSTALL components(rustup)
  sh ${0} update-components  : UPDATE  components(rustup)
  sh ${0} *                  : USAGE

EOF:
  rustup -V
  cargo -V
  rustc -V

_EOT_
exit 1
}

case ${1} in
  install-packages)
    {
    echo '# --- official'
    echo '# rustup     : Rust ecosystem(https://rustup.rs/)'
    echo '#curl https://sh.rustup.rs -sSf | sh'

    echo '# --- distribution'
    echo '# rustup     : Rust ecosystem'
    echo '# rust-racer : Rust code completion and navigation'
    }
    sudo pacman -Syu
    sudo pacman -S rustup \
                   rust-racer
    sudo pacman -Sc
    ;;
  set-stable)
    rustup default stable
    ;;
  install-components)
    {
    echo '# rust-src : rust source code'
    }
    rustup component add rust-src
    ;;
  update-components)
    rustup update
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
