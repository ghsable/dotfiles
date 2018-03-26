#!/bin/sh

# 変数代入
# $brew cask list の標準出力をリダイレクトしたファイル
file_a=~/dotfiles/doc/installation/installlist_mac/installlist_cask.txt

# $brew cask install を順次実行
cat ${file_a} | grep -v -e '^$' -e '^#' | while read -r line
do
  echo "install ${line} ..."
  brew cask install ${line}
done

# 終了メッセージ
echo "#################### >> Finish!! Thanks :D"
