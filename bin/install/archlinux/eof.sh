#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# Display all system Information
screenfetch

# End Message
cat ../all/complete.txt
