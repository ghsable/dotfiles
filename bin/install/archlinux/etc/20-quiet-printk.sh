#!/bin/bash

echo "${0} ..."

cd $(dirname ${0})

# [Sysctl] kernel dmesg = null
echo 'Update -> /etc/sysctl.d/20-quiet-printk.conf'
cat ./delimiter.txt ./20-quiet-printk.conf | sudo tee -a /etc/sysctl.d/20-quiet-printk.conf
sudo vi /etc/sysctl.d/20-quiet-printk.conf
