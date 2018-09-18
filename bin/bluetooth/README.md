# Bluetooth

## Installation

    sh install.sh

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/master/bin/bluetooth/install.sh)

## Usage

bluetoothctl:

    # bluetoothctl is a cli tool for setting bluetooth.
    # START bluetoothctl
    sh bluetooth.sh bluetoothctl
    # DISPLAY bluetooth-controller
    list
    # SELECT bluetooth-controller
    select <MAC_Address>
    # POWER-ON bluetooth-controller(default:off)
    power on
    # DISPLAY bluetooth-devices
    scan on
    devices
    # ON Agent
    agent on
    # PAIRING bluetooth-devices
    pair <MAC_Address>
    # TRUST bluetooth-devices
    trust <MAC_Address>
    # CONNECT bluetooth-devices
    connect <MAC_Address>
    # Good Job! :D

blueberry:

    # blueberry is a gui tool for setting bluetooth.
    # START blueberry
    sh bluetooth.sh blueberry
    # PAIRING & CONNECT bluetooth-devices
    # Good Job! :D

this script : [bluetooth.sh](https://github.com/ghsable/dotfiles/blob/master/bin/bluetooth/bluetooth.sh)

