#!/bin/bash

echo "${0} ..."

# --- [Sysctl] kernel dmesg = null
function add_config() {
cat<< _EOT_
kernel.printk = 3 3 3 3
_EOT_
return 0
}

readonly ETC_FILE="/etc/sysctl.d/20-quiet-printk.conf"
echo "UPDATE : ${ETC_FILE}"
add_config | sudo tee ${ETC_FILE}
sudo vi ${ETC_FILE}
