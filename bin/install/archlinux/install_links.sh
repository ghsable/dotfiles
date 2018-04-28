#!/bin/bash

CMND01='sudo ln -snfv'
CMND02='ln -snfv'

PATH01_0=~/dotfiles/
PATH01_1=etc/redirect/
PATH01_2=nodot/
PATH01_3=bin/
PATH02=/etc/
PATH03=~/


${CMND01} ${PATH01_0}${PATH01_1}20-quiet-printk.conf       ${PATH02}sysctl.d/                   &&  #null dmesg
${CMND01} ${PATH01_0}${PATH01_1}00-keyboard.conf           ${PATH02}X11/xorg.conf.d/            &&  #localectl KeyboardLayout
${CMND01} ${PATH01_0}${PATH01_1}70-synaptics.conf          ${PATH02}X11/xorg.conf.d/            &&  #Synaptics
${CMND01} ${PATH01_0}${PATH01_1}pacman.conf                ${PATH02}                            &&  #PackageManager
${CMND01} ${PATH01_0}${PATH01_1}logind.conf                ${PATH02}systemd/                    &&  #Set Powerkey
${CMND01} ${PATH01_0}${PATH01_1}tlp                        ${PATH02}default/                    &&  #TLP

${CMND02} ${PATH01_0}${PATH01_2}.uim.d/                    ${PATH03}                            &&  #Uim
${CMND02} ${PATH01_0}${PATH01_2}imported_words_default.d/  ${PATH03}.anthy/                     &&  #Anthy(cannadic)
${CMND02} ${PATH01_0}${PATH01_2}Thunar/                    ${PATH03}.config/                    &&  #Thunar(CustomAction)
${CMND02} ${PATH01_0}${PATH01_2}userapp-feh-CJADVY.desktop ${PATH03}.local/share/applications/  &&  #Thunar(DefaultOpen+)
${CMND02} ${PATH01_0}${PATH01_2}xmonad.hs                  ${PATH03}.xmonad/                    &&  #Xmonad
${CMND02} ${PATH01_0}${PATH01_2}nvim/                      ${PATH03}.config/                    &&  #Neovim
${CMND02} ${PATH01_0}${PATH01_2}.mozilla/                  ${PATH03}                            &&  #Firefox
${CMND02} ${PATH01_0}${PATH01_2}.wallpaper/                ${PATH03}                            &&  #Wallpaper

${CMND02} ${PATH01_0}${PATH01_3}                           ${PATH03}                            &&  #~/bin

${CMND02} ${PATH01_0}.zlogin                               ${PATH03}                            &&  #Zsh
${CMND02} ${PATH01_0}.zshrc                                ${PATH03}                            &&  #Zsh
${CMND02} ${PATH01_0}.zsh_history                          ${PATH03}                            &&  #Zsh(HISTFILE)
${CMND02} ${PATH01_0}.Xmodmap                              ${PATH03}                            &&  #Xmodmap
${CMND02} ${PATH01_0}.xbindkeysrc                          ${PATH03}                            &&  #Xbindkeys
${CMND02} ${PATH01_0}.xinitrc                              ${PATH03}                            &&  #X11
${CMND02} ${PATH01_0}.Xresources                           ${PATH03}                            &&  #Xresources
${CMND02} ${PATH01_0}.xmobarrc                             ${PATH03}                                #Xmobar
