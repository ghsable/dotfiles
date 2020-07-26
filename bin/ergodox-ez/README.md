# ErgoDox-EZ

## Installation

    1. Initialize
       sh install.sh
    2. Display keycode-map(keycode.h) and Edit my-keymap(keymap.c)
       sh ergodox-ez.sh keycode
       sh ergodox-ez.sh edit
    3. Build my-keymap(keymap.c)
       sh ergodox-ez.sh build
       -> create : ergodox_ez_my-keymap.hex
    4. Write the hex file to the ErgoDox-EZ
       sh ergodox-ez.sh teensy
       -> Push "RESET" button on the ErgoDox-EZ
       -> File > Open HEX File > /path/to/ergodox_ez_my-keymap.hex
       -> Push "AUTO"  button on teensy

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/install.sh)

## Usage

    sh ergodox-ez.sh usage

this script : [ergodox-ez.sh](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/ergodox-ez.sh)

## Example

[my-keymap](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/my-keymap/README.md)

## Keyboard Layout Editor

[Keyboard Layout Editor](http://www.keyboard-layout-editor.com/)
