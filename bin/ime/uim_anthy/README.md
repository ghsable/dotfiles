# *Uim + Anthy*

## Requirement
* [Uim](https://github.com/uim/uim)
* [Anthy](http://anthy.osdn.jp/)

## Installation

    1. INSTALL Packages
       sh install.sh install
    2. DEPLOY Directory/File
       sh install.sh deploy

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/main/bin/ime/uim_anthy/install.sh)

set env/start(`~/.xprofile`):

    export GTK_IM_MODULE='uim'
    export QT_IM_MODULE='uim'
    export XMODIFIERS='@im=uim'
    uim-xim &

## Usage

    uim-pref-gtk


