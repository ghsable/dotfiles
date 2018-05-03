# Dotfiles
  
## DEMO
<table style="table-layout:fixed;" width="100%">
  <tbody align="center">
    <tr>
      <td><img src="https://github.com/ghsable/dotfiles/blob/master/bin/install/macos/README.gif" alt="macos_README.gif"></td>
    </tr>
    <tr>
      <td>macOS</td>
    </tr>
    <tr>
      <td><img src="https://github.com/ghsable/dotfiles/blob/master/bin/install/archlinux/etc/wallpaper/01.png" alt="archlinux_README.gif"></td>
    </tr>
    <tr>
      <td>Arch Linux</td>
    </tr>
  </tbody>
</table>

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
     - `*.sh` : scripts(Linux)
     - `install/`
         - `<OS>/`
              - `*.sh` : install scripts
              - `.??*` : dotfiles(NOT Linux)
              - `list/` : `*.sh` needs this lists
              - `etc/` : other configfiles
                     - `*.sh` : `etc.sh` needs this scripts

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
