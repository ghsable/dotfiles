#!/bin/sh

chsh -s /bin/zsh                  # set zsh
cd ~/dotfiles/ && make gitconfig  # ~/.gitconfig

# End Message
echo "#################### >> Complete!! Thanks :D"
