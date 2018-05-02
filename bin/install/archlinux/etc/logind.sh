#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# [Systemd] HandlePowerKey = ignore
echo 'Update -> /etc/systemd/logind.conf'
cat ./delimiter.txt ./logind.conf | sudo tee -a /etc/systemd/logind.conf
sudo vi /etc/systemd/logind.conf
