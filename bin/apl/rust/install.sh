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
    echo '# rustup     : Rust Toolchain manager(https://rustup.rs/)'
    echo '# --- distribution'
    echo '# rust       : rustc, Cargo'
    echo '# rustup     : Rust Toolchain manager'
    echo '--------------------------------------------------'
    }
    # --- official
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --no-modify-path

    # --- distribution
    #sudo pacman -Syu
    #sudo pacman -S rust \
    #               rustup
    #sudo pacman -Sc
    ;;
  rustup-install)
    {
    echo '# nightly : rust-nightly'
    }
    rustup toolchain add nightly
    ;;
  set-stable | set-nightly)
    rustup default ${1#*-}
    rustup show
    ;;
  rustup-update)
    rustup self update
    ;;
  cargo-install)
    {
    echo '# xxx : xxxxx.'
    }
    #cargo +nightly install -f xxx
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
