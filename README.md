# Dotfiles
  
## Installation
one-liner : 

    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install/install.sh)"

OS selection :
`macos`,`archlinux`

this script : 
[install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/install/install.sh)

- - -
or : 

    # CLONE DOTFILES
    git clone https://github.com/ghsable/dotfiles.git ~/dotfiles
    # EDIT
    vi ~/dotfiles/.gitconfig           # GitHub config
    vi ~/dotfiles/bin/<OS>/list/*.txt  # Namelist(pkg,symbolic link...)
    # INSTALL
    cd ~/dotfiles
    make <OS>_install

## Tree Description
- `dotfiles/`
  - `.??*` : dotfiles(Linux)
  - `doc/` : documents
  - `bin/` : scripts
     - `install/`
         - `<OS>/`
              - `*.sh` : install script
              - `.??*` : dotfiles(NOT Linux)
              - `list/` : `*.sh` needs this list
              - `etc/` : other config

## Install Manual
- [macOS](https://github.com/ghsable/dotfiles/blob/master/bin/install/macos/README.md)
- [ArchLinux](https://github.com/ghsable/dotfiles/blob/master/bin/install/archlinux/README.md)
- [Windows](https://github.com/ghsable/dotfiles/blob/master/bin/install/windows/README.md)
- [iOS(iPhone)](https://github.com/ghsable/dotfiles/blob/master/bin/install/ios/iPhone.md)
- [iOS(iPad)](https://github.com/ghsable/dotfiles/blob/master/bin/install/ios/iPad.md)

## Install Checklist
- [checklist](https://github.com/ghsable/dotfiles/blob/master/bin/install/all/checklist.md)

## Thanks to ...
- [プリンシプル オブ プログラミング](http://www.shuwasystem.co.jp/products/7980html/4614.html)
