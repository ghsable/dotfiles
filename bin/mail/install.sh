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
     -> $ sh ${0} example_tree
     -> $ sh ${0} example_mra
     -> $ sh ${0} example_mta
     -> $ sh ${0} example_mua
  3. DEPLOY DIRECTORY AND FILE
     $ sh ${0} deploy

Usage:
  sh ${0} install      : INSTALL PKGS
  sh ${0} deploy       : DEPLOY  CONFIGS
  sh ${0} example_tree : DISPLAY EXAMPLE_TREE(ALL)
  sh ${0} example_mra  : DISPLAY EXAMPLE_MRA(POP3)
  sh ${0} example_mta  : DISPLAY EXAMPLE_MTA(SMTP)
  sh ${0} example_mua  : DISPLAY EXAMPLE_MUA(MAILER)
  sh ${0} *            : USAGE

EOF:
  mutt

_EOT_
exit 1
}
 
function example_tree() {
cat<< _EOT_
Tree Description:
  <HOME>
  ├── <CLOUDSTORAGE_DIR>  // CLOSED //
  │   └── Mail
  │       ├── .getmail    // MRA
  │       │   ├── getmailrc_personal
  │       │   ├── getmailrc_work
  │       │   └── Maildir
  │       │       ├── personal
  │       │       │   └── INBOX
  │       │       │       ├── cur
  │       │       │       ├── new
  │       │       │       └── tmp
  │       │       └── work
  │       │           └── INBOX
  │       │               ├── cur
  │       │               ├── new
  │       │               └── tmp
  │       ├── .msmtprc    // MTA
  │       └── .mutt_local // MUA
  │           ├── my_data // (cat my_data -> muttrc)
  │           │   ├── from_personal
  │           │   ├── from_work
  │           │   ├── realname_personal
  │           │   ├── realname_work
  │           │   └── ...
  │           └── Maildir
  │               ├── personal
  │               │   ├── DRAFTS
  │               │   │   ├── cur
  │               │   │   ├── new
  │               │   │   └── tmp
  │               │   └── SENT
  │               │       ├── cur
  │               │       ├── new
  │               │       └── tmp
  │               └── work
  │                   ├── DRAFTS
  │                   │   ├── cur
  │                   │   ├── new
  │                   │   └── tmp
  │                   └── SENT
  │                       ├── cur
  │                       ├── new
  │                       └── tmp
  └── dotfiles // OPENED //
      └── bin
          ├── mail
          │   ├── install.sh // ALL
          │   ├── getmail.sh // MRA(rcfile) -> CRONTAB
          │   ├── .muttrc    // MUA
          │   └── .mutt      // MUA
          │       ├── .muttrc_personal
          │       ├── .muttrc_work
          │       └── scheme
          │           └── *
          └── install_archlinux
              └── etc
                  └── crontab // MRA(getmail)

_EOT_
exit 0
}

function example_mra() {
########## MRA(Mail Retrieval Agent) | POP3 ##########
cat<< _EOT_
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
  path = ~/.getmail/Maildir/personal/INBOX/

_EOT_
exit 0
}

function example_mta() {
cat<< _EOT_
########## MTA(Message Transfer Agent) | SMTP ##########
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
cat<< _EOT_
########## MUA(Mail User Agent) | MAILER ##########
Example(from_personal):
  xxx@gmail.com

Example(realname_personal):
  Michael\ Elkins

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
    ln -snfv "${HOME}/dotfiles/bin/mail/.muttrc" "${HOME}"
    ln -snfv "${HOME}/dotfiles/bin/mail/.mutt" "${HOME}"
    ;;
  example_tree | example_mra | example_mta | example_mua)
    ${1}
    ;;
  *)
    usage
    ;;
esac
