#!/bin/bash

echo "${0} ..."

function usage() {
cat<< _EOT_
Description:
  INSTALL Filer

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  cd ~/.config/ranger
  vi ~/.local/share/applications/userapp-feh-CJADVY.desktop

_EOT_
exit 1
}

case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# -------------------- ranger --------------------'
    echo '# ranger                               : File Manager(CLI)'
    echo '# highlight                            : source highlight'
    echo '# lynx,elinks                          : html preview'
    echo '# w3m                                  : image preview'
    echo '# ffmpegthumbnailer                    : movie preview(ranger/scope.sh)'
    echo '# mediainfo                            : movie,audios info preview'
    echo '# poppler                              : pdf preview(ranger/scope.sh)($ pdftoppm)'
    echo '# atool,bzip2,cpio,gzip,lhasa,xz,'
    echo '# lzop,p7zip,tar,unace,unrar,zip,unzip : compression'
    echo '# -------------------- thunar --------------------'
    echo '# thunar                               : File Manager(GUI)'
    echo '# tumbler                              : Thunar-thumbnail'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S ranger \
                   highlight lynx elinks w3m ffmpegthumbnailer mediainfo poppler \
                   atool bzip2 cpio gzip lhasa xz lzop p7zip tar unace unrar zip unzip \
                   thunar tumbler
    sudo pacman -Sc
    ;;
  deploy)
    # --- mkdir
    mkdir -pv ~/.config ~/.local/share/applications ~/.Trash

    # --- ln
    readonly THIS_DIR="${HOME}/bin/filer"
    # ------ FILE PATH ------
    # Thunar(DefaultOpen+)
    ln -snfv "${THIS_DIR}/.local/share/applications/userapp-feh-CJADVY.desktop" "${HOME}/.local/share/applications"
    # ------ DIRECTORY PATH ------
    # Ranger
    ln -snfv "${THIS_DIR}/.config/ranger" "${HOME}/.config"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
