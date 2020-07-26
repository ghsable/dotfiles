#!/bin/bash

echo "${0} ..."

# ------ Printer ------
# --- install
{
echo '--------------------------------------------------'
echo '# rpmextract  : Open *.rpm ($ rpmextract.sh *.rpm)'
echo '# a2ps        : Convert Text to PostScript'
echo '# cups*       : Print System'
echo '# avahi       : Scan Printer of Local-Arear-Network'
echo '# nss-mdns    : hostname resolution'
echo '# foomastic-* : PPD'
echo '# gutenprint  : PPD filter'
echo '# ghostscript : PPD filter'
echo '# gsfonts     : Font Ghostscript'
echo '--------------------------------------------------'
}
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
readonly ETC_NSSWITCH_FILE="/etc/nsswitch.conf"
echo "UPDATE : ${ETC_NSSWITCH_FILE}"
add_config_nssmdns | sudo tee -a ${ETC_NSSWITCH_FILE}
sudo vi ${ETC_NSSWITCH_FILE}

echo '---------------------------------------->>(EOF)'
