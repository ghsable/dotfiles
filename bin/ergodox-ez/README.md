# ErgoDox-EZ

## Installation

    sh install.sh

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/install.sh)

## Usage

    sh ergodox-ez.sh usage

this script : [ergodox-ez.sh](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/ergodox-ez.sh)

## Flow

    # Initialize
    sh install.sh

    # Display keycode-map(keycode.h)
    # Edit    my-keymap(keymap.c)
    sh ergodox-ez.sh keycode
    sh ergodox-ez.sh edit

    # Build my-keymap(keymap.c)
    sh ergodox-ez.sh build
    -> create : ergodox_ez_my-keymap.hex

    # Write the hex file to the ErgoDox-EZ
    sh ergodox-ez.sh teensy
    -> Push "RESET" button on the ErgoDox-EZ
    -> File > Open HEX File > /path/to/ergodox_ez_my-keymap.hex
    -> Push "AUTO"  button on teensy

    # Good Job! :D

## Example(My-Keymap)

[my-keymap](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/my-keymap/README.md)
