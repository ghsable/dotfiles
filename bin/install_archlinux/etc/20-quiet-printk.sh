#!/bin/bash

echo "${0} ..."

function add_config() {
cat<< _EOT_
kernel.printk = 3 3 3 3
_EOT_
return 0
}

# [Sysctl] kernel dmesg = null
readonly ETCCONF_FILE="/etc/sysctl.d/20-quiet-printk.conf"
echo "UPDATE : ${ETCCONF_FILE}"
add_config | sudo tee ${ETCCONF_FILE}
sudo vi ${ETCCONF_FILE}
