#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Rust

Usage:
  sh ${0} install-packages : INSTALL        Packages
  sh ${0} rustup-install   : INSTALL        Components(rustup)
  sh ${0} set-stable       : SET            stable  channnel(rustup)
  sh ${0} set-nightly      : SET            nightly channnel(rustup)
  sh ${0} rustup-update    : UPDATE         Components(rustup)
  sh ${0} cargo-install    : INSTALL/UPDATE Components(cargo)
  sh ${0} *                : USAGE

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
    echo '--------------------------------------------------'
    echo '# --- official'
    echo '# rustup     : Rust ecosystem(https://rustup.rs/)'
    echo '# --- distribution'
    echo '# rustup     : Rust ecosystem'
    echo '# rust-racer : Rust code completion and navigation'
    echo '--------------------------------------------------'
    }
    # --- official
    curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path

    # --- distribution
    #sudo pacman -Syu
    #sudo pacman -S rustup \
    #               rust-racer
    #sudo pacman -Sc
    ;;
  rustup-install)
    {
    # toolchain
    echo '# nightly  : rust-nightly'
    # component
    echo '# rust-src : rust source code'
    }
    # toolchain
    rustup toolchain add nightly
    # component
    rustup component add rust-src
    ;;
  set-stable | set-nightly)
    rustup default ${1#*-}
    ;;
  rustup-update)
    rustup self update
    ;;
  cargo-install)
    {
    echo '# Racer : Rust Auto-Complete-er.'
    }
    cargo +nightly install -f racer
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
