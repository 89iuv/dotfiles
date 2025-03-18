# add nix installed packages to auto complete
fpath+=$HOME/.nix-profile/share/zsh/site-functions/

# nix profile
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]
  then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

