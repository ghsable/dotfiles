# LANG(Console)
export LANG=en_US.UTF-8
# EDITOR
export EDITOR=vi

# CRONTAB
crontab ~/bin/install_archlinux/etc/crontab

# AUTO STARTX
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
