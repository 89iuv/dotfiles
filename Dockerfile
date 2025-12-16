# hadolint ignore=DL3007
FROM fedora:latest

# fail command if pipe fails
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# change working dir and copy files
WORKDIR /root/.dotfiles
COPY . .

# install dependencies
# hadolint ignore=DL3041
RUN dnf upgrade -y && \
  # install development-tools
  dnf group install -y c-development development-tools && \
  # enable rpm fusion
  dnf install -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" && \
  dnf install -y "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" && \
  # install packages
  dnf install -y ps \
  git-delta zsh zoxide bat \
  fzf ripgrep fd jq stow \
  curl wget lynx \
  chafa ImageMagick \
  lua luarocks compat-lua \
  tmux neovim btop \
  stress hyperfine \
  fastfetch && \
  # install lazygit
  dnf copr enable -y atim/lazygit && \
  dnf install -y lazygit && \
  # clean up
  dnf clean all

# install eza
RUN curl -sL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz | tar xz && \
  chmod +x eza && \
  chown root:root eza && \
  mv eza /usr/local/bin/eza

# create symlinks, run integrations and setup shell
# hadolint ignore=SC2035
RUN stow */ && \
  ~/.dotfiles/catppuccin-bat/install.sh && \
  ~/.dotfiles/catppuccin-delta/install.sh && \
  ~/.dotfiles/catppuccin-btop/install.sh && \
  ~/.dotfiles/nvim/install.sh && \
  ~/.dotfiles/tmux/install.sh && \
  chsh -s /usr/bin/zsh

# install python
# hadolint ignore=DL3041
RUN dnf install -y make gcc patch zlib-devel bzip2 bzip2-devel \
  readline-devel sqlite sqlite-devel openssl-devel tk-devel \
  libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2 && \
  curl -fsSL https://pyenv.run | bash && \
  export PYENV_ROOT="$HOME/.pyenv" && \
  export PATH="$PYENV_ROOT/bin:$PATH" && \
  pyenv install 3 && \
  pyenv global 3 && \
  curl -LsSf https://astral.sh/uv/install.sh | sh && \
  dnf clean all

# install nodejs
# hadolint ignore=DL3016
RUN curl -fsSL "https://fnm.vercel.app/install" | bash -s -- --install-dir "$HOME/.fnm" --skip-shell --force-install && \
  export FNM_PATH="$HOME/.fnm" && \
  export PATH="$FNM_PATH:$PATH" && \
  mkdir ~/.oh-my-zsh/completions/ && \
  fnm completions --shell zsh  > ~/.oh-my-zsh/completions/_fnm && \
  fnm install 22 && \
  npm install --global @ast-grep/cli && \
  npm install -g @github/copilot && \
  dnf clean all

# install go
RUN curl -sLO https://go.dev/dl/go1.25.5.linux-amd64.tar.gz && \
  rm -rf /usr/local/go && \
  tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz && \
  export GO_INSTALL_PATH=/usr/local/go && \
  export PATH="$GO_INSTALL_PATH/bin:$PATH" && \
  export GOPATH="$HOME/.go" && \
  export PATH="$GOPATH/bin:$PATH" && \
  rm -rf go1.25.5.linux-amd64.tar.gz

WORKDIR /mnt/host
ENTRYPOINT [ "zsh", "--login" ]
