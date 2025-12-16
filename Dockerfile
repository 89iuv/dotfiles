# hadolint ignore=DL3007
FROM fedora:latest

VOLUME ["root"]

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# install development-tools
# hadolint ignore=DL3041
RUN dnf upgrade -y && \
  dnf group install -y c-development development-tools && \
  dnf clean all

# enable rpm fusion
RUN dnf install -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" && \
  dnf install -y "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" && \
  dnf clean all

# install packages
# hadolint ignore=DL3041
RUN dnf install -y ps \
  git-delta zsh zoxide bat \
  fzf ripgrep fd jq stow \
  curl wget lynx \
  chafa ImageMagick \
  lua luarocks compat-lua \
  tmux neovim btop \
  stress hyperfine \
  fastfetch && \
  dnf clean all

# install eza
RUN curl -sL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz | tar xz && \
  chmod +x eza && \
  chown root:root eza && \
  mv eza /usr/local/bin/eza

# install lazygit
# hadolint ignore=DL3041
RUN dnf copr enable -y atim/lazygit && \
  dnf install -y lazygit && \
  dnf clean all

# copy dotfiles
WORKDIR /root/.dotfiles
COPY . .

# hadolint ignore=SC2287
# hadolint ignore=SC2035
RUN stow */

WORKDIR /root/.dotfiles/catppuccin-bat
RUN ./install.sh

WORKDIR /root/.dotfiles/catppuccin-delta
RUN ./install.sh

WORKDIR /root/.dotfiles/catppuccin-btop
RUN ./install.sh

WORKDIR /root/.dotfiles/nvim
RUN ./install.sh

WORKDIR /root/.dotfiles/tmux
RUN ./install.sh

# setup shell and clean up
RUN chsh -s /usr/bin/zsh && \
  dnf clean all

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
  export PATH="$HOME/.fnm:$PATH" && \
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
