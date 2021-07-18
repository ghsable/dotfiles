#!/bin/bash

readonly SHOGI_DIR=~/shogi
[ -d ${SHOGI_DIR} ] || mkdir -pv ${SHOGI_DIR}
[ -d ${SHOGI_DIR}/Engine ] || mkdir -pv ${SHOGI_DIR}/Engine
ln -snf ~/private/Document/KIF ${SHOGI_DIR}/KIF

#---- Requirement: Mono
# GUI - Shogidokoro - http://shogidokoro.starfree.jp/
if [ ! -d "${SHOGI_DIR}/Shogidokoro" ]; then
  cd ${SHOGI_DIR}
  curl -O http://shogidokoro.starfree.jp/download/Shogidokoro.zip
  unzip -o Shogidokoro.zip
  rm Shogidokoro.zip
fi

#---- Requirement: Rust
# USI shogi engine - apery_rust - https://github.com/HiraokaTakuya/apery_rust
readonly RUST_DIR=~/rust
[ -d ${RUST_DIR} ] || mkdir -pv ${RUST_DIR}
if [ ! -d "${RUST_DIR}/apery_rust" ]; then
  cd ${RUST_DIR}
  git clone --recursive https://github.com/HiraokaTakuya/apery_rust.git
  cd ${RUST_DIR}/apery_rust
  cargo build --release
  ln -snfv ${RUST_DIR}/apery_rust/eval ${RUST_DIR}/apery_rust/target/release/eval
  ln -snfv ${RUST_DIR}/apery_rust ${SHOGI_DIR}/Engine/apery_rust
fi

# Run
mono ${SHOGI_DIR}/Shogidokoro/Shogidokoro.exe
