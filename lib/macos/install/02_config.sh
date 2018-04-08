#!/bin/sh

# Set ZSH
chsh -s /bin/zsh                  
# create -> "~/.gitconfig"
cd ~/dotfiles/ && make gitconfig  

# End Message
cat ~/dotfiles/lib/macos/list/endmessage.txt
