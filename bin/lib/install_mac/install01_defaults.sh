#!/bin/sh

### General ###
# 各名称設定
sudo scutil --set ComputerName "MacBookAir"
sudo scutil --set HostName "localmac"
sudo scutil --set LocalHostName "localmac"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "MacBook-Air"
# .DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# メニューバーにBluetooth,Wifi,バッテリー,時計を表示
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"
# 強調表示色pmnをグリーンにする
defaults write NSGlobalDomain AppleHighlightColor -string '0.764700 0.976500 0.568600'
# 日付・曜日・24時間(秒なし)を表示
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"
# バッテリーのパーセントを表示させる
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Dashboardを無効にする
defaults write com.apple.dashboard mcx-disabled -bool true

### Dock ###
# Dockの標準AppをFinder,ゴミ箱以外削除する
defaults write com.apple.dock persistent-apps -array
# Dockを自動的に隠す
defaults write com.apple.dock autohide -bool true

### Finder ###
# 拡張子を常に表示
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# ステータスバーを表示
defaults write com.apple.finder ShowStatusBar -bool true
# パスバーを表示
defaults write com.apple.finder ShowPathbar -bool true
# タブバーを表示
defaults write com.apple.finder ShowTabView -bool true
# ライブラリディレクトリを表示
chflags nohidden ~/Library

### Safari ###
# 開発メニューを表示
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# デバッグメニューを表示
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# アドレスバーに完全なURLを表示
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# パスワードを自動入力・記録しない
defaults write com.apple.Safari AutoFillPasswords -bool false

# 終了メッセージ
echo "#################### >> Finish!! Thanks :D"
