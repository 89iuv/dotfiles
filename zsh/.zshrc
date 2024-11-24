# benchmark zsh
alias zsh-time="time zsh -i -c exit"
alias zsh-debug="time ZSH_DEBUG=1 zsh -i -c exit"
if [[ -n "$ZSH_DEBUG" ]]; then
  zmodload zsh/zprof
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugin config

# tmux integration
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_DEFAULT_SESSION_NAME="workspace"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# https://github.com/zsh-users/zsh-autosuggestions/issues/351
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(backward-delete-char)

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(evalcache tmux zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# User configuration

# Turn off autocomplete beeps
unsetopt LIST_BEEP

# zsh reduce esc key delay
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
# 10ms for key sequences
KEYTIMEOUT=1

# zsh history
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY

# keybindings
bindkey '^f' edit-command-line

# warkaround for ls colors
# setup for bsd ls
export LSCOLORS='ExGxFxdaCxDaDahbadacec'
# setup for gnu ls
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
# warkaround for wsl folder highlights 
export LS_COLORS='ow=1;34:'$LS_COLORS
# setup for zsh tab complete colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# default terminal editor
if type nvim > /dev/null
then
  export EDITOR='nvim'
fi

# Path configuration
# If $NVIM variable is not set then update the path variable
if [[ -z $NVIM ]]
then
  # add ~/.local/bin to the path
  export PATH=$HOME/.local/bin:$PATH
fi

# java: jenv
if [[ -d "$HOME/.jenv" ]]
then
  jenv() {
    unset -f jenv 
    export PATH="$HOME/.jenv/bin:$PATH"
    _evalcache jenv init -
    jenv "$@"
  }
fi

# python: pyenv
if [[ -d "$HOME/.pyenv" ]]
then
  pyenv() {
    unset -f pyenv 
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    _evalcache pyenv init -
    pyenv "$@"
  }
fi

# node: nvm
if [[ -d "$HOME/.nvm" ]]
then
  nvm() {
    unset -f nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm "$@"
  }
fi

# less
alias less="less -iR"

# zoxide
if type zoxide > /dev/null
then
  _evalcache zoxide init zsh
  alias cd="z"
  alias cdi="zi"
fi

# eza
if type eza > /dev/null
then
  alias ls="eza -g -s Name --group-directories-first --time-style long-iso --icons=auto"
  alias l="ls -la"
  alias la="ls -la -a"
  alias ll="ls -l"
fi

# fzf
if type fzf > /dev/null
then
  export FZF_DEFAULT_OPTS=" \
  --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
  --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
  --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
  --color=selected-bg:#494d64 \
  --multi"
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  alias fzf="fzf --ansi"
fi

# bat
if type bat > /dev/null
then
  export BAT_THEME="Catppuccin Macchiato"
  alias cat="bat --style=plain --paging=auto"

  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"

  help() {
    "$@" --help 2>&1 | bat --plain --language=help
  }
fi

# lazygit
if type lazygit > /dev/null
then
  # this is a fix for not showing the correct colors using delta
  export COLORTERM=truecolor
  export XDG_CONFIG_HOME="$HOME/.config"
  # workaround for ture colors in lazygit from tmux
  # https://github.com/jesseduffield/lazygit/issues/3668
  alias lazygit='env TERM=screen-256color lazygit'
fi

# github: copilot
if type gh > /dev/null
then
  _evalcache gh copilot alias -- zsh
  alias '??'='ghcs -t shell'
  alias '?git'='ghcs -t git'
  alias '?gh'='ghcs -t gh'
  alias '?h'='ghce'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Warkaround to fix duplicate entries in PATH
path_elements=$(echo "$PATH" | tr ':' '\n')
unique_elements=$(echo "$path_elements" | awk '!seen[$0]++' | tr '\n' ':')
export PATH=${unique_elements%:}

if [[ -n "$ZSH_DEBUG" ]]; then
  zprof
fi
