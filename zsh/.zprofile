# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# add personal scripts to path
export PATH=$HOME/.scripts:$PATH

# source .zprofile_local
if [ -f "$HOME/.zprofile_local" ]; then
  source "$HOME"/.zprofile_local
fi

# Clean up PATH
PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`
