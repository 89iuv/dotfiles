# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# python: pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]]; then 
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi

# nodejs: fnm
FNM_PATH="$HOME/.fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env --shell zsh)"
fi

# add personal scripts to path
export PATH=$HOME/.scripts:$PATH

# Clean up PATH
PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`
