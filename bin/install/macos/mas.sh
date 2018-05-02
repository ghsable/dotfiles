#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# Upgrade(mas file)
mas upgrade

# mas install file
mas install $(grep -v -e '^$' -e '^#' ./list/mas.txt | cut -d " " -f 1-1)

# End Message
cat ./complete.txt
