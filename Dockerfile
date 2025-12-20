# hadolint ignore=DL3007
FROM fedora:latest

# set args
ARG USER="byte_crafter"
ARG HOME="/home/${USER}"

# set environment variables
ENV USER_UID=1000
ENV USER_GID=1000
ENV DOCKER_GID=1001

# create an anonymous volume for home if it's not specified
VOLUME [ ${HOME} ]

# fail command if pipe fails
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# System
# install dependencies
# hadolint ignore=DL3041
RUN \
  # enable man pages and reinstall everything to download man pages
  sed -i 's/tsflags=nodocs/# tsflags=nodocs/' /etc/dnf/dnf.conf && \
  dnf install -y man man-pages && \
  dnf reinstall -y \* && \
  # upgrade packages
  dnf upgrade -y && \
  # install development-tools
  dnf group install -y c-development development-tools && \
  # enable rpm fusion
  dnf install -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" && \
  dnf install -y "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm" && \
  # install packages
  dnf install -y ps \
  xclip xsel wl-clipboard \
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
  # install python: pyenv packages
  dnf install -y make gcc patch zlib-devel bzip2 bzip2-devel \
  readline-devel sqlite sqlite-devel openssl-devel tk-devel \
  libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2 && \
  # install docker cli
  dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo && \
  dnf install -y docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
  # clean up
  dnf clean all

# Tools
# install eza
RUN curl -fsSL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz \
  | tar xz && \
  chmod +x eza && \
  chown root:root eza && \
  mv eza /usr/local/bin/eza

# User
# allow wheel group to use sudo without password and create dev user
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel-nopasswd && \
  useradd -ml ${USER} && \
  usermod -aG wheel,docker ${USER} && \
  chsh -s /usr/bin/zsh ${USER}

# use user to configure home folder
USER ${USER}

# Programming
# install python: pyenv, python3, uv
# hadolint ignore=DL3041
RUN curl -fsSL https://pyenv.run | bash && \
  export PYENV_ROOT="${HOME}/.pyenv" && \
  export PATH="$PYENV_ROOT/bin:$PATH" && \
  pyenv install 3 && \
  pyenv global 3 && \
  curl -fsSL https://astral.sh/uv/install.sh | sh

# install nodejs: fnm, node22, ast-grep/cli, copilot
# hadolint ignore=DL3016,DL3004
RUN curl -fsSL https://fnm.vercel.app/install \
  | bash -s -- --install-dir "${HOME}/.fnm" --skip-shell --force-install && \
  export FNM_PATH="${HOME}/.fnm" && \
  export PATH="$FNM_PATH:$PATH" && \
  mkdir -p ~/.oh-my-zsh/completions/ && \
  fnm completions --shell zsh  > ~/.oh-my-zsh/completions/_fnm && \
  fnm install 22 && \
  # TODO: remove this from global install
  # and remove DL3004 from ignore list
  sudo npm install --global @ast-grep/cli && \
  sudo npm install -g @github/copilot

# install go: go1.25.5
RUN mkdir -p "${HOME}"/.local/ && \
  curl -fsSL https://go.dev/dl/go1.25.5.linux-amd64.tar.gz \
  | tar -C "${HOME}"/.local/ -xz && \
  export GO_INSTALL_PATH="${HOME}"/.local/go && \
  export PATH="$GO_INSTALL_PATH/bin:$PATH" && \
  export GOPATH="${HOME}/.go" && \
  export PATH="$GOPATH/bin:$PATH" && \
  rm -rf go1.25.5.linux-amd64.tar.gz

# change working dir and copy files
WORKDIR ${HOME}/.dotfiles
COPY --chown=${USER}:${USER} . .

# clean up, create symlinks, run integrations and setup shell
# hadolint ignore=SC2035
RUN rm -rf ~/.zprofile ~/.zshrc && \
  # build integrations
  ${HOME}/.dotfiles/catppuccin-bat/build.sh && \
  ${HOME}/.dotfiles/catppuccin-delta/build.sh && \
  ${HOME}/.dotfiles/catppuccin-btop/build.sh && \
  ${HOME}/.dotfiles/catppuccin-zsh-syntax-highlighting/build.sh && \
  # symlinks integrations
  stow */ && \
  # install integrations
  ${HOME}/.dotfiles/catppuccin-bat/install.sh && \
  ${HOME}/.dotfiles/catppuccin-delta/install.sh && \
  ${HOME}/.dotfiles/nvim/install.sh && \
  ${HOME}/.dotfiles/tmux/install.sh && \
  ${HOME}/.dotfiles/docker/install.sh

# configure envs, workspace and user
ENV USER=${USER}
ENV HOME=${HOME}
WORKDIR /workspace
ENTRYPOINT [ "zsh", "-c", "\
  sudo groupadd -g ${DOCKER_GID} docker_host >/dev/null 2>&1; \
  sudo usermod -u ${USER_UID} ${USER} >/dev/null 2>&1; \
  sudo usermod -g ${USER_GID} ${USER} >/dev/null 2>&1; \
  sudo usermod -aG wheel,docker,docker_host ${USER} >/dev/null 2>&1; \
  # workaround for changes made to the current user
  # not being reflected in the current shell
  sudo -u ${USER} -i zsh --login -c 'cd /workspace; tmux new -A -s tmux'"]
