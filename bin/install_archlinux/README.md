# ArchLinux

## Sources
- [インストールガイド](https://wiki.archlinux.jp/index.php/インストールガイド)
- [USBキーにArch Linuxをインストール](https://wiki.archlinux.jp/index.php/USB_キーに_Arch_Linux_をインストール)
- [パーティショニング](https://wiki.archlinux.jp/index.php/パーティショニング)

## Installation
example : 

| Device    | Size  | Partition Type(MBR) | Partition Type(GPT)      | Partition Name | Filesystem      | Mount           |
| :---      | :---  | :---                | :---                     | :---           | :---            | :---            |
| /dev/sdX1 | *GB   | HPFS/NTFS/exFAT     | [0700]Windows basic data | windows        | exFat           | -               |
| /dev/sdX2 | 512MB | W95 FAT32(LBA)      | [ef00]EFI System         | boot           | fat32           | /boot *Bootable |
| /dev/sdX3 | *GB   | Linux               | [8300]Linux filesystem   | *linux         | ext4(ext2)      | /               |

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
* [Sound](https://github.com/ghsable/dotfiles/blob/master/bin/sound/README.md)
* [Bluetooth](https://github.com/ghsable/dotfiles/blob/master/bin/bluetooth/README.md)
* [Pentablet](https://github.com/ghsable/dotfiles/blob/master/bin/pentablet/README.md)
* [Disk](https://github.com/ghsable/dotfiles/blob/master/bin/disk/README.md)
* [Printer](https://github.com/ghsable/dotfiles/blob/master/bin/printer/README.md)
* [ErgoDox-EZ](https://github.com/ghsable/dotfiles/blob/master/bin/ergodox-ez/README.md)
* [Smart Card](https://github.com/ghsable/dotfiles/blob/master/bin/smartcard/README.md)
* [Finger print](https://github.com/ghsable/dotfiles/blob/master/bin/fingerprint/README.md)
* [Television](https://github.com/ghsable/dotfiles/blob/master/bin/television/README.md)

**General**
* [ZSH](https://github.com/ghsable/dotfiles/blob/master/bin/zsh/README.md)
* [Vim](https://github.com/ghsable/dotfiles/blob/master/bin/vim/README.md)
* [IME](https://github.com/ghsable/dotfiles/blob/master/bin/ime/README.md)
* [Filer](https://github.com/ghsable/dotfiles/blob/master/bin/filer/README.md)
* [E-mail](https://github.com/ghsable/dotfiles/blob/master/bin/email/README.md)
* [VirtualBox](https://github.com/ghsable/dotfiles/blob/master/bin/virtualbox/README.md)
* [Wine](https://github.com/ghsable/dotfiles/blob/master/bin/wine/README.md)

**Programming Language**
* [LLVM](https://github.com/ghsable/dotfiles/blob/master/bin/apl/llvm/README.md)
* [Tex](https://github.com/ghsable/dotfiles/blob/master/bin/apl/tex/README.md)
* [Rust](https://github.com/ghsable/dotfiles/blob/master/bin/apl/rust/README.md)
* [Go](https://github.com/ghsable/dotfiles/blob/master/bin/apl/go/README.md)
* [Python](https://github.com/ghsable/dotfiles/blob/master/bin/apl/python/README.md)
* [Java](https://github.com/ghsable/dotfiles/blob/master/bin/apl/java/README.md)
* [Mono](https://github.com/ghsable/dotfiles/blob/master/bin/apl/mono/README.md)
* [Ruby](https://github.com/ghsable/dotfiles/blob/master/bin/apl/ruby/README.md)

