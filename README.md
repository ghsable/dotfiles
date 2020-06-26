# dotfiles
[dotfiles](https://ghsable.github.io/dotfiles/) is my Dotfiles.

## Requirement
macOS :

    # MacBook Air(13-inch, Mid 2012)
    Processor     : Intel Core i7-3667U 
    Memory        : 4GB*2(1600MHz DDR3L)
    Graphics      : Intel HD Graphics 4000
    Storage(SATA) : APPLE SSD SM256E

Windows,Arch Linux :

    # ThinkPad X220 Tablet
    Processor           : Intel Core i7-2640M
    processor Griss     : Thermal Grizzly Kryonaut
    Processor Fan       : 04W0435
    Processor Fan Griss : Tamiya Molybdenum Grease
    Memory              : CT2KIT102464BF160B
    Graphics            : Intel HD Graphics 3000
    Storage(SATA)       : SDSSDH3-1T00-J25
    Storage(mSATA)      : -
    Wireless            : 04W3814/04X6010
    Bluetooth           : 60Y3303/60Y3305
    Battery             : 0A36286
    Keyboard            : 45N2242
    Track Point         : 73P2698
    Digitizer Pen       : 04W1477
    Express Card        : AYWS USB3.0 ExpressCard 54mm
    Sticker             : IBM ThinkPad

Windows :

    # Homebuilt Computer
    Motherboard                 : ASRock X570 Creator
    Processor                   : AMD Ryzen 9 3950X 16-Core Processor(Matisse)
    processor Griss             : Thermal Grizzly Kryonaut
    Processor Fan               : Noctua NH-D15
    Memory                      : W4U3200CM-16G
    Memory Heatsink             : JP-DDR-12V-B-2P-1
    Graphics                    : NVIDIA GeForce RTX 2080 Ti Founders Edition
    Video Capture Board         : 10GAS9901
    Storage1(M.2_SSD Type 2280) : GP-ASM2NE6100TTTD
    Storage2(M.2_SSD Type 2280) : SSDPEKKW512G8XT
    Power Supply                : Antec HCG1000 EXTREME
    PC Case                     : Projet-M PM-TESTBOARD

## Installation
Install :
> * [macOS](https://github.com/ghsable/dotfiles/blob/master/bin/install_macos/README.md)
> * [ArchLinux](https://github.com/ghsable/dotfiles/blob/master/bin/install_archlinux/README.md)
> * [Windows](https://github.com/ghsable/dotfiles/blob/master/bin/install_windows/README.md)
> * [iOS(iPhone)](https://github.com/ghsable/dotfiles/blob/master/bin/install_ios/iPhone/README.md)
> * [iOS(iPad)](https://github.com/ghsable/dotfiles/blob/master/bin/install_ios/iPad/README.md)

Check :
> * [checklist](https://github.com/ghsable/dotfiles/blob/master/bin/install_all/checklist.md)

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

demo :
| ![Setup process on macOS][setup macos] | ![Setup process on ArchLinux][setup archlinux] |
|:--------------------------------------:|:----------------------------------------------:|
| `macOS`                                | `Ubuntu`                                       |

<!-- Link labels: -->
[setup macos]: https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_macos/README.gif
[setup archlinux]: https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_archlinux/README.gif

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

## Thanks
> Book
>> * [The Principles of Programming](http://www.shuwasystem.co.jp/products/7980html/4614.html)
>
> Web
>> * [ArchWiki](https://www.archlinux.jp/)
>> * [Shell Style Guide](https://google.github.io/styleguide/shell.xml)

## TODO
* README.md
