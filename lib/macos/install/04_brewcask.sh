#!/bin/sh

## Variable
# brew cask list file
file_a=$(grep -v -e '^$' -e '^#' ~/dotfiles/lib/macos/list/brewcask.txt)

# brew cask file -> Upgragde(ReInstall "all brew cask file")
#brew cask upgrade --greedy
# Homebrew cask file -> Upgragde
brew cask upgrade

# brew cask install file
brew cask install ${file_a}

# Delete Cache "all brew cask file"
brew cask cleanup

# End Message
cat ~/dotfiles/lib/macos/list/endmessage.txt
