#!/bin/bash

readonly BLOCKDEVICE_PATH="/dev/sr0"
readonly MOUNTPOINT_PATH="/mnt"
readonly DATE_YYMMDD=`date "+%Y%m%d"`

function usage() {
cat<< _EOT_
Description:
  Disk Command

Usage:
  sh ${0} mount-disk                 : MOUNT   block_device(disk)
  sh ${0} mount-iso <*.iso_path>     : MOUNT   block_device(*.iso)
  sh ${0} umount                     : UMOUNT  block_device
  sh ${0} mkisofs   <dir_path>       : CONVERT directory/* -> *.iso
  sh ${0} ccd2iso   <*.img/ccd_path> : CONVERT *.img/ccd -> *.iso
  sh ${0} dd-disktoiso               : COPY    disk -> *.iso
  sh ${0} format-cd                  : FORMAT  CD-RW(Not multi-session)
  sh ${0} format-dvd                 : FORMAT  DVD-RW(Not multi-session)
  sh ${0} write-cd  <*.iso_path>     : WRITE   *.iso -> CD
  sh ${0} write-dvd <*.iso_path>     : WRITE   *.iso -> DVD/BD
  sh ${0} optical                    : DISPLAY optical_drive_name
  sh ${0} label                      : DISPLAY volume_label
  sh ${0} *                          : USAGE

_EOT_
exit 1
}

case ${1} in
  mount-disk)
    # sr0
    sudo mount ${BLOCKDEVICE_PATH} ${MOUNTPOINT_PATH}
    lsblk
    ;;
  mount-iso)
    # loop0
    sudo mount -t iso9660 -o ro,loop ${2} ${MOUNTPOINT_PATH}
    lsblk
    ;;
  umount)
    fuser -v ${MOUNTPOINT_PATH}
    sudo umount ${MOUNTPOINT_PATH}
    lsblk
    ;;
  mkisofs)
    mkisofs -V "ARCHIVE_${DATE_YYMMDD}" -J -r -o isoimage_${DATE_YYMMDD}.iso ${2}
    ;;
  ccd2iso)
    ccd2iso ${2} isoimage_${DATE_YYMMDD}.iso
    ;;
  dd-disktoiso)
    readonly BLOCKS="$(isosize -d 2048 ${BLOCKDEVICE_PATH})"
    dd if=${BLOCKDEVICE_PATH} of=isoimage_${DATE_YYMMDD}.iso bs=2048 count=${BLOCKS} status=progress
    ;;
  format-cd)
    cdrecord -v dev=${BLOCKDEVICE_PATH} blank=fast
    ;;
  format-dvd)
    dvd+rw-format -blank=full ${BLOCKDEVICE_PATH}
    ;;
  write-cd)
    cdrecord -v -sao dev=${BLOCKDEVICE_PATH} ${2}
    ;;
  write-dvd)
    growisofs -dvd-compat -Z ${BLOCKDEVICE_PATH}=${2}
    ;;
  optical)
    cdrecord dev=${BLOCKDEVICE_PATH} -checkdrive
    ;;
  label)
    dd if=${BLOCKDEVICE_PATH} bs=1 skip=32808 count=32
    ;;
  *)
    usage
    ;;
esac
