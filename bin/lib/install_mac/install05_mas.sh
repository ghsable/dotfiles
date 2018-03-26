#!/bin/sh

# 変数代入
# $mas list の標準出力をリダイレクトしたファイル
file_a=~/dotfiles/doc/installation/installlist_mac/installlist_mas.txt

# $mas install を順次実行
cat ${file_a} | grep -v -e '^$' -e '^#' | cut -d " " -f 1-1 | while read -r line
do
  echo "install ${line} ..."
  mas install ${line}
done

# 終了メッセージ
echo "#################### >> Finish!! Thanks :D"
