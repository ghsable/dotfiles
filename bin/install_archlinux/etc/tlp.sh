#!/bin/bash

echo "${0} ..."

### TLP(battery manager) ###
# install(tlp,Radio Device Wizard)
sudo pacman -S tlp tlp-rdw

# systemctl enable
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service

# systemctl mask
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

function add_config() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
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

# tuning
readonly ETCCONF_FILE="/etc/default/tlp"
echo "UPDATE : ${ETCCONF_FILE}"
add_config | sudo tee -a ${ETCCONF_FILE}
sudo vi ${ETCCONF_FILE}
