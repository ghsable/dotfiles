#!/bin/bash

echo "${0} ..."

# ------ linux-hardened ------
# --- install
# linux-hardened : hardened linux_kernel patchset
# firejail       : sandbox application and server
sudo pacman -Syu
sudo pacman -S linux-hardened \
               firejail
sudo pacman -Sc

# --- setting
# restriction access to kernel_log
function add_dmesg_config() {
cat<< _EOT_
kernel.dmesg_restrict = 1
_EOT_
return 0
}
readonly ETC_DMESG_FILE="/etc/sysctl.d/50-dmesg-restrict.conf"
echo "UPDATE : ${ETC_DMESG_FILE}"
add_dmesg_config | sudo tee ${ETC_DMESG_FILE}
sudo vi ${ETC_DMESG_FILE}

# restriction access to proc_filesystem_kernel_pointer
function add_kptr_config() {
cat<< _EOT_
kernel.kptr_restrict = 1
_EOT_
return 0
}
readonly ETC_KPTR_FILE="/etc/sysctl.d/50-kptr-restrict.conf"
echo "UPDATE : ${ETC_KPTR_FILE}"
add_kptr_config | sudo tee ${ETC_KPTR_FILE}
sudo vi ${ETC_KPTR_FILE}
