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

# load catppuccin theme for zsh-syntax-highlighting
source ~/.dotfiles/catppuccin-zsh-syntax-highlighting/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh

# custom catppuccin highlights for zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#cdd6f4,underline'
ZSH_HIGHLIGHT_STYLES[cursor]='none'

source $ZSH/oh-my-zsh.sh


# User configuration

# cursor
_set_vert_cursor() {
  echo -ne '\e[5 q'
}
precmd_functions+=(_set_vert_cursor)

# zsh-history-substring-search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="fg=#11111b,bg=#f38ba8"
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND="fg=#11111b,bg=#f5c2e7"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6c7086"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(forward-char)

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
# ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(backward-delete-char)

# zsh history
HISTSIZE=1000000
SAVEHIST=1000000
setopt EXTENDED_HISTORY

# setopt SHARE_HISTORY
unsetopt SHARE_HISTORY
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
# 20ms for key sequences
KEYTIMEOUT=2

# setup for bsd ls
export LSCOLORS='ExGxFxdaCxDaDahbadacec'

# setup for gnu ls
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';

# warkaround for wsl folder highlights
export LS_COLORS="ow=1;34:$LS_COLORS:ow=1;34"

# setup for zsh tab complete colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

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

# zoxide
if type zoxide > /dev/null
then
  eval "$(zoxide init zsh)"
  alias cd="z"
  alias cdi="zi"
fi

# eza
if type eza > /dev/null
then
  alias ls="eza -g -s Name --group-directories-first --time-style=long-iso --icons=auto"
  alias l="ls -la"
  alias la="ls -la -a"
  alias ll="ls -l"
fi

# bat
if type bat > /dev/null
then
  export BAT_THEME="Catppuccin Mocha"
  alias cat="bat --style=plain --paging=auto"
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
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --multi"
fi

# lazygit
if type lazygit > /dev/null
then
  # this is a fix for not showing the correct colors using delta
  export COLORTERM=truecolor
  export XDG_CONFIG_HOME="$HOME/.config"
fi

# yazi
if type yazi > /dev/null
then
  y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
  }
  alias yazi=y
fi

# superfile
if type superfile > /dev/null
then
  spf() {
    os=$(uname -s)
    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi
    # macOS
    if [[ "$os" == "Darwin" ]]; then
        export SPF_LAST_DIR="$HOME/Library/Application Support/superfile/lastdir"
    fi
    command superfile "$@"
    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
  }
  alias superfile=spf
fi

# nix-shell
nix-zsh() {
  nix-shell --run zsh "$@"
}

# nix env vars
export PUPPETEER_EXECUTABLE_PATH=/Users/valiuv/.nix-profile/bin/google-chrome-stable;

# edit current command in neovim keybind
bindkey '^e' edit-command-line

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
bindkey '^ ' fzf-completion

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -n "$ZSH_DEBUG" ]]; then
  zprof
fi
