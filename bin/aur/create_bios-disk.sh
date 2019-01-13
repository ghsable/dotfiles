#!/bin/bash

function usage() {
cat<< _EOT_
Description:
  Create BIOS-Disk(USB)

Requirement:
  geteltorito(https://aur.archlinux.org/packages/geteltorito/)

Flow:
  http://paz3.hatenablog.jp/entry/2017/05/11/230922

Usage:
  sh ${0} convert-img <*.iso_path> : 1. CONVERT *.iso -> *.img
  sh ${0} display-usb              : 2. DISPLAY device name
  sh ${0} write-usb   </dev/sd*>   : 3. WRITE   *.img -> block device
  sh ${0} *                        : -. USAGE

_EOT_
exit 1
}

case ${1} in
  convert-img)
    geteltorito.pl -o bios.img ${2}
    ;;
  display-usb)
    lsblk
    ;;
  write-usb)
    dd if=bios.img of=${2} bs=512k
    ;;
  *)
    usage
    ;;
esac
