# ZSH

## Installation

    1. INSTALL Packages/Plugins
       sh install.sh install-packages
       sh install.sh install-plugins
    2. DEPLOY Directory/File
       sh install.sh deploy

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/vim/install.sh)

## Tree Description

    <HOME>
    ├─ .vim
    │  └─ pack
    │     └─ mypackage
    │        ├─ start
    │        │  └─ *              : plugins(autoload)
    │        │     └─ *
    │        └─ opt
    │           └─ *              : plugins(:packadd)
    │              └─ *
    └─ dotfiles
       └── bin
           └── vim
               ├── README.md   : this-file
               ├── install.sh  : install script
               ├── install.txt : install plugins-list
               ├── .vimrc      : config-file
               └── myconfig
                   └── *
                       └── *         : plugin-config-files

## UPDATE(Plugins)

    sh install.sh update

