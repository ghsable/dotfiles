#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# Set ZSH
chsh -s /bin/zsh                  

# End Message
cat ../all/complete.txt
