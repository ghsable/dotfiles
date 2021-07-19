#!/bin/bash

readonly SHOGI_DIR=~/shogi
[ -d ${SHOGI_DIR} ] || mkdir -pv ${SHOGI_DIR}
[ -d ${SHOGI_DIR}/Engine ] || mkdir -pv ${SHOGI_DIR}/Engine
[ -d ${SHOGI_DIR}/Engine/Book ] || mkdir -pv ${SHOGI_DIR}/Engine/Book
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

#---- Requirement: clang++
# USI shogi engine - やねうら王 - https://github.com/yaneurao/YaneuraOu
if [ ! -d "${SHOGI_DIR}/Engine/YaneuraOu" ]; then
  cd ${SHOGI_DIR}/Engine
  git clone --recursive https://github.com/yaneurao/YaneuraOu.git
  cp -f ~/bin/shogi/YaneuraOu/Makefile ${SHOGI_DIR}/Engine/YaneuraOu/source/Makefile
  cd ${SHOGI_DIR}/Engine/YaneuraOu/source
  make
fi

# Thanks - https://www.matthuisman.nz/2019/01/download-google-drive-files-wget-curl.html
function download_google_drive() {
    fileid=${1}
    filename="opt.zip"
    cd ${SHOGI_DIR}/Engine
    curl -L -c cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid \
         | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' >confirm.txt
    curl -L -b cookies.txt -o $filename \
         'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(<confirm.txt)
    unar $filename
    rm -f confirm.txt cookies.txt $filename
}

#---- Requirement: YaneuraOu(WCSOC2020), g++
# USI shogi engine - 水匠 - https://twitter.com/tayayan_ts
# 水匠4 - https://twitter.com/tayayan_ts/status/1416621532164497411
if [ ! -d "${SHOGI_DIR}/Engine/水匠4" ]; then
  download_google_drive "1YwqmlQhfnRZDSrpISYNa4HvQaS9tEqvy"
fi

#---- Requirement: YaneuraOu
# Evaluation function - リゼロ評価関数 epoch8 - https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md
if [ ! -d "${SHOGI_DIR}/Engine/epoch8" ]; then
  download_google_drive "0Bzbi5rbfN85NMHd0OEUxcUVJQW8"
  mv ${SHOGI_DIR}/Engine/epoch8 ${SHOGI_DIR}/Engine/eval
  mkdir ${SHOGI_DIR}/Engine/epoch8
  mv ${SHOGI_DIR}/Engine/eval ${SHOGI_DIR}/Engine/epoch8/eval
  ln -snfv ${SHOGI_DIR}/Engine/YaneuraOu/source/YaneuraOu-by-gcc ${SHOGI_DIR}/Engine/epoch8/YaneuraOu-by-gcc
  echo 'epoch8/YaneuraOu_V6.00_KPPT/100T-shock' >${SHOGI_DIR}/Engine/epoch8/engine_name.txt
fi

#---- Requirement: YaneuraOu
# Evaluation function - elmo(WCSC28) - https://mk-takizawa.github.io/elmo/
if [ ! -d "${SHOGI_DIR}/Engine/elmo.shogi" ]; then
  download_google_drive "0B0XpI3oPiCmFalVGclpIZjBmdGs"
  ln -snfv ${SHOGI_DIR}/Engine/YaneuraOu/source/YaneuraOu-by-gcc ${SHOGI_DIR}/Engine/elmo.shogi/YaneuraOu-by-gcc
  echo 'elmo_WCSC28/YaneuraOu_V6.00_KPPT/100T-shock' >${SHOGI_DIR}/Engine/elmo.shogi/engine_name.txt
fi

#---- Requirement: YaneuraOu
# Book - 100テラショック定跡 - https://github.com/yaneurao/YaneuraOu/releases/tag/BOOK-100T-Shock
if [ ! -d "${SHOGI_DIR}/Engine/Book/100T-shock-book" ]; then
  #Thanks - https://askubuntu.com/questions/285976/download-zip-file-with-curl-command
  cd ${SHOGI_DIR}/Engine/Book
  curl -O -J -L https://github.com/yaneurao/YaneuraOu/releases/download/BOOK-100T-Shock/100T-shock-book.zip
  unar 100T-shock-book.zip
  rm 100T-shock-book.zip
  # Evaluation function - リゼロ評価関数 epoch8 - https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md
  mkdir ${SHOGI_DIR}/Engine/epoch8/book
  ln -snfv ${SHOGI_DIR}/Engine/Book/100T-shock-book/user_book1.db ${SHOGI_DIR}/Engine/epoch8/book/standard_book.db
fi

# Run
mono ${SHOGI_DIR}/Shogidokoro/Shogidokoro.exe
