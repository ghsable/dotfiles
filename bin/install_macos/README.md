# macOS

## INSTALL(HOMEBREW + DOTFILES)
* [Xcode](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12)
* [Homebrew](https://brew.sh/index_ja.html)
* `bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install.sh)"`

## SETUP(GUI)
* terminal.app
    * Theme ... `~/path/to/Solarized_Dark_ansi.terminal`
* `open -a /Applications/1Password.app`
* `open -a /Applications/System\ Preferences.app`
    * Firewall
    * Display
    * Keyboard ... `~/path/to/ユーザ辞書.plist`
    * iCloud ... `sign out`
* `open -a /Applications/Mail.app`
    * Account
    * Signature
* `open -a /Applications/Safari.app`
    * Bookmark ... `~/path/to/Bookmark/*`
    * Addon
        * [Safari 1Password extension](https://safari-extensions.apple.com/details/?id=com.agilebits.onepassword4-safari-2BUA8C4S2C)
        * [Safari Buffer](https://safari-extensions.apple.com/details/?id=com.bufferapp.buffer-UYDA63C4EC)
        * [Safari Evernote Web Clipper](https://safari-extensions.apple.com/details/?id=com.evernote.safari.clipper-Q79WDW8YH9)
* `open -a /Applications/5KPlayer.app`
    * Account
    * Window(Top)
    * Update(Off)
* `open -a /Applications/iTunes.app`
    * 環境設定
        * iTunes Media ... /Dropbox/Home/Music
        * Check ... iTunes Media フォルダを整理
        * Check ... iTunes Media フォルダにコピーする
    * /Dropbox/Home/Music -(drag-and-drop)-> iTunesライブラリ
* Install by binaryfile
    * [moraダウンローダー](https://mora.jp/help/hajimete?fmid=leftbannerA)
    * [HHKB Driver](https://www.pfu.fujitsu.com/hhkeyboard/download.html)
    * [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
        * USBポート共有 ... `sudo dscl . -append /Groups/vboxusers GroupMembership <USER NAME> ; id -p`
        * USBポート共有 ... [VirtualBoxでのUSBデバイス認識](https://qiita.com/civic/items/684c4b82428feb0c4ae1)
- - -
* `open -a /Applications/Firefox.app`
    * Account
    * Addon
* `open -a /Applications/Google\ Chrome.app`
    * Account
    * Addon
* `open -a /Applications/MacZip4Win.app`
    * Check ... `Zip Each`,`No Compress`,`Encypt` -> `Make default`
* Install by binaryfile
    * [Adobe Flash Player](https://get.adobe.com/jp/flashplayer/)
        * Safari
    * [Microsoft Office](https://stores.office.com/myaccount/home.aspx?ms.officeurl=myaccount)
        * Account
