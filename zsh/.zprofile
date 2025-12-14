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

# go
GO_INSTALL_PATH="/usr/local/go"
if [ -d "$GO_INSTALL_PATH" ]; then
  export PATH="$GO_INSTALL_PATH/bin:$PATH"

  export GOPATH="$HOME/.go"
  export PATH="$GOPATH/bin:$PATH"

fi

# add personal scripts to path
export PATH=$HOME/.scripts:$PATH

# Clean up PATH
PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`
