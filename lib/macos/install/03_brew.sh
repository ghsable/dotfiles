#!/bin/sh

## Variable
# brew list file
file_a=$(grep -v -e '^$' -e '^#' ~/dotfiles/lib/macos/list/brew.txt)

# Homebrew + brew file -> Upgrade
brew upgrade --cleanup

# brew install file
brew install ${file_a}

# Delete Cache "all brew file"
brew cleanup -s

# End Message
cat ~/dotfiles/lib/macos/list/endmessage.txt
