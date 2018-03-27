#!/bin/sh

chsh -s /bin/zsh                  # set zsh
cd ~/dotfiles/ && make gitconfig  # ~/.gitconfig

# 終了メッセージ
echo "#################### >> Finish!! Thanks :D"
