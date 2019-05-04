# Dotfiles

## GitHub Pages
* [Dotfiles](https://ghsable.github.io/dotfiles/)

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
      <td><img src="https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_archlinux/README.gif" alt="archlinux_README.png"></td>
    </tr>
    <tr>
      <td>Arch Linux</td>
    </tr>
  </tbody>
</table>

## Requirement
MacBook Air(13-inch, Mid 2012) : 

    Processor     : Intel Core i7-3667U 
    Memory        : 4GB*2(1600MHz DDR3L)
    Graphics      : Intel HD Graphics 4000
    Storage(SATA) : APPLE SSD SM256E

ThinkPad X220 Tablet : 

    Processor           : -
    processor Griss     : -
    Processor Fan       : -
    Processor Fan Griss : -
    Memory              : -
    Graphics            : -
    Storage(SATA)       : -
    Storage(mSATA)      : -
    Wireless            : -
    Battery             : -
    Keyboard            : -
    Track Point         : -
    Digitizer Pen       : -
    Express Card        : -
    Sticker             : -

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
    git clone --depth=1 https://github.com/ghsable/dotfiles.git ~/dotfiles
    # EDIT
    vi ~/dotfiles/.gitconfig             # GitHub config
    vi ~/dotfiles/bin/install_<OS>/*.txt # namelist(pkg,symbolic link...)
    # INSTALL
    cd ~/dotfiles
    make <OS>_install

## Tree Description

    dotfiles
    ├── .??*   : dotfiles(linux)
    ├── doc
    │  └── *.md   : documents 
    └──bin
       ├── *.sh   : scripts(linux)
       ├── *
       │   └── *     : projects sources(linux)
       └── install_<OS>
           ├── .??*  : dotfiles
           ├── *.sh  : install scripts
           ├── *.txt : *.sh needs this namelists
           └── etc
              ├── *.sh  : etc.sh needs this scripts
              └── *     : other config files

## Install Manual
* [macOS](https://github.com/ghsable/dotfiles/blob/master/bin/install_macos/README.md)
* [ArchLinux](https://github.com/ghsable/dotfiles/blob/master/bin/install_archlinux/README.md)
* [Windows](https://github.com/ghsable/dotfiles/blob/master/bin/install_windows/README.md)
* [iOS(iPhone)](https://github.com/ghsable/dotfiles/blob/master/bin/install_ios/iPhone/README.md)
* [iOS(iPad)](https://github.com/ghsable/dotfiles/blob/master/bin/install_ios/iPad/README.md)

## Install Checklist
* [checklist](https://github.com/ghsable/dotfiles/blob/master/bin/install_all/checklist.md)

## Thanks to ...
**BOOK**
* [プリンシプル オブ プログラミング](http://www.shuwasystem.co.jp/products/7980html/4614.html)

**WEB**
* [ArchWiki](https://www.archlinux.jp/)
* [Shell Style Guide](https://google.github.io/styleguide/shell.xml)
