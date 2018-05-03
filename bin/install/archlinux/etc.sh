#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})/etc

# Set /etc/*
for shfile in *.sh
do
  sh ${shfile}
done

# Display systemctl service
sudo systemctl list-unit-files

# End Message
cat ./complete.txt
