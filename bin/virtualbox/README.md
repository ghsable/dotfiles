# VirtualBox

## Installation

    # install Packages
    sh install.sh install
    # add Group(vboxusers)
    sh install.sh gpasswd
    # enable Services
    sh install.sh systemctl
    # load Modules
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

