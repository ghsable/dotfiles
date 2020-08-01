# LANG(Console)
export LANG='en_US.UTF-8'
# FONT(Console)
setfont latarcyrheb-sun32
# EDITOR
export EDITOR='vim'
# BROWSER
export BROWSER='firefox'
# LESS
export LESS='-M -W -R -XXX -N -J -Q -F -X -K -I -a'
# my commands
export PATH=${PATH}:${HOME}/bin:${HOME}/vimpacks
# a programming language env
source ~/bin/apl/env.sh

# CRONTAB
crontab ~/bin/install_archlinux/etc/crontab

# AUTO STARTX
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
