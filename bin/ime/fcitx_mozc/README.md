# IME

*Fcitx + Mozc*
---
## Requirement
* [Fcitx](https://fcitx-im.org/wiki/Special:MyLanguage/Fcitx)
* [Mozc](https://github.com/google/mozc)
* [AZIK](http://hp.vector.co.jp/authors/VA002116/azik/azikinfo.htm)
    * [romantable.txt](https://raw.githubusercontent.com/ghsable/dotfiles/main/bin/ime/fcitx_mozc/romantables/romantable.txt)
    * [aziktable.txt](https://raw.githubusercontent.com/ghsable/dotfiles/main/bin/ime/fcitx_mozc/romantables/aziktable.txt)

## Installation

    1. INSTALL Packages
       sh install.sh install
    2. DEPLOY Directory/File
       sh install.sh deploy

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/main/bin/ime/fcitx_mozc/install.sh)

set env/start(`~/.xprofile`):

    export GTK_IM_MODULE='fcitx'
    export QT_IM_MODULE='fcitx'
    export XMODIFIERS='@im=fcitx'
    export DefaultIMModule='fcitx'
    fcitx autostart&

## Usage
change romantable:

    # OPEN Mozc(config_dialog)
    sh fcitx_mozc.sh mozc_a
    # 一般 > キー設定 > ローマ字テーブル > 編集... > 編集 > インポート > OK
    # > "~/bin/ime/fcitx_mozc/romantables/aziktable.txt" > Open

other:

    sh fcitx_mozc.sh usage

this script : [fcitx_mozc.sh](https://github.com/ghsable/dotfiles/blob/main/bin/ime/fcitx_mozc/fcitx_mozc.sh)
