#!/bin/bash

readonly KIF_DIR=~/shogi/KIF
ln -snf ~/private/Document/shogi/KIF ${KIF_DIR}

readonly KPPT_DIR=~/shogi/Engine/KPPT
readonly NNUE_DIR=~/shogi/Engine/NNUE
readonly BOOK_DIR=~/shogi/Engine/BOOK
[ -d ${KPPT_DIR} ] || mkdir -pv ${KPPT_DIR}
[ -d ${NNUE_DIR} ] || mkdir -pv ${NNUE_DIR}
[ -d ${BOOK_DIR} ] || mkdir -pv ${BOOK_DIR}

# ---------- GUI ---------- #

#---- Requirement: Mono
# GUI - Shogidokoro - http://shogidokoro.starfree.jp/
if [ ! -d ~/shogi/Shogidokoro ]; then
  cd ~/shogi
  curl -O http://shogidokoro.starfree.jp/download/Shogidokoro.zip
  unar Shogidokoro.zip
  rm Shogidokoro.zip
fi

# ---------- KPPT ---------- #

#---- Requirement: Rust
# USI shogi engine - apery_rust - https://github.com/HiraokaTakuya/apery_rust
if [ ! -d "${KPPT_DIR}/apery_rust" ]; then
  cd ${KPPT_DIR}
  git clone --recursive https://github.com/HiraokaTakuya/apery_rust.git
  cd ${KPPT_DIR}/apery_rust
  cargo build --release
  ln -snfv ${KPPT_DIR}/apery_rust/eval ${KPPT_DIR}/apery_rust/target/release/eval
fi

#---- Requirement: clang++
# USI shogi engine - やねうら王 - https://github.com/yaneurao/YaneuraOu
if [ ! -d "${KPPT_DIR}/YaneuraOu" ]; then
  cd ${KPPT_DIR}
  git clone --recursive https://github.com/yaneurao/YaneuraOu.git
  cp -f ~/bin/shogi/YaneuraOu/KPPT/Makefile ${KPPT_DIR}/YaneuraOu/source/Makefile
  cd ${KPPT_DIR}/YaneuraOu/source
  make
fi

# Thanks - https://www.matthuisman.nz/2019/01/download-google-drive-files-wget-curl.html
function download_google_drive() {
    fileid=$1
    filename="opt.zip"
    curl -L -c cookies.txt 'https://docs.google.com/uc?export=download&id='$fileid \
         | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1/p' >confirm.txt
    curl -L -b cookies.txt -o $filename \
         'https://docs.google.com/uc?export=download&id='$fileid'&confirm='$(<confirm.txt)
    unar $filename
    rm -f confirm.txt cookies.txt $filename
}

#---- Requirement: YaneuraOu_KPPT
# Evaluation function - リゼロ評価関数 epoch8 - https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md
if [ ! -d "${KPPT_DIR}/epoch8" ]; then
  cd ${KPPT_DIR}
  download_google_drive "0Bzbi5rbfN85NMHd0OEUxcUVJQW8"
  mv ${KPPT_DIR}/epoch8 ${KPPT_DIR}/eval
  mkdir ${KPPT_DIR}/epoch8
  mv ${KPPT_DIR}/eval ${KPPT_DIR}/epoch8/eval
  ln -snfv ${KPPT_DIR}/YaneuraOu/source/YaneuraOu-by-gcc ${KPPT_DIR}/epoch8/YaneuraOu-by-gcc
  echo 'epoch8/YaneuraOu_V6.00_KPPT/100T-shock' >${KPPT_DIR}/epoch8/engine_name.txt
fi

#---- Requirement: YaneuraOu_KPPT
# Evaluation function - elmo_WCSC28 - https://mk-takizawa.github.io/elmo/
if [ ! -d "${KPPT_DIR}/elmo.shogi" ]; then
  cd ${KPPT_DIR}
  download_google_drive "0B0XpI3oPiCmFalVGclpIZjBmdGs"
  ln -snfv ${KPPT_DIR}/YaneuraOu/source/YaneuraOu-by-gcc ${KPPT_DIR}/elmo.shogi/YaneuraOu-by-gcc
  echo 'elmo_WCSC28/YaneuraOu_V6.00_KPPT' >${KPPT_DIR}/elmo.shogi/engine_name.txt
fi

# ---------- NNUE ---------- #

#---- Requirement: clang++
# USI shogi engine - やねうら王 - https://github.com/yaneurao/YaneuraOu
if [ ! -d "${NNUE_DIR}/YaneuraOu" ]; then
  cd ${NNUE_DIR}
  git clone --recursive https://github.com/yaneurao/YaneuraOu.git
  cp -f ~/bin/shogi/YaneuraOu/NNUE/Makefile ${NNUE_DIR}/YaneuraOu/source/Makefile
  cd ${NNUE_DIR}/YaneuraOu/source
  make
fi

#---- Requirement: YaneuraOu_NNUE
# Evaluation function - 水匠 - https://twitter.com/tayayan_ts
# 水匠4 - https://twitter.com/tayayan_ts/status/1416621532164497411
if [ ! -d "${NNUE_DIR}/水匠4" ]; then
  cd ${NNUE_DIR}
  download_google_drive "1YwqmlQhfnRZDSrpISYNa4HvQaS9tEqvy"
  ln -snfv ${NNUE_DIR}/YaneuraOu/source/YaneuraOu-by-gcc ${NNUE_DIR}/水匠4/YaneuraOu-by-gcc
fi

#---- Requirement: YaneuraOu_NNUE
# Evaluation function - elmo_2020 - https://mk-takizawa.github.io/elmo/
if [ ! -d "${NNUE_DIR}/elmo2020" ]; then
  cd ${NNUE_DIR}
  download_google_drive "1qhutTzaog4pHqh0OPAhJuf8mCwPAl5r7"
  ln -snfv ${NNUE_DIR}/YaneuraOu/source/YaneuraOu-by-gcc ${NNUE_DIR}/elmo2020/YaneuraOu-by-gcc
  echo 'elmo_2020/YaneuraOu_V6.00_NNUE' >${NNUE_DIR}/elmo2020/engine_name.txt
fi

# ---------- BOOK ---------- #

#---- Requirement: YaneuraOu
# Book - 100テラショック定跡 - https://github.com/yaneurao/YaneuraOu/releases/tag/BOOK-100T-Shock
if [ ! -d "${BOOK_DIR}/100T-shock-book" ]; then
  #Thanks - https://askubuntu.com/questions/285976/download-zip-file-with-curl-command
  cd ${BOOK_DIR}
  curl -O -J -L https://github.com/yaneurao/YaneuraOu/releases/download/BOOK-100T-Shock/100T-shock-book.zip
  unar 100T-shock-book.zip
  rm 100T-shock-book.zip
  # Evaluation function - リゼロ評価関数 epoch8 - https://github.com/yaneurao/YaneuraOu/blob/master/docs/README2017.md
  mkdir -pv ${KPPT_DIR}/epoch8/book
  ln -snfv ${BOOK_DIR}/100T-shock-book/user_book1.db ${KPPT_DIR}/epoch8/book/standard_book.db
fi

# Run
mono ~/shogi/Shogidokoro/Shogidokoro.exe
