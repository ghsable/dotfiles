#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Xmodmap
if [ -s ~/.Xmodmap ]; then
 xmodmap ~/.Xmodmap
fi

# LANG(X11)
export LANG=ja_JP.UTF-8

# Uim
export GTK_IM_MODULE='uim'
export QT_IM_MODULE='uim'
uim-xim &
export XMODIFIERS='@im=uim'

# Xbindkeys
xbindkeys

# Xcompmgr
xcompmgr -c &

# Xset
xset s 60
xset dpms 120

# Feh
feh --randomize --bg-fill ~/wallpaper/*

# Xmobar
# xmobar ~/.xmobarrc &

# Xmonad
exec xmonad
