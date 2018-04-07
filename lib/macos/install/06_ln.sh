#!/bin/sh

# 変数代入
# ".??*"の格納先
dir_a=~/dotfiles/etc/local_mac/
# $ln を実行したいパスを手動でリスト化したファイル(".??*"以外)
file_a=~/dotfiles/doc/installation/installlist_mac/installlist_ln.txt

# ".??*"の格納先へ移動
cd ${dir_a}
# ".??*"のシンボリックリンクを順次${HOME}へ貼付
for f in .??*
do
  # 実行を無視したい".??*"
  [ "${f}" = ".DS_Store" ] && continue
  # ${HOME}へシンボリックリンクを貼付
  ln -snfv ${dir_a}${f} ~/${f}
done

# ${file_a}より$ln を順次実行(".??*"以外)
cat ${file_a} | grep -v -e '^$' -e '^#' | while read -r line
do
  ln -snfv ~/${line} ~/
done

# End Message
echo "#################### >> Complete!! Thanks :D"
