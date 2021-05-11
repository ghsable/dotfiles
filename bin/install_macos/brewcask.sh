#!/bin/bash

echo "${0} ..."

# --- Upgrade(brew cask file)
brew upgrade --cask --greedy

# --- Install(brew cask file)
brew install --cask $(grep -v -e '^$' -e '^#' $(dirname ${0})/brewcask.txt)

# --- Delete Cache(all brew cask file)
brew cleanup -s

echo '---------------------------------------->>(EOF)'
