#!/bin/sh

# 変数代入
# $pacman -Qi の標準出力をリダイレクトしたファイル
file_a=~/dotfiles/doc/installation/installlist_arch/installlist_pacman.txt

# $pacman -S を順次実行
cat ${file_a} | grep -v -e '^$' -e '^#' | while read -r line
do
  echo "install ${line} ..."
  pacman -S ${line}
done

# 終了メッセージ
echo "#################### >> Finish!! Thanks :D"


LIST00="arch-install-scripts dosfstools parted"  #ArchInstallScripts      + mkfs.vfat              + PartitionUtility
LIST01="zsh zsh-syntax-highlighting"             #SHELL
LIST02="xorg-server xorg-server-utils"           #X11
LIST03="xf86-video-intel"                        #VideoDriver
LIST04="xf86-input-synaptics"                    #TouchDriver
LIST05="xorg-xbacklight"                         #BacklightUtility
LIST06="alsa-utils"                              #SoundUtility(ALSA)
LIST07="xorg-xmodmap"                            #KeyMapUtility
LIST08="xbindkeys"                               #KeybindUtility
LIST09="uim anthy otf-ipafont"                   #InputMethodFramework    + JPInputSystem          + JPFont
LIST10="ttf-symbola noto-fonts-emoji ttf-dejavu" #EmojiFont*2             + ENFont
LIST11="xorg-xset"                               #DisplayPowerManagement
LIST12="tlp tlp-rdw"                             #BatteryManager          + TLP(RadioDeviceWizard)
LIST13="slock"                                   #ScreenLock
LIST14="scrot simplescreenrecorder"              #ScreenShot              + ScreenCast
LIST15="xterm xorg-xrdb"                         #Terminal                + Xresources
LIST16="xorg-xinit"                              #DM
LIST17="xmonad xmonad-contrib"                   #WM
LIST18="xmobar"                                  #StatusBar
LIST19="xcompmgr transset-df xorg-xwininfo"      #CompositManager         + TranssetUtility        + GetWinInfo
LIST20="feh"                                     #SetWallpaper & ImgViwer
LIST21="neovim"                                  #Console Editor
LIST22="dmenu"                                   #AppsLauncher
LIST23="thunar tumbler"                          #FileManager             + Show IMGthumbnail
LIST24="zip unzip"                               #ZIP                     + unZIP
LIST25="screenfetch"                             #Show SystemInformation
LIST26="firefox firefox-i18n-ja flashplugin"     #WebBrowser              + JPFont                 + FlashPlugin
LIST27="mplayer"                                 #MoviePlayer
LIST28="leafpad"                                 #Memo
LIST29="graphicsmagick"                          #MakeGif
LIST30="libreoffice-fresh libreoffice-fresh-ja"  #Libreoffice             + JPFontUI
LIST31="jdk8-openjdk"                            #Java OpenJDK8
LIST32="mono"                                    #C#   Mono
