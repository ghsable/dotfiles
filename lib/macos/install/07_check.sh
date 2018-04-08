#!/bin/sh

# Display installed brew file
echo "##### installed brew file #####"
brew list

# Display installed brew cask file
echo "##### installed brew cask file #####"
brew cask list

# Display installed mas file
echo "##### installed mas file #####"
mas list

# End Message
cat ~/dotfiles/lib/macos/list/endmessage.txt
