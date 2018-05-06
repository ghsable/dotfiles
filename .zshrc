### ALIAS ###
# options
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias dirs='dirs -v'
alias mkdir='mkdir -pv'
alias ln='ln -snfv'
alias grep='grep --color=auto'
alias df='df -h'
alias df='du -h'
alias zip='zip -e'
alias vim='vi'
# other
alias sd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -e "time to full:" -e "time to empty:" -e "percentage:"'
alias rec='simplescreenrecorder'
# sh
alias feh='sh ~/bin/feh_browser.sh'
alias incbrightness='sh ~/bin/brightness_acpi.sh +'
alias decbrightness='sh ~/bin/brightness_acpi.sh -'
alias onscreensaver='sh ~/bin/xset.sh on 60'
alias offscreensaver='sh ~/bin/xset.sh off'
alias suspend='sh ~/bin/xset.sh suspend'

### PROMPT ###
PROMPT="%B%F{cyan}☠%f %F{cyan}[ %m@%U%n%u ] [ %~ ]%f
%F{green}☠%f  %F{red}>%f%F{yellow}>%f%F{green}>%f%b "
RPROMPT="%B[%*]%b"

### GENERAL ###
# Set Keybind vi
bindkey -v
# OFF Beep
setopt no_beep

## HISTFILE ##
# Set HISTFILE
HISTFILE=~/dotfiles/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# Ignore All Overlap
setopt hist_ignore_all_dups
# Ignore Start Space~Command
setopt hist_ignore_space
# Ignore extra Space
setopt hist_reduce_blanks
# Share HISTFILE
setopt share_history
# Search HISTFILE + bindkey [^P]-Up [^N]-Down
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

### COMPLETION ###
# Set Syntax-highlight(Fish like)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# On Auto Completion [Tab]-CompleteMenu
autoload -Uz compinit
compinit
# On [Arrow] + bindkey [^Tab]-ReverseCompleteMenu
zstyle ':completion:*' menu select
bindkey "^[[Z" reverse-menu-complete
# Completion [a-z]=[A-Z]
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# export LS_COLORS + Set Completion colors
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### CD ###
# Auto cd
setopt auto_cd
# cd -> ls
function chpwd() { ls }

### PUSHD ###
# Set Max size
DIRSTACKSIZE=50
# Set cd = pushd
setopt auto_pushd
# Ignore All Overlap
setopt pushd_ignore_dups
