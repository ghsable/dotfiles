#!/bin/bash

echo "${0} ..."

# ------ Sound ------
# --- install
{
echo '--------------------------------------------------'
echo '# alsa-*              : sound driver(alsamixer)'
echo '# pulseaudio          : agency alsa'
echo '# pulseaudio-alsa     : back-end alsa/pulseaudio'
echo '#                       (32bit -> lib32-libpulse,lib32-alsa-plugins)'
echo '# paprefs,pavucontrol : front-end pulseaudio'
echo '# sox                 : rec/play'
echo '--------------------------------------------------'
}
sudo pacman -Syu
sudo pacman -S alsa-utils alsa-firmware \
               pulseaudio \
               pulseaudio-alsa \
               pulseaudio-bluetooth pulseaudio-equalizer pulseaudio-jack pulseaudio-lirc pulseaudio-zeroconf \
               paprefs pavucontrol \
               sox
sudo pacman -Sc

# --- start
pulseaudio --start

# --- setting
function add_config_pulseaudio() {
cat<< _EOT_
#################### PLEASE ADD THIS LINE ####################
### Load the integrated pulseaudio equalizer and dbus module
load-module module-equalizer-sink
load-module module-dbus-protocol
_EOT_
return 0
}
readonly ETC_PULSEAUDIO_FILE="/etc/pulse/default.pa"
echo "UPDATE : ${ETC_PULSEAUDIO_FILE}"
add_config_pulseaudio | sudo tee -a ${ETC_PULSEAUDIO_FILE}
sudo vi ${ETC_PULSEAUDIO_FILE}

echo '---------------------------------------->>(EOF)'
