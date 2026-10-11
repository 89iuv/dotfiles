# use the latest fedora image
# hadolint ignore=DL3007
FROM fedora:latest

# set args
ARG USER="dev"

# set environment variables
# use user id from env or 1000 as default
ENV USER_UID=1000
# use group id from env or 1000 as default
ENV USER_GID=1000

# use the latest version when installing packages
# hadolint ignore=DL3041
RUN dnf upgrade -y \
    && dnf install -y git curl node python pip uv java-latest-openjdk-devel maven \
    && dnf clean all

# User
# allow wheel group to use sudo without password and create dev user
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel-nopasswd && \
  useradd -ml ${USER} && \
  usermod -aG wheel ${USER}

USER ${USER}

# use multiple runs to take advantage of docker layer caching
# hadolint ignore=DL4006
RUN curl -fsSL https://opencode.ai/v2/install | bash

# fix for permission issues when mounting volumes under ~/.local
RUN mkdir -p ~/.local

WORKDIR /workspace

ENTRYPOINT [ "bash", "-c", "\
  # change the user and group IDs of the dev user to match the provided environment variables
  sudo usermod -u ${USER_UID} ${USER} >/dev/null 2>&1; \
  sudo usermod -g ${USER_GID} ${USER} >/dev/null 2>&1; \
  ~/.opencode/bin/opencode"]
