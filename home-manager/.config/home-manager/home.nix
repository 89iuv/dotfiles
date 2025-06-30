{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    pkgs.coreutils
    pkgs.less
    pkgs.xsel
    pkgs.dust
    pkgs.jq
    pkgs.stow
    pkgs.git

    pkgs.tree
    pkgs.zoxide
    pkgs.eza
    pkgs.bat
    pkgs.fzf
    pkgs.zsh

    pkgs.tmux
    pkgs.btop
    pkgs.yazi

    pkgs.exiftool
    pkgs.superfile

    pkgs.delta
    pkgs.lazygit

    pkgs.wordnet
    pkgs.scowl
    pkgs.curl
    pkgs.wget
    pkgs.ripgrep
    pkgs.fd
    pkgs.unzip
    pkgs.tree-sitter
    pkgs.tectonic
    pkgs.texliveBasic
    pkgs.imagemagickBig
    pkgs.ghostscript
    pkgs.mermaid-cli
    pkgs.fish # used in neovim conform plugin
    pkgs.nixfmt-classic
    (pkgs.lua5_1.withPackages (lua_pkgs: [
      lua_pkgs.luarocks
      lua_pkgs.tiktoken_core # used in nvim copilot chat
    ]))
    (pkgs.python3.withPackages (python_pkgs: [
      python_pkgs.pip
      python_pkgs.pylatexenc
    ]))
    pkgs.uv
    pkgs.jdk
    pkgs.maven
    pkgs.nodejs
    pkgs.cargo
    pkgs.neovim

    pkgs.chafa
    pkgs.fastfetch
    pkgs.cmatrix
    pkgs.stress

    pkgs.gh
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/valiuv/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
