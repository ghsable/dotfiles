#!/bin/sh

## Variable
# mas list file
file_a=$(grep -v -e '^$' -e '^#' ~/dotfiles/lib/macos/list/mas.txt | cut -d " " -f 1-1)

# Homebrew mas file -> Upgrade
mas upgrade

# mas install file
mas install ${file_a}

# End Message
cat ~/dotfiles/lib/macos/list/endmessage.txt
