#!/bin/sh
  
# 開始メッセージ
echo "backup now ..."

# OSの種類によって実行内容を分岐させる(環境変数を利用)
if [ "${TERM_PROGRAM}" = "Apple_Terminal" ] ; then
   ### macOSの処理 ###
   # 変数代入
   dir_a=~/dotfiles/doc/installation/installlist_mac/  # バックアップファイル格納先
   dir_b=~/dotfiles/bin/lib/install_mac/               # install.shの構成要素の格納先

   # 指定コマンドからファイルへリダイレクト(= 環境のバックアップ)
   ls ${dir_b}    > ${dir_a}installlist_sh.txt         # install.shの構成要素
   brew list      > ${dir_a}installlist_brew.txt       # brew list
   brew cask list > ${dir_a}installlist_cask.txt       # brew cask list
   mas list       > ${dir_a}installlist_mas.txt        # mas list

   # 終了メッセージ
   echo "#################### >> [macOS] Finish!! ${0} . Thanks :D"
elif [ "${XXX}" = "" ] ; then
   ### ArchLinuxの処理 ### 
          
   # 終了メッセージ
   echo "#################### >> [ArchLinux] Finish!! ${0} . Thanks :D"
else     
   ### エラー処理 ### 

   # 終了メッセージ 
   echo "#################### >> ELLOR!! Sorry :("
fi 
