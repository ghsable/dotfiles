#!/bin/sh

brew cleanup                  # $brew のキャッシュファイルを削除
brew cask cleanup --outdated  # $brew cask のキャッシュファイルを削除

brew list                     # $brew list でインストール済みAppを表示
brew cask list                # $brew cask list でインストール済みAppを表示
mas list                      # $mas list でインストール済みAppを表示

# 終了メッセージ
echo "#################### >> Finish!! Thanks :D"
