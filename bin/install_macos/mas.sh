#!/bin/bash

echo "${0} ..."

# --- Upgrade(mas file)
mas upgrade

# --- mas install file
mas install $(grep -v -e '^$' -e '^#' $(dirname ${0})/mas.txt | cut -d " " -f 1-1)

echo '---------------------------------------->>(EOF)'
