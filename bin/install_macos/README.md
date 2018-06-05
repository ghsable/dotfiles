# Installation
## INSTALL(HOMEBREW + DOTFILES)
* [Xcode](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12)
* [Homebrew](https://brew.sh/index_ja.html)
* `bash -c "$(curl -fsSL https://raw.githubusercontent.com/ghsable/dotfiles/master/bin/install.sh`

## SETUP(GUI)
* `open -a /Applications/1Password.app`
* `open -a /Applications/App\ Store.app`
* `open -a /Applications/System\ Preferences.app`
    * Firewall
    * Display
    * Keyboard ... `~/etc/ユーザ辞書.plist`
    * iCloud ... `sign out`
* `open -a /Applications/Mail.app`
    * Account
    * Signature
* terminal.app
    * Theme ... `~/etc/Solarized_Dark_ansi.terminal`
* `open -a /Applications/Safari.app`
    * Bookmark ... `~/etc/Bookmark/*`
    * Addon
        * [Safari 1Password extension](https://safari-extensions.apple.com/details/?id=com.agilebits.onepassword4-safari-2BUA8C4S2C)
        * [Safari Buffer](https://safari-extensions.apple.com/details/?id=com.bufferapp.buffer-UYDA63C4EC)
        * [Safari Evernote Web Clipper](https://safari-extensions.apple.com/details/?id=com.evernote.safari.clipper-Q79WDW8YH9)
* `open -a /Applications/5KPlayer.app`
    * Account
    * Window(Top)
    * Update(Off)
* `open -a /Applications/Firefox.app`
    * Account
    * Addon
* `open -a /Applications/Google\ Chrome.app`
    * Account
    * Addon
* `open -a /Applications/MacZip4Win.app`
    * Check ... `Zip Each`,`No Compress`,`Encypt` -> `Make default`
* `open ~/`
    * Side Display(Column)
        * `/Applocation`
        * `~/`
        * `~/Download`
        * `/Dropbox`
        * `Dropbox/Recheck`
* `open -a /Applications/iTunes.app`
    * 環境設定
        * iTunes Media ... Dropbox
        * Check ... iTunes Media フォルダを整理
        * Check ... iTunes Media フォルダにコピーする
    * Dropbox -(drag-and-drop)-> iTunesライブラリ
* Install by binaryfile
    * [Microsoft Office](https://stores.office.com/myaccount/home.aspx?ms.officeurl=myaccount)
        * Account
    * [Adobe Flash Player](https://get.adobe.com/jp/flashplayer/)
        * Safari
    * [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads)
        * USBポート共有 ... `sudo dscl . -append /Groups/vboxusers GroupMembership <USER NAME> ; id -p`
        * USBポート共有 ... [VirtualBoxでのUSBデバイス認識](https://qiita.com/civic/items/684c4b82428feb0c4ae1)