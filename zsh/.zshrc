
# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[green]%}%t%b %B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt auto_cd #auto cd to directory without "cd"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
#setopt Auto_list

export PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export EDITOR=vim
export TERMINAL=st
export VISUAL=vim

#  Alias's to modified commands

  alias cat='bat'
  alias cls='clear'
  alias cp='cp -i'
  alias ezrc='vim $ZDOTDIR/.zshrc'
  alias jour='journalctl -r'
  alias jourb='journalctl -p 3 -xb'
  alias less='less -R'
  alias mirrorlist='cat /etc/pacman.d/mirrorlist'
  alias mkdir='mkdir -p'
  alias mv='mv -i'
  alias ping='ping -c 10'
  alias rm='trash -v'
  alias weather='curl wttr.in'
  alias vi='vim'
  alias svim='sudo vim'
  alias vis='vim "+set si"'
  alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
  function volchg() { pactl set-sink-volume @DEFAULT_SINK@ $1% }

#FZF related aliases
  alias installsearch="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"  
  alias removesearch="pacman -Qeq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
  alias vimfind='fzf --print0 | xargs -0 -o vim'
  alias svimfind='fzf --print0 | xargs -0 -o svim'

# Alias's for multiple directory listing commands
  alias killsession='kill $XSESSION_PID'

#Source listing aliases
source $ZDOTDIR/lslist.zsh

# vi keybind
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# CTRL-U to go up one directory
upone() {cd ..}
zle -N upone
bindkey "^U" upone

# autocomplete menuselect and styling
zstyle ':completion:*' menu no 
zstyle ':completion:*' gain-privileges 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

#if [ -f /usr/bin/fastfetch ]; then fastfetch;fi
source <(fzf --zsh)
source $ZDOTDIR/auto-ls.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/fzf-tab/zsh/fzf-zsh-completion.sh

autoload -U compinit && compinit
