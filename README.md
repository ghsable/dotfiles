# Dotfiles
  
## DEMO
<table style="table-layout:fixed;" width="100%">
  <tbody align="center">
    <tr>
      <td><img src="https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_macos/README.gif" alt="macos_README.gif"></td>
    </tr>
    <tr>
      <td>macOS</td>
    </tr>
    <tr>
      <td><img src="https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_archlinux/README.png" alt="archlinux_README.png"></td>
    </tr>
    <tr>
      <td>Arch Linux</td>
    </tr>
  </tbody>
</table>

## Installation
one-liner : 

    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install.sh)"

OS selection :
`macos`,`archlinux`

this script : 
[install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/install.sh)

- - -
or : 

    # CLONE DOTFILES
    git clone https://github.com/ghsable/dotfiles.git ~/dotfiles
    # EDIT
    vi ~/dotfiles/.gitconfig             # GitHub config
    vi ~/dotfiles/bin/install_<OS>/*.txt # Namelist(pkg,symbolic link...)
    # INSTALL
    cd ~/dotfiles
    make <OS>_install

## Tree Description
* `dotfiles/`
  * `.??*` : dotfiles(linux)
  * `doc/`
    * `* ` : documents
  * `bin/`
    * `*.sh` : scripts(linux)
      * `install_<OS>/`
        * `.??* ` : dotfiles(not linux)
        * `*.sh ` : install scripts
        * `*.txt` : `*.sh` needs this lists
        * `etc/`
          * `*.sh` : `etc.sh` needs this scripts
          * `*   ` : other configfiles

## Install Manual
* [macOS](https://github.com/ghsable/dotfiles/blob/master/bin/install_macos/README.md)
* [ArchLinux](https://github.com/ghsable/dotfiles/blob/master/bin/install_archlinux/README.md)
* [Windows](https://github.com/ghsable/dotfiles/blob/master/bin/install_windows/README.md)
* [iOS(iPhone)](https://github.com/ghsable/dotfiles/blob/master/bin/install_ios/iPhone/README.md)
* [iOS(iPad)](https://github.com/ghsable/dotfiles/blob/master/bin/install_ios/iPad/README.md)

## Install Checklist
* [checklist](https://github.com/ghsable/dotfiles/blob/master/bin/install_all/checklist.md)

## Thanks to ...
* [プリンシプル オブ プログラミング](http://www.shuwasystem.co.jp/products/7980html/4614.html)
