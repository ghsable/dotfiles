#!/bin/bash

echo "${0} ..."

# Upgrade(Homebrew + brew file)
brew upgrade --cleanup

# Install(brew file)
brew install $(grep -v -e '^$' -e '^#' $(dirname ${0})/brew.txt)

# Delete Cache(all brew file)
brew cleanup -s

echo '---------------------------------------->>(EOF)'
