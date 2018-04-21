### 目的 ###
USBドライブにArchLinuxの環境を構築する。

### 前提 ###
- 速度の出る比較的高価なUSBドライブである。
  ※性能が悪いとpackageインストール時に"time out"が頻発し効率が悪い
- LiveUSBが作成済みである。
  下記URLの「macOS」を参照。
  https://wiki.archlinux.jp/index.php/USB_インストールメディア

### 導入手順 ###

++ chroot までの作業 ++
# 下記URLの通りに進行する。
  https://wiki.archlinux.jp/index.php/インストールガイド
  https://wiki.archlinux.jp/index.php/USB_キーに_Arch_Linux_をインストール

## インストールの準備

# 日本語キーボード読み込み
  $ loadkeys jp106

# 下記URLの「パーティショニングツール」を参照して、"/dev/sdX"の把握及びパーティショニング。
  https://wiki.archlinux.jp/index.php/パーティショニング
  $ parted -l
  $ cfdisk /dev/sdX
  # サイズは「パーティション形態」を参照。
    eg) /dev/sdX1 -> 5GB   | Type: HPFS/NTFS/exFAT | exFat      | ホスト共有用
        /dev/sdX2 -> 600MB | Type: W95 FAT32(LBA)  | fat32      | /boot用 *Bootable
        /dev/sdX3 -> 10GB  | Type: Linux           | ext4(ext2) | /用
    $ mkfs.exfat /dev/sdX1
    $ mkfs.vfat -F 32 /dev/sdX2
    $ mkfs.ext4 -O "^has_journal" /dev/sdXX
    $ parted -l

  # マウント。
    $ mount /dev/sdX3 /mnt
    $ mkdir /mnt/boot
    $ mount /dev/sdX2 /mnt/boot
    $ mkdir /mnt/windows
    $ mount /dev/sdX1 /mnt/windows
    $ lsblk

  # インターネット接続を確認。
    $ ping archlinux.jp
  # システムクロックを更新/確認。
    $ timedatectl set-ntp true
    $ timedatectl status

## インストール
  # ミラー選択で"Japan"を最上位に移動。
    $ vi /etc/pacman.d/mirrorlist
  # ベースシステムのインストール。
  ※"time out"で失敗しても次に進んでしまうため一部失敗したら再度実行をする。
    $ pacstrap /mnt base base-devel

## システム設定

# fstabの作成/確認。
    $ genfstab -U /mnt >> /mnt/etc/fstab
    $ lsblk -f
    $ cat /mnt/etc/fstab

# chrootでインストール先USBのシステムに入る。
    $ arch-chroot /mnt

++ chrootからの作業 ++

# システム全体をアップデートしgitをインストールする。(chroot前にやると壊れるためここで行う)
# dotfilesを/homeにダウンロードしておく。(/tmpに保存すると消去されるので/homeにCloneする)
  $ pacman -Syu && pacman -S git
  $ cd /home
  $ git clone https://glsara@gitlab.com/glsara/dotfiles.git

# installbaseusb.shを実行する。(packageのインストールが一部失敗したら再度実行をする)
  (念のため/etc/mkinitcpio.confにおいて既存の"HOOK=~udev~"と最終行に追加した"HOOK=~udev block~"を置き換える)
  $ sh /home/dotfiles/bin/installbaseusb.sh

# chrootを抜け、アンマウントをして再起動をする。
  $ exit
  $ umount -R /mnt
  $ reboot

### 導入後手順 ###
+ 新規ArchLinux
[[[ # rootでログインをし、一般ユーザーを作成しログインし直す。
      $ useradd -m -g wheel suna
      $ passwd suna
      $ exit

    # 一般ユーザーでNetworkManagerをスタートさせ、ネットワーク接続を行う。(デーモンの設定はinstall_config.shで行う)
      $ sudo systemctl start NetworkManager
      $ nmtui && ping google.com

    # /home/dotfilesの権限を変更し一般ユーザーの~/に移動させinstall.shを実行する。(install_apps.shが一部失敗したら再度実行をする)
      $ sudo chown -R suna:wheel /home/dotfiles
      $ sudo mv /home/dotfiles ~/ && ls -l ~/dotfiles/*
      $ sh ~/dotfiles/bin/install.sh
      $ reboot
      (再起動後の起動が通常よりも遅いが複数回再起動していれば改善される)

    # Webブラウザを下記の順番でセットアップする。
    # Firefox起動 -> 1Passwordへアクセス -> Firefox Sync -> ツールバーのボタンを整理 -> アカウント認証 .
]]]

}}} 終
