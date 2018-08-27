#!/bin/bash

echo "${0} ..."

# ------ Print System ------
# --- install
# CUPS        : Print System
# rpmextract  : Open *.rpm ($ rpmextract.sh *.rpm)
# a2ps        : Convert Text to PostScript
# Avahi       : Scan Printer of Local-Arear-Network
#               nss-mdns : hostname resolution
# foomastic   : PPD
# gutenprint  : PPD filter
# ghostscript : PPD filter

sudo pacman -Syu
sudo pacman -S rpmextract \
               a2ps \
               cups cups-pdf \
               avahi nss-mdns \
               foomatic-db-engine foomatic-db foomatic-db-ppds foomatic-db-nonfree-ppds foomatic-db-gutenprint-ppds \
               gutenprint \
               ghostscript gsfonts
sudo pacman -Sc

# --- systemctl enable
# Avahi : $ avahi-browse -alr
sudo systemctl enable org.cups.cupsd.service
sudo systemctl enable cups-browsed.service
sudo systemctl enable avahi-daemon.service

# --- setting
function add_config_nssmdns() {
cat<< _EOT_
#################### PLEASE REPLACE THIS LINE ####################
hosts: files mymachines myhostname mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns
_EOT_
return 0
}
readonly ETC_FILE="/etc/nsswitch.conf"
echo "UPDATE : ${ETC_FILE}"
add_config_nssmdns | sudo tee -a ${ETC_FILE}
sudo vi ${ETC_FILE}

echo '---------------------------------------->>(EOF)'
