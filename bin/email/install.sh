#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  INSTALL E-mail CLIENT

Usage:
  sh ${0} install : INSTALL Packages
  sh ${0} deploy  : DEPLOY  Configs
  sh ${0} *       : USAGE

EOF:
  mutt

_EOT_
exit 1
}
 
case ${1} in
  install)
    {
    echo '--------------------------------------------------'
    echo '# getmail         : MRA(Mail Retrieval Agent)   # POP3'
    echo '# msmtp,msmtp-mta : MTA(Message Transfer Agent) # SMTP'
    echo '# mutt            : MUA(Mail User Agent)        # MAILER'
    echo '# abook           : ADDRESS BOOK                # OTHER'
    echo '--------------------------------------------------'
    }
    sudo pacman -Syu
    sudo pacman -S getmail \
                   msmtp msmtp-mta \
                   mutt \
                   abook
    sudo pacman -Sc
    ;;
  deploy)
    # --- mkdir(Save-File-To-Directory)
    readonly SAVEFILETO_DIR=~/Downloads
    [ -d ${SAVEFILETO_DIR} ] || mkdir -pv ${SAVEFILETO_DIR}
    # --- DEPLOY Config-Files
    readonly CLOSED_DIR="${HOME}/Dropbox/email"
    readonly OPENED_DIR="${HOME}/dotfiles/bin/email"
    # MRA(Mail Retrieval Agent)   # POP3
    ln -snfv "${CLOSED_DIR}/.getmail"    "${HOME}"
    # MTA(Message Transfer Agent) # SMTP
    ln -snfv "${CLOSED_DIR}/.msmtprc"    "${HOME}"
    # MUA(Mail User Agent)        # MAILER
    ln -snfv "${CLOSED_DIR}/.mutt_local" "${HOME}"
    ln -snfv "${OPENED_DIR}/.mutt"       "${HOME}"
    # ADDRESS BOOK                # OTHER
    ln -snfv "${CLOSED_DIR}/.abook"      "${HOME}"
    ;;
  *)
    usage
    ;;
esac

echo '---------------------------------------->>(EOF)'
