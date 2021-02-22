#!/bin/bash

### RUST ###
# --- ${PATH}
# $(curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path) -> ~/.cargo/bin/*
export PATH=${PATH}:${HOME}/.cargo/bin

### Python ###
# --- ${PATH}
# $(pip install "package-name" --user) -> ~/.local/bin/*
export PATH=${PATH}:${HOME}/.local/bin
