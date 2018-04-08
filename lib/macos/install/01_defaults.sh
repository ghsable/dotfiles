#!/bin/sh

### General ###
# Set Name
sudo scutil --set ComputerName "MacBook"
sudo scutil --set HostName "localmac"
sudo scutil --set LocalHostName "localmac"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "MacBook"
# MenuBar -> Bluetooth,Wifi,Battery,Clock
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"
# MenuBar -> M/D(Day of the week) H:mm:ss
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"
# MenuBar -> % Battery
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Highlight color -> Green
defaults write NSGlobalDomain AppleHighlightColor -string '0.764700 0.976500 0.568600'
# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

### Dock ###
# Delete -> Other than Finder,trash box
defaults write com.apple.dock persistent-apps -array
# Enable autohide
defaults write com.apple.dock autohide -bool true

### Finder ###
# Display filename extension
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Display StatusBar
defaults write com.apple.finder ShowStatusBar -bool true
# Display PathBar
defaults write com.apple.finder ShowPathbar -bool true
# Display TabBar
defaults write com.apple.finder ShowTabView -bool true
# Display ~/Library
chflags nohidden ~/Library

### Safari ###
# Display Development menu
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# Display Debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# Display AddressBar -> Full URL
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Disable AutoFillPasswords
defaults write com.apple.Safari AutoFillPasswords -bool false

# End Message
cat ~/dotfiles/lib/macos/list/endmessage.txt
