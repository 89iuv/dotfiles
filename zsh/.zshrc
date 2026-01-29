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

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# warkaround for prompt length
# https://github.com/romkatv/powerlevel10k/issues/68
# ZLE_RPROMPT_INDENT=0

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting)

# set location and format for zsh compdump
export ZSH_COMPDUMP=$HOME/.zcompdump-${ZSH_VERSION}

source $ZSH/oh-my-zsh.sh

# User configuration

# load catppuccin theme for zsh-syntax-highlighting
source $ZSH_CUSTOM/helpers/zsh-syntax-highlighting/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh

# custom catppuccin highlights for zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=ZSH_HIGHLIGHT_STYLES[path]
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=ZSH_HIGHLIGHT_STYLES[path]
ZSH_HIGHLIGHT_STYLES[cursor]='none'

# fix for lazygit not showing correct colors
export COLORTERM=truecolor
export XDG_CONFIG_HOME="$HOME/.config"

# cursor
_set_vert_cursor() {
  echo -ne '\e[6 q'
}
precmd_functions+=(_set_vert_cursor)

# zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=#11111b,bg=#f38ba8"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=#11111b,bg=#f5c2e7"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c7086"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"

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

# zsh history
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY

setopt SHARE_HISTORY
# unsetopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# zsh reduce esc key delay
# https://www.johnhawthorn.com/2012/09/vi-escape-delays/
# 10ms for key sequences
KEYTIMEOUT=1

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# xargs
# https://unix.stackexchange.com/questions/141367/have-xargs-use-alias-instead-of-binary
# A trailing space in VALUE causes the next word to be checked for alias substitution when the alias is expanded.
alias xargs="xargs "

# less
alias m="less -ir"

# clear
alias cl="clear"
alias clx="clear -x"

# tmux
if type tmux > /dev/null
then
  alias tn="tmux new -A -s tmux"
  alias ta="tmux attach"
  alias tl="tmux ls"
fi

# zoxide
if type zoxide > /dev/null
then
  eval "$(zoxide init zsh)"
fi

# eza
if type eza > /dev/null
then
  alias l="eza -la -a -g -s Name --group-directories-first --time-style=long-iso --color=always --icons=always"
  alias la="eza -la -g -s Name --group-directories-first --time-style=long-iso --color=always --icons=always"
  alias ll="eza -l -g -s Name --group-directories-first --time-style=long-iso --color=always --icons=always"
fi

# bat
if type bat > /dev/null
then
  alias b="bat -pp --color=always"
  export BAT_THEME="Catppuccin Macchiato"
  export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

  help() {
    "$@" --help 2>&1 | bat --plain --language=help
  }
fi

# fzf
if type fzf > /dev/null
then
  source <(fzf --zsh)
  export FZF_DEFAULT_OPTS=" \
  --color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
  --color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
  --color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
  --color=selected-bg:#494D64 \
  --color=border:#6E738D,label:#CAD3F5"
  alias f="fzf --ansi"
fi

# python: uv
if type uv > /dev/null
then
  eval "$(uv generate-shell-completion zsh)"
fi

# copilot
if type copilot > /dev/null
then
  ask() {
    # NOTE: wrap your query in '' so that no globing or variable expantion takes place
    copilot --model gpt-4.1 --silent --prompt "$*" | bat -pp -l markdown
  }
  alias '??'='noglob ask'
fi

# move word by word
bindkey '^w' backward-kill-word
bindkey '^f' forward-word
bindkey '^b' backward-word

# format the current command in neovim keybind
bindkey '^x^e' edit-command-line

# super tab keybind
super-tab() {
  # if suggestion is visible
  if [[ -n "$POSTDISPLAY" ]]; then
    zle autosuggest-accept
  else
    zle fzf-completion
  fi
}
zle -N super-tab

# make zsh-autosuggestions ignore the super-tab widget
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(super-tab)

# set completion key keybindings
bindkey '^I' super-tab
bindkey '^ ' autosuggest-fetch
bindkey "^[" autosuggest-clear

# zsh-history-substring-search keybindings
bindkey "^p" history-substring-search-up
bindkey "^n" history-substring-search-down

# Turn off autocomplete beeps
unsetopt LIST_BEEP

# jump strainght to the first completion on tab key press
setopt menu_complete

# zsh menu select keybindings
bindkey -M menuselect "^p" reverse-menu-complete
bindkey -M menuselect "^n" menu-complete
bindkey -M menuselect "^[" undo

# run command on new line and show execution time
run() {
  clear

  # catppuccin colors
  PINK='\033[38;2;245;194;231m'
  RED='\033[38;2;243;139;168m'
  MAROON='\033[38;2;235;160;172m'
  BLUE='\033[38;2;137;180;250m'
  TEXT='\033[38;2;205;214;244m'

  echo -e "${BLUE}[Running]${TEXT} ${MAROON}$(pwd) $@${TEXT}"

  start_time=$(date +%s%3N)
  "$@"
  exit_code=$?
  end_time=$(date +%s%3N)
  elapsed_time=$((end_time - start_time))

  exit_code_color=""
  if [ $exit_code -ne 0 ]
  then
    exit_code_color="${RED}"
  else
    exit_code_color="${PINK}"
  fi

  seconds=$((elapsed_time / 1000))
  milliseconds=$((elapsed_time % 1000))
  time_str="${seconds}.${milliseconds}"

  echo ""
  echo "${BLUE}[Done]${TEXT} ${MAROON}exited with${TEXT} ${exit_code_color}code=$exit_code${TEXT} ${MAROON}in${TEXT} ${time_str} ${MAROON}seconds${TEXT}"
}

command_not_found_handle () {
  echo "zsh: command not found: $1" >&2
  return 127
}

# source .zshrc_local
if [ -f "$HOME/.zshrc_local" ]; then
  source "$HOME"/.zshrc_local
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -n "$ZSH_DEBUG" ]]; then
  zprof
fi
