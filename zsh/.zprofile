# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# python: pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

# nodejs: fnm
export FNM_PATH="$HOME/.fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# opencode
export OPENCODE_PATH="$HOME/.opencode/bin"
if [ -d "$OPENCODE_PATH" ]; then
  export PATH="$HOME/.opencode/bin:$PATH"
fi

# add personal scripts to path
export PATH=$HOME/.scripts:$PATH

# source .zprofile_local
if [ -f "$HOME/.zprofile_local" ]; then
  source "$HOME"/.zprofile_local
fi

# Clean up PATH
PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`
