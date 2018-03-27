## alias ##
alias ls='ls -GF'
alias la='ls -Ga'
alias ll='ls -Gl'
alias dirs='dirs -v'
alias sd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
alias mkdir='mkdir -p'
alias grep='grep --color=auto'
alias df='df -h'
alias df='du -h'

## PROMPT ##
PROMPT="🍣  %B%F{cyan}[%f %F{cyan}%m@%U%n%u%f %F{cyan}]%f [ %~ ]%b
🍣  %F{red}>%f%F{yellow}>%f%F{green}>%f%b "
RPROMPT="%B[%*]"

## General ##
# Set Keybind vi
bindkey -v
# OFF Beep
setopt no_beep

## HISTFILE ##
# Set HISTFILE
HISTFILE=~/.zsh_history
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

## Completion ##
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

## cd ##
# Auto cd
setopt auto_cd
# cd -> ls
function chpwd() { ls }

## pushd ##
# Set Max size
DIRSTACKSIZE=50
# Set cd = pushd
setopt auto_pushd
# Ignore All Overlap
setopt pushd_ignore_dups
