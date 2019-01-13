# ZSH

## Installation

    1. INSTALL Packages/Plugins
       sh install.sh install-packages
       sh install.sh install-plugins
    2. DEPLOY Directory/File
       sh install.sh deploy
    3. CHANGE Shell
       sh install.sh chsh

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/zsh/install.sh)

## Tree Description

    <HOME>
    ├─ .zsh
    │  └─ plugins
    │     └─ *              : plugins(source)
    │        └─ *
    └─ dotfiles
       └── bin
           └── zsh
               ├── README.md   : this-file
               ├── install.sh  : install script
               ├── install.txt : install plugins-list
               ├── .zlogin     : config-file
               └── .zshrc      : config-file

## Update(Plugins)

    sh install.sh update-plugins

