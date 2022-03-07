# ------ ALIAS ------
# options
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias dirs='dirs -v'
alias mkdir='mkdir -pv'
alias ln='ln -snfv'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
# other
alias fc-list='fc-list : family | sort'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -e "time to full:" -e "time to empty:" -e "percentage:"'
# sh
alias feh='sh ~/bin/feh/feh_browser.sh'
alias xterm='sh ~/bin/tools.sh terminal_a'
alias mutt='sh ~/bin/tools.sh email'
alias suspend='sh ~/bin/xset.sh suspend'
alias incbrightness='sh ~/bin/brightness_acpi.sh +'
alias decbrightness='sh ~/bin/brightness_acpi.sh -'

# ------ PROMPT ------
# No.1
#PROMPT="%B%F{cyan}☠%f %F{cyan}[ %m@%U%n%u ] [ %~ ]%f
#%F{green}☠%f  %F{red}>%f%F{yellow}>%f%F{green}>%f%b "
#RPROMPT="%B[%*]%b"
# No.2
PROMPT=" %B%F{cyan}➜%f %F{cyan}( %~ )%f %F{red}✗%f%b "
#RPROMPT="%B(%*)%b"

# ------ GENERAL ------
# Set Keybind vi like
bindkey -v
# OFF Beep
setopt no_beep
setopt nolistbeep

# ------ HISTFILE ------
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

# ------ COMPLETION ------
# On Auto Completion [Tab]-CompleteMenu
autoload -Uz compinit
compinit
# On [Arrow] + bindkey [^Tab]-ReverseCompleteMenu
zstyle ':completion:*' menu select
bindkey "^[[Z" reverse-menu-complete
# Completion [a-z]=[A-Z]
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ------ COMMAND ------
# --- cd
# Auto cd
setopt auto_cd
# cd -> ls
function chpwd() { ls }
# --- pushd/popd/dirs
# Set Max size
DIRSTACKSIZE=50
# Set 'cd -[Tab]'
setopt auto_pushd
# Ignore All Overlap
setopt pushd_ignore_dups
# dirs -> cd
alias sd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
# --- ls
# export LS_COLORS + Set Completion colors
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ------ PACMAN ------
# junegunn/fzf(https://github.com/junegunn/fzf)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS='--height="90%" --reverse --border --margin=1,1 --inline-info --prompt="✗ " --header="-----" --preview="head -100 {}" --preview-window="down:15"'
export FZF_CTRL_T_OPTS='--preview="file {}" --preview-window="down:1"'
export FZF_CTRL_R_OPTS='--preview="echo {}" --preview-window="down:3"'
export FZF_ALT_C_OPTS='--preview "tree -C {} | head -100"'

# ------ PLUGINS ------
# zdharma-continuum/fast-syntax-highlighting(https://github.com/zdharma-continuum/fast-syntax-highlighting)
source ${HOME}/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# zsh-users/zsh-autosuggestions(https://github.com/zsh-users/zsh-autosuggestions)
source ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
