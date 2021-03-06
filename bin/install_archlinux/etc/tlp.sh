#!/bin/bash

echo "${0} ..."

# ------ TLP(battery manager) ------
# --- install(tlp,Radio Device Wizard)
sudo pacman -Syu
sudo pacman -S tlp tlp-rdw
sudo pacman -Sc

# --- [tlp-rdw] setting
function add_config() {
cat<< _EOT_
#################### PLEASE ADD THIS LINE ####################
SATA_LINKPWR_ON_BAT=max_performance

CPU_SCALING_GOVERNOR_ON_AC=perfomance
CPU_SCALING_GOVERNOR_ON_BAT=ondemand

DISK_APM_LEVEL_ON_AC="254 254"
DISK_APM_LEVEL_ON_BAT="128 128"

BAY_POWEROFF_ON_BAT=1

RUNTIME_PM_BLACKLIST="01:00.0"

RESTORE_DEVICE_STATE_ON_STARTUP=1

DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wifi wwan"

DEVICES_TO_ENABLE_ON_STARTUP=""
_EOT_
return 0
}
readonly ETC_FILE="/etc/tlp.d/00-template.conf"
echo "UPDATE : ${ETC_FILE}"
add_config | sudo tee -a ${ETC_FILE} >/dev/null
sudo vi ${ETC_FILE}

# --- tlp-rdw
sudo systemctl enable NetworkManager-dispatcher
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# --- tlp
sudo systemctl enable tlp.service
#sudo tlp start
