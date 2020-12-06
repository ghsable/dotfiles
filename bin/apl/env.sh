#!/bin/bash

### RUST ###
# --- ${PATH}
# $(curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path) -> ~/.cargo/bin/*
export PATH=${PATH}:${HOME}/.cargo/bin

# --- rust-src
# AUR(https://aur.archlinux.org/packages/rust-src/)
# $(rustc --print sysroot) -> /usr
#export RUST_SRC_PATH=/usr/lib/rustlib/src/rust/src
# $(rustup component add rust-src)
# $(rustc --print sysroot) -> ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu
export RUST_SRC_PATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

### Python ###
# --- ${PATH}
# $(pip install "package-name" --user) -> ~/.local/bin/*
export PATH=${PATH}:${HOME}/.local/bin
