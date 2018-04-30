# Installation
## 参考
- [インストールガイド](https://wiki.archlinux.jp/index.php/インストールガイド)
- [USBキーにArch Linuxをインストール](https://wiki.archlinux.jp/index.php/USB_キーに_Arch_Linux_をインストール)

## 事前準備
https://wiki.archlinux.jp/index.php/パーティショニング

日本語キーボード読み込み
    loadkeys jp106

パーティショニング
example :
<table style="table-layout:fixed;" width="100%">
  <tbody align="left">
    <tr>
      <td>Device</td>
      <td>Size</td>
      <td>Type</td>
      <td>Format</td>
      <td>Mount</td>
    </tr>
    <tr>
      <td>/dev/sdX1</td>
      <td>*GB</td>
      <td>HPFS/NTFS/exFAT</td>
      <td>exFat</td>
      <td>Windows</td>
    </tr>
    <tr>
      <td>/dev/sdX2</td>
      <td>512MB</td>
      <td>W95 FAT32(LBA)</td>
      <td>fat32</td>
      <td>/boot *Bootable</td>
    </tr>
    <tr>
      <td>/dev/sdX3</td>
      <td>*GB</td>
      <td>Linux</td>
      <td>ext4(ext2)</td>
      <td>/</td>
    </tr>
  </tbody>
</table>

    parted -l                              # /dev/sdXを把握
    cfdisk /dev/sdX                        # パーティショニング
    mkfs.exfat /dev/sdX1                   # format 1
    mkfs.vfat -F 32 /dev/sdX2              # format 2
    mkfs.ext4 -O "^has_journal" /dev/sdX3  # format 3
    parted -l                              # 確認

マウント
    mount /dev/sdX3 /mnt
    mkdir /mnt/boot /mnt/windows
    mount /dev/sdX2 /mnt/boot
    mount /dev/sdX1 /mnt/windows
    lsblk

インターネット接続/確認
    ping archlinux.jp

システムクロックを更新/確認
    timedatectl set-ntp true
    timedatectl status

## インストール
ミラー選択で`Japan`を最上位に移動
    vi /etc/pacman.d/mirrorlist

ベースシステムのインストール(`time out`は再実行)
    pacstrap /mnt base base-devel

## システム設定
`fstab`の作成/確認
    genfstab -U /mnt >> /mnt/etc/fstab
    lsblk -f
    cat /mnt/etc/fstab

インストール先USBに入る
    arch-chroot /mnt

- - -

## 初期設定
    pacman -Syu     # リポジトリ,パッケージのアップデート
    pacman -S git   # Gitをインストール
    bash -c "$(curl -fsSL <URL>)"
    exit            # chrootを抜ける
    umount -R /mnt  # アンマウント
    reboot          # 再起動

- - -

## 一般ユーザー作成
    useradd -m -g wheel <YOUR NAME>
    passwd <YOUR NAME>
    exit

## ネットワーク接続
    sudo systemctl start NetworkManager
    nmtui && ping google.com

## GitHubより自動セットアップ
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install/install.sh)"
    reboot
