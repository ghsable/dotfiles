#!/bin/bash

# 0.Download kif:
#   将棋ウォーズ棋譜検索: https://www.shogi-extend.com/swars/search
# 1.rename kif:
#   xxx-xxx-yyyymmdd_hhmmss.kif -> yyyymmdd_hhmmss-xxx-xxx.kif
# 2.make directory:
#   yyyymmdd_hhmmss-xxx-xxx
# 3.move kif:
#   yyyymmdd_hhmmss-xxx-xxx/yyyymmdd_hhmmss-xxx-xxx.kif

cd $(dirname ${0})

for FILENAME_OLD in $(ls)
do
  [ "${FILENAME_OLD}" = "rename_ShogiWars.sh" ] && continue
  FILENAME_NEW="${FILENAME_OLD: -19:15}-${FILENAME_OLD%-*}"
  echo "${FILENAME_NEW}"

  # 1.rename kif:
  mv "${FILENAME_OLD}" "${FILENAME_NEW}.kif"

  # 2.make directory:
  mkdir "${FILENAME_NEW}"

  # 3.move kif:
  mv "${FILENAME_NEW}.kif" "${FILENAME_NEW}/${FILENAME_NEW}.kif"
done

