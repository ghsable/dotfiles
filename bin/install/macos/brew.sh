#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# Upgrade(Homebrew + brew file)
brew upgrade --cleanup

# Install(brew file)
brew install $(grep -v -e '^$' -e '^#' ./list/brew.txt)

# Delete Cache(all brew file)
brew cleanup -s

# End Message
cat ../all/complete.txt
