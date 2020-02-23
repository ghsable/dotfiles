#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  MENU(tools)

Usage:
  sh ${0} startup     : start fav apps
  sh ${0} launch_a    : dmenu
  sh ${0} launch_b    : rofi
  sh ${0} terminal_a  : xterm(transset-df)
  sh ${0} terminal_b  : urxvt
  sh ${0} email       : mutt
  sh ${0} addressbook : abook
  sh ${0} note        : leafpad
  sh ${0} movie       : mplayer
  sh ${0} rec_a       : simplescreenrecorder
  sh ${0} rec_b       : peek(AUR)
  sh ${0} web         : firefox
  sh ${0} office      : libreoffice
  sh ${0} *           : USAGE

_EOT_
exit 1
}

case ${1} in
  startup   )  urxvt   &
               thunar  &
               firefox &                      ;;
  launch_a  )  dmenu_run                      ;;
  launch_b  )  rofi -show run                 ;;
  terminal_a)  # start Xterm -> transset-df
               xterm &
               sleep 0.6 && transset-df -i \
               $(xwininfo -root -tree -int | \
               grep -e 'xterm' -e 'XTerm'  | \
               cut -f 6 -d " "             | \
               sort                        | \
               tail -n1) 0.75                ;;
  terminal_b ) urxvt                         ;;
  email      ) sh ~/bin/email/getmail.sh ;
               cd ~/Downloads
               mutt                          ;;
  addressbook) abook                         ;;
  note       ) leafpad                       ;;
  movie      ) gnome-mplayer                 ;;
  rec_a      ) simplescreenrecorder          ;;
  rec_b      ) peek                          ;;
  web        ) firefox                       ;;
  office     ) libreoffice                   ;;
  *          ) usage                         ;;
esac
