# ArchLinux

## Sources
- [インストールガイド](https://wiki.archlinux.jp/index.php/インストールガイド)
- [USBキーにArch Linuxをインストール](https://wiki.archlinux.jp/index.php/USB_キーに_Arch_Linux_をインストール)
- [パーティショニング](https://wiki.archlinux.jp/index.php/パーティショニング)

## Installation
example :
<table style="table-layout: auto;" width="100%">
  <tbody align="left">
    <tr>
      <td>Device</td>
      <td>Size</td>
      <td>Partition Type(MBR)</td>
      <td>Partition Type(GPT)</td>
      <td>Partition Name</td>
      <td>Filesystem</td>
      <td>Mount</td>
    </tr>
    <tr>
      <td>/dev/sdX1</td>
      <td>*GB</td>
      <td>HPFS/NTFS/exFAT</td>
      <td>[0700]Windows basic data</td>
      <td>windows</td>
      <td>exFat</td>
      <td>-</td>
    </tr>
    <tr>
      <td>/dev/sdX2</td>
      <td>512MB</td>
      <td>W95 FAT32(LBA)</td>
      <td>[ef00]EFI System</td>
      <td>boot</td>
      <td>fat32</td>
      <td>/boot *Bootable</td>
    </tr>
    <tr>
      <td>/dev/sdX3</td>
      <td>*GB</td>
      <td>Linux</td>
      <td>[8300]Linux filesystem</td>
      <td>*linux</td>
      <td>ext4(ext2)</td>
      <td>/</td>
    </tr>
  </tbody>
</table>

```
loadkeys jp106                         # 日本語キーボード読み込み
# デバイスの初期化/Partition Table作成
lsblk                                  # /dev/sdXを把握
gdisk /dev/sdX                         # 対話モードで初期化処理
(d) -> パーティション削除
(o) -> GPTテーブル作成
(w) -> 保存して終了
parted -l                              # /dev/sdXのPartition Tableを確認
# パーティショニング
cgdisk /dev/sdX                        # パーティショニング
mkfs.exfat /dev/sdX1                   # /dev/sdX1 format
mkfs.vfat -F 32 /dev/sdX2              # /dev/sdX2 format
mkfs.ext4 -O "^has_journal" /dev/sdX3  # /dev/sdX3 format
cfdisk /dev/sdX                        # filesystemを確認
# マウント/状態確認
mount /dev/sdX3 /mnt
mkdir /mnt/boot
mount /dev/sdX2 /mnt/boot
lsblk
# インターネット接続/確認
wifi-menu
ping archlinux.jp
# システムクロックを更新/確認
timedatectl set-ntp true
timedatectl status
# ミラー選択で全ての`Japan`を最上位に移動
vi /etc/pacman.d/mirrorlist
# ベースシステムのインストール(time outは再実行)
pacstrap /mnt base base-devel
# fstabの作成/確認
genfstab -U /mnt >>/mnt/etc/fstab
lsblk -f && cat /mnt/etc/fstab
# インストール先USBに入る
arch-chroot /mnt
# 初期設定(GitHubより自動セットアップ)
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_archlinux/liveusb/install.sh)"
# BootLoaderの設定(BootableUSB,MacBookの場合)
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_archlinux/liveusb/grub-install.sh)"
# BootLoaderの設定(WindowsPCの場合)
# 次回起動までにWindows環境上で、高速スタートアップ:無効、セキュアブート:無効 に設定しておく事を推奨
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install_archlinux/liveusb/refind-install.sh)"
# 終了処理
exit            # chrootを抜ける
umount -R /mnt  # アンマウント
reboot          # 再起動
# 一般ユーザー作成/rootユーザーログアウト
useradd -m -g wheel <YOUR_NAME>
passwd <YOUR_NAME>
exit
# 一般ユーザーでログイン
# ネットワーク接続/確認
nmtui
ping archlinux.jp
# GitHubより自動セットアップ(install.sh)
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install.sh)"
reboot
```

## Module
**Device**
* [Disk](https://github.com/ghsable/dotfiles/blob/master/bin/disk/README.md)
* [Printer](https://github.com/ghsable/dotfiles/blob/master/bin/printer/README.md)
* [Sound](https://github.com/ghsable/dotfiles/blob/master/bin/sound/README.md)
* [Bluetooth](https://github.com/ghsable/dotfiles/blob/master/bin/bluetooth/README.md)
* [ErgoDox-EZ](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/README.md)
* [Television](https://github.com/ghsable/dotfiles/blob/master/bin/television/README.md)

**General**
* [ZSH](https://github.com/ghsable/dotfiles/blob/master/bin/zsh/README.md)
* [Vim](https://github.com/ghsable/dotfiles/blob/master/bin/vim/README.md)
* [E-mail](https://github.com/ghsable/dotfiles/blob/master/bin/email/README.md)
* [VirtualBox](https://github.com/ghsable/dotfiles/blob/master/bin/virtualbox/README.md)
* [Wine](https://github.com/ghsable/dotfiles/blob/master/bin/wine/README.md)
* [Fcitx+Mozc](https://github.com/ghsable/dotfiles/blob/master/bin/fcitx_mozc/README.md)

**Programming Language**
* [Rust](https://github.com/ghsable/dotfiles/blob/master/bin/apl/rust/README.md)

