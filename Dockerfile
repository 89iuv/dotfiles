# hadolint ignore=DL3007
FROM fedora:latest

# set args
ARG USER="dev"
ARG HOME="/home/${USER}"

# set environment variables
ENV USER_UID=1000
ENV USER_GID=1000
ENV DOCKER_GID=1001

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
  dnf install -y ps && \
  dnf clean all

# User
# allow wheel group to use sudo without password and create dev user
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel-nopasswd && \
  useradd -ml ${USER} && \
  usermod -aG wheel ${USER}

# use user to configure home folder
USER ${USER}

# change working dir, copy files and run install script
WORKDIR ${HOME}/.dotfiles
COPY --chown=${USER}:${USER} . .
RUN ./install.sh

# configure envs, workspace and user
ENV USER=${USER}
ENV HOME=${HOME}
WORKDIR /workspace
ENTRYPOINT [ "zsh", "-c", "\
  # start ollama server
  nohup ollama serve > ${HOME}/.ollama.log 2>&1; \
  # add docker gid provided from host
  sudo groupadd -g ${DOCKER_GID} docker_host >/dev/null 2>&1; \
  # change user uid to match the one provided from host
  sudo usermod -u ${USER_UID} ${USER} >/dev/null 2>&1; \
  # change user gid to match the one provided from host
  sudo usermod -g ${USER_GID} ${USER} >/dev/null 2>&1; \
  # add user to groups with sudo and docker permissions
  sudo usermod -aG wheel,docker,docker_host ${USER} >/dev/null 2>&1; \
  # workaround for changes made to the current user
  # not being reflected in the current shell
  sudo -u ${USER} -i zsh --login -c 'cd /workspace; zsh --login'"]
