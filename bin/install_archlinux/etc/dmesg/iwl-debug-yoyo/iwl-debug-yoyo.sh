#!/bin/bash

echo "${0} ..."

# ------ bluetooth hci1 ------
# Download 'Intel® Wireless 7260' and rename to 'iwl-debug-yoyo.bin'
# --- Linux Wireless
#     https://wireless.wiki.kernel.org/en/users/Drivers/iwlwifi#d_3165_and_3168_support
sudo cp -rf $(dirname ${0})/lib/firmware/iwl-debug-yoyo.bin /lib/firmware/

# -> resolution errors(iwlwifi 0000:03:00.0: Direct firmware load for iwl-debug-yoyo.bin failed with error -2)
# issues -> iwlwifi 0000:03:00.0: invalid TLV len: 1049276/172775241
