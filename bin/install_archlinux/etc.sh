#!/bin/bash

echo "${0} ..."

# Set "/etc/*"
for shfile in $(dirname ${0})/etc/*.sh
do
  sh ${shfile}
done

# Display systemctl service
sudo systemctl list-unit-files

echo '---------------------------------------->>(EOF)'
