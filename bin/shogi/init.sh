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
  unar Shogidokoro.zip
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

#---- Requirement: none
# USI shogi engine - 水匠 - https://twitter.com/tayayan_ts
# 水匠4 - https://twitter.com/tayayan_ts/status/1416621532164497411
if [ ! -d "${SHOGI_DIR}/Engine/水匠4" ]; then
  # Thanks - https://www.matthuisman.nz/2019/01/download-google-drive-files-wget-curl.html
  readonly fileid="1YwqmlQhfnRZDSrpISYNa4HvQaS9tEqvy"
  readonly filename="suisho.zip"
  cd ${SHOGI_DIR}/Engine
  curl -L -c cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid \
       | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' >confirm.txt
  curl -L -b cookies.txt -o $filename \
       'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(<confirm.txt)
  unar $filename
  rm -f confirm.txt cookies.txt $filename
fi

# Run
mono ${SHOGI_DIR}/Shogidokoro/Shogidokoro.exe
