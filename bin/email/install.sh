#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET E-MAIL CLIENT

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
    # --- UPGRADE(repository + packages)
    sudo pacman -Syu
    # --- INSTALL pkgs
    # MRA(Mail Retrieval Agent)   # POP3
    sudo pacman -S getmail
    # MTA(Message Transfer Agent) # SMTP
    sudo pacman -S msmtp msmtp-mta
    # MUA(Mail User Agent)        # MAILER
    sudo pacman -S mutt
    # ADDRESS BOOK                # OTHER
    sudo pacman -S abook
    # --- DELETE Cache(all packages)
    sudo pacman -Sc
    ;;
  deploy)
    # --- mkdir Save-File-To-Directory
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
