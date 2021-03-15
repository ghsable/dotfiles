# *ibus + anthy*

## Requirement
* [ibus](https://github.com/ibus/ibus)
* [ibus-anthy](https://github.com/ibus/ibus-anthy)

## Installation

    1. INSTALL Packages
       sh install.sh install

this script : [install.sh](https://github.com/ghsable/dotfiles/blob/main/bin/ime/ibus_anthy/install.sh)

set env/start(`~/.xprofile`):

    export GTK_IM_MODULE='ibus'
    export QT_IM_MODULE='ibus'
    export XMODIFIERS=@im='ibus'
    ibus-daemon -drx

## Setup

    # --- ibus
    sh ibus_anthy.sh ibus
    # 一般 > 次の入力メソッド:<Alt>space、入力メソッド > 「日本語 - Anthy」「英語 - 英語(US)」
    # --- ibus-anthy
    # 一般 > プロパティーパネルを表示する:常に表示する > IBus-Anthyの設定を開く
    # 一般 > 入力モード:ひらがな、入力タイプ > キーボードレイアウト:us

this script : [ibus_anthy.sh](https://github.com/ghsable/dotfiles/blob/main/bin/ime/ibus_anthy/ibus_anthy.sh)
