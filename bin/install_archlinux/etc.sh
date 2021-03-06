#!/bin/bash

echo "${0} ..."

# --- Set "/etc/*"
for ETCSH_FILE in $(dirname ${0})/etc/*.sh
do
  sh ${ETCSH_FILE}
done

# --- Display systemctl service
sudo systemctl list-unit-files

echo '---------------------------------------->>(EOF)'
