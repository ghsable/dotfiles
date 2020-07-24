#!/bin/bash

echo "${0} ..."

# ------ bluetooth hci1 ------
# *case 1
# Download BCM20702A1-0a5c-21e6.hcd
# --- winterheart/broadcom-bt-firmware
#     https://github.com/winterheart/broadcom-bt-firmware/tree/master/brcm
# case 2
# $ sudo pacman -S innoextract
# $ innoextract g4wh01ww.exe
# --- ThinkPad Bluetooth with Enhanced Data Rate ソフトウェア (Windows 10 32bit, 64bit) - ThinkPad
#     https://pcsupport.lenovo.com/ph/ja/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x230i/downloads/DS103428
# $ cd app/Win32
# $ hex2hcd BCM20702A1_001.002.014.1483.1669.hex
# $ sudo cp app/Win32/BCM20702A1_001.002.014.1483.1669.hcd /lib/firmware/brcm/BCM20702A1-0a5c-21e6.hcd
# --- direct-loading firmware BCM20702A1-0a5c-21e6.hcd
#     https://www.hillenius.com/post/direct-loading_firmware_bcm20702a1-0a5c-21e6.hcd/
sudo cp -rf $(dirname ${0})/lib/firmware/brcm/BCM20702A1-0a5c-21e6.hcd /lib/firmware/brcm/

# -> resolution errors(bluetooth hci1: Direct firmware load for brcm/BCM20702A1-0a5c-21e6.hcd failed with error -2)
# issues -> Bluetooth: hci0: unexpected event for opcode 0xfc2f
