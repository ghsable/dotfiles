#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  SET E-MAIL CLIENT

Permission:
  Directory : 0700
  File      : 0600

Flow:
  1. INSTALL PKGS
     $ sh ${0} install
  2. CREATE DIRECTORY AND FILE
     $ mkdir *
     $ vi    *
     Example:
     -> $ sh ${0} example_mra
     -> $ sh ${0} example_mta
     -> $ sh ${0} example_mua
  3. DEPLOY DIRECTORY AND FILE
     $ sh ${0} deploy

Usage:
  sh ${0} install     : INSTALL PKGS
  sh ${0} deploy      : DEPLOY  CONFIGS
  sh ${0} example_mra : DISPLAY MRA_EXAMPLE(POP3)
  sh ${0} example_mta : DISPLAY MTA_EXAMPLE(SMTP)
  sh ${0} example_mua : DISPLAY MUA_EXAMPLE(MAILER)
  sh ${0} *           : USAGE

EOF:
  mutt

_EOT_
exit 1
}
 
function example_mra() {
readonly CLOUDSTORAGE_DIR="${HOME}/<CLOUDSTORAGE_NAME>/Mail/.getmail"
cat<< _EOT_
########## MRA(Mail Retrieval Agent) | POP3 ##########
Description(DIRECTORY):
  CLOSED:
  # MAILDIR(personal,work)
  ${CLOUDSTORAGE_DIR}/Maildir/personal/{cur,new,tmp}
  ${CLOUDSTORAGE_DIR}/Maildir/work/{cur,new,tmp}

Description(FILE):
  OPENED:
  # GETMAIL --RCFILE(personal,work) -> CRONTAB
  ${HOME}/dotfiles/bin/mail/getmail.sh
  # CRONTAB
  ${HOME}/dotfiles/bin/install_archlinux/etc/crontab
  CLOSED:
  # GETMAILRC(personal,work)
  ${CLOUDSTORAGE_DIR}/{getmailrc_personal,getmailrc_work}

Example(getmailrc_personal):
  [options]
  verbose = 0
  read_all = false
  [retriever]
  type = SimplePOP3SSLRetriever
  server = pop.gmail.com
  username = xxx@gmail.com
  port = 995
  password = xxx
  [destination]
  type = Maildir
  path = ~/.getmail/Maildir/personal/

_EOT_
exit 0
}

function example_mta() {
readonly CLOUDSTORAGE_DIR="${HOME}/<CLOUDSTORAGE_NAME>/Mail"
cat<< _EOT_
########## MTA(Message Transfer Agent) | SMTP ##########
Description(FILE):
  CLOSED:
  ${CLOUDSTORAGE_DIR}/.msmtprc

Example(.msmtprc):
  # ~/.msmtprc
  # echo "<comment>" | msmtp -a <from(account)> <send(address)>
  # ACCOUNT1 (personal)
  account        personal
  host           smtp.gmail.com
  port           587
  user           xxx@gmail.com
  password       xxx
  from           xxx@gmail.com
  tls            on
  tls_starttls   on
  tls_trust_file /etc/ssl/certs/ca-certificates.crt
  tls_certcheck  on
  auth           on
  logfile        ~/.msmtp.log
  # ACCOUNT2 (work)
  account        work
  host           smtp.xxx.com
  port           587
  user           xxx@xxx.com
  password       xxx
  from           xxx@xxx.com
  tls            on
  ...

_EOT_
exit 0
}

function example_mua() {
readonly CLOUDSTORAGE_DIR="${HOME}/<CLOUDSTORAGE_NAME>/Mail/.mutt_local"
cat<< _EOT_
########## MUA(Mail User Agent) | MAILER ##########
Description(DIRECTORY):
  CLOSED:
  # MAILDIR(personal,work)
  ${CLOUDSTORAGE_DIR}/{drafts,sent}

Description(FILE):
  OPENED:
  # MUTTRC(personal,work)
  ${HOME}/dotfiles/.muttrc
  ${HOME}/dotfiles/.mutt/{.muttrc_personal,.muttrc_work}
  ${HOME}/dotfiles/.mutt/scheme/mutt-colors-solarized-dark-256.muttrc
  
  CLOSED:
  # GETMAILRC(personal,work)
  ${CLOUDSTORAGE_DIR}/my_data/{from_personal,from_work}
  ${CLOUDSTORAGE_DIR}/my_data/{realname_personal,realname_work}
  ...

Example(from_personal):
  xxx@gmail.com

Example(realname_personal):
  taro yamada

_EOT_
exit 0
}

case ${1} in
  install)
    # MRA(Mail Retrieval Agent)   | POP3
    sudo pacman -S getmail
    # MTA(Message Transfer Agent) | SMTP
    sudo pacman -S msmtp msmtp-mta
    # MUA(Mail User Agent)        | MAILER
    sudo pacman -S mutt
    ;;
  deploy)
    readonly CLOUDSTORAGE_DIR="${HOME}/SpiderOak Hive/Mail"
    # MRA(Mail Retrieval Agent)   | POP3
    ln -snfv "${CLOUDSTORAGE_DIR}/.getmail" "${HOME}"
    # MTA(Message Transfer Agent) | SMTP
    ln -snfv "${CLOUDSTORAGE_DIR}/.msmtprc" "${HOME}"
    # MUA(Mail User Agent)        | MAILER
    ln -snfv "${CLOUDSTORAGE_DIR}/.mutt_local" "${HOME}"
    ln -snfv "${HOME}/dotfiles/.muttrc" "${HOME}"
    ln -snfv "${HOME}/dotfiles/.mutt" "${HOME}"
    ;;
  example_mra)
    example_mra
    ;;
  example_mta)
    example_mta
    ;;
  example_mua)
    example_mua
    ;;
  *)
    usage
    ;;
esac
