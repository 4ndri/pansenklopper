# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.231.6/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="bullseye"

ARG OHMYPOSH=""

FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT} as base
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends curl ca-certificates gnupg apt-transport-https

# powershell
FROM base as basepwsh

USER vscode
# install powershell
RUN curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - \
    && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list' \
    && sudo apt update && sudo apt install -y powershell

# oh-my-posh
FROM basepwsh as basepwshohmyposh
USER vscode

RUN sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh \
    && sudo chmod +x /usr/local/bin/oh-my-posh

RUN mkdir ~/.poshthemes \
    && wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip \
    && unzip ~/.poshthemes/themes.zip -d ~/.poshthemes \
    && chmod u+rw ~/.poshthemes/*.json \
    && rm ~/.poshthemes/themes.zip
ADD setup /tmp/setup
RUN bash /tmp/setup/oh-my-posh.sh

RUN pwsh -File "/tmp/setup/Install-Terminal.ps1"

# FINAL
FROM basepwsh${OHMYPOSH} as pwshfinal
RUN sudo rm -rf /tmp/setup
USER vscode