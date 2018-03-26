#!/bin/sh

# 開始メッセージ
echo "install now ..."

# OSの種類によって実行内容を分岐させる(環境変数を利用)
if [ "${TERM_PROGRAM}" = "Apple_Terminal" ] ; then
   ### macOSの処理 ###
   # 変数代入
   # install.shの構成要素のファイル名リスト
   file_a=~/dotfiles/doc/installation/installlist_mac/installlist_sh.txt
   # install.shの構成要素の格納先
   dir_a=~/dotfiles/bin/lib/install_mac/

   # install.shの構成要素を順次実行
   cat ${file_a} | grep -v -e '^$' -e '^#' | while read -r line
   do
     echo "start ${line} ..."
     sh ${dir_a}${line}
   done

   # 終了メッセージ
   echo "#################### >> [macOS] Finish!! ${0} . Thanks :D"
elif [ "${XXX}" = "" ]; then
   ### ArchLinuxの処理 ###

   # 終了メッセージ
   echo "#################### >> [ArchLinux] Finish!! ${0} . Thanks :D"
else
   ## エラー処理 ###

   # 終了メッセージ
   echo "#################### >> ELLOR!! Sorry :("
fi
