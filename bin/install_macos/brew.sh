#!/bin/bash

echo "${0} ..."

# --- Upgrade(Homebrew + brew file)
brew upgrade

# --- Install(brew file)
brew install $(grep -v -e '^$' -e '^#' $(dirname ${0})/brew.txt)

# --- Delete Cache(all brew file)
brew cleanup --prune=all

echo '---------------------------------------->>(EOF)'
