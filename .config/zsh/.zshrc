# Config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
PROMPT="o2 %(?:%{$fg_bold[green]%}> :%{$fg_bold[red]%}> )"
PROMPT+="%{$fg[cyan]%}%c%{$reset_color%} "

# History in cache directory:
HISTSIZE=200000000
SAVEHIST=200000000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete
autoload -U compinit
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# Backwards tabbing
bindkey "^[[Z" reverse-menu-complete

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Hopping shortcuts
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Autocomplete from anywhere with backward tabbing
zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
bindkey -M menuselect "^[[Z" reverse-menu-complete

# Backward search
bindkey '^R' history-incremental-search-backward

# vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# TERM
export TERM=linux

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
