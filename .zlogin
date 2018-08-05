# LANG(Console)
export LANG='en_US.UTF-8'
# EDITOR
export EDITOR='vim'
# LESS
export LESS='-M -W -R -XXX -N -J -Q -F -X -K -I -a'
# rust-src(https://aur.archlinux.org/rust-src.git)
# $(rustc --print sysroot) -> /usr
export RUST_SRC_PATH='/usr/lib/rustlib/src/rust/src'

# CRONTAB
crontab ~/bin/install_archlinux/etc/crontab

# AUTO STARTX
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
