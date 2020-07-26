#!/bin/bash

echo "${0} ..."

# ------ ErgoDox EZ ------
# --- mkdir ErgodoxEZ-Directory<
readonly ERGODOXEZ_DIR=~/tmp/ergodox-ez
[ -d ${ERGODOXEZ_DIR} ] || mkdir -pv ${ERGODOXEZ_DIR}

# --- eco system
{
echo '--------------------------------------------------'
echo '# libusb            : https://libusb.info/'
echo '# teensy-loader-cli : https://www.pjrc.com/teensy/loader_cli.html'
echo '--------------------------------------------------'
}
sudo pacman -Syu
sudo pacman -S libusb teensy-loader-cli
sudo pacman -Sc

# --- git clone
# qmk_firmware(https://github.com/MattTreadwell/qmk_firmware)
cd ${ERGODOXEZ_DIR}
git clone --depth=1 https://github.com/MattTreadwell/qmk_firmware.git 2>/dev/null
if [ "${?}" = "0" ]; then
  :
else
  cd qmk_firmware
  git pull
  cd ..
fi

# --- curl binary
# Download/unarchive Teensy Program (64 bit)
[ -f teensy_linux64.tar.gz ] && rm -rf teensy_linux64.tar.gz
[ -f teensy_linux64        ] && rm -rf teensy_linux64
curl -fsSL -O https://www.pjrc.com/teensy/teensy_linux64.tar.gz
unar teensy_linux64.tar.gz
rm -rf teensy_linux64.tar.gz

echo '---------------------------------------->>(EOF)'
