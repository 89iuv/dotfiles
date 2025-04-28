# brew
if [ -e '/opt/homebrew/bin/brew' ]
  then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# nix auto complete
fpath+=$HOME/.nix-profile/share/zsh/site-functions/

# nix profile
# nix path: ubuntu single user install
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]
  then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# nix path: macos multi user install
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' # this is loaded only once per shell

  # prepend nix profile to path to path
  export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# add personal scripts to path
export PATH=$HOME/.scripts:$PATH

# Clean up PATH
PATH=`echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}'`
