# E-MAIL

## Installation

1. INSTALL Pkgs
   sh ${0} install
2. CREATE Directory/File
   mkdir *
   vi    *
3. DEPLOY Directory/File
   sh ${0} deploy

## Permission

    Directory : 0700
    File      : 0600

## Tree Description

    <HOME>
    ├── <CLOUDSTORAGE_DIR>      // CLOSED //
    │   └── Mail
    │       ├── .getmail        // MRA
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
    │       ├── .msmtprc        // MTA
    │       └── .mutt_local     // MUA
    │           ├── my_data     // (cat my_data -> muttrc)
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
    └── dotfiles                // OPENED //
        └── bin
            ├── email
            │   ├── install.sh  // ALL
            │   ├── getmail.sh  // MRA(rcfile) -> CRONTAB
            │   ├── .mailcap    // MUA
            │   └── .mutt       // MUA
            │       ├── muttrc
            │       ├── muttrc_personal
            │       ├── muttrc_work
            │       └── scheme
            │           └── *
            └── install_archlinux
                └── etc
                    └── crontab // MRA(getmail)

## Example

### MRA(Mail Retrieval Agent) # POP3
getmailrc_personal:

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

### MTA(Message Transfer Agent) # SMTP
.msmtprc:

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

### MUA(Mail User Agent) # MAILER
from_personal:

    xxx@gmail.com

realname_personal:

    Michael\ Elkins

