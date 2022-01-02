# LANG(Console)
export LANG='en_US.UTF-8'
# FONT(Console)
setfont latarcyrheb-sun32
# EDITOR
export EDITOR='vim'
# my commands
export PATH=${PATH}:${HOME}/bin:${HOME}/vimpacks
# a programming languages
source ~/bin/apl/env.sh


# AUTO STARTX
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
