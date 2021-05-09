# macOS

## INSTALL(HOMEBREW + DOTFILES)
* [Xcode](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12)
* [Homebrew](https://brew.sh/index_ja.html)
* `bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/main/bin/install.sh)"`

## SETUP(GUI)
* terminal.app
    * Theme ... `~/path/to/Solarized_Dark_ansi.terminal`
* `open -a /Applications/System\ Preferences.app`
    * Firewall
    * Display
    * Keyboard ... `~/path/to/ユーザ辞書.plist`
    * iCloud ... `sign out`
* `open -a /Applications/Mail.app`
    * Account
    * Signature
* `open -a /Applications/Safari.app`
    * Bookmark ... `~/path/to/Bookmark/*`
* Install by binaryfile
    * [moraダウンローダー](https://mora.jp/help/hajimete?fmid=leftbannerA)
    * [HHKB Driver](https://www.pfu.fujitsu.com/hhkeyboard/download.html)
    * [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
        * USBポート共有 ... `sudo dscl . -append /Groups/vboxusers GroupMembership <USER NAME> ; id -p`
        * USBポート共有 ... [VirtualBoxでのUSBデバイス認識](https://qiita.com/civic/items/684c4b82428feb0c4ae1)
