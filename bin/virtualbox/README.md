# VirtualBox

## Installation

    # install packages
    sh install.sh pacman
    # add group(vboxusers)
    sh install.sh gpasswd
    # enable services
    sh install.sh systemctl
    # load modules
    sh install.sh modprobe

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/virtualbox/install.sh)

## Tips

    # set autoload modules
    echo "\n# --- VirtualBox\nsh ~/bin/virtualbox/install.sh modprobe" >>~/.xprofile
    vim ~/.xprofile

## Usage

    sh virtualbox.sh usage

this script : [virtualbox.sh](https://github.com/ghsable/dotfiles/blob/master/bin/virtualbox/virtualbox.sh)

## Download

* [Windows](https://www.microsoft.com/ja-jp/software-download)
* [ArchLinux](https://www.archlinux.jp/download/)

