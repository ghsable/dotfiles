#!/bin/sh

# 変数代入
# $brew list の標準出力をリダイレクトしたファイル
file_a=~/dotfiles/doc/installation/installlist_mac/installlist_brew.txt

# $brew install 実行前に$brew update を実行
brew update

# $brew install を順次実行
cat ${file_a} | grep -v -e '^$' -e '^#' | while read -r line
do
  echo "install ${line} ..."
  brew install ${line}
done

# 終了メッセージ
echo "#################### >> Finish!! Thanks :D"
