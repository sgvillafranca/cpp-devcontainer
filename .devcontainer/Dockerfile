# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.166.1/containers/cpp/.devcontainer/base.Dockerfile

# [Choice] Debian / Ubuntu version: debian-10, debian-9, ubuntu-20.04, ubuntu-18.04
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/cpp:0-${VARIANT}

# Reference package installation scripts
WORKDIR /home/vscode
COPY scripts scripts

# Reference custom zsh command prompt
COPY conf/.zshrc /home/vscode
COPY conf/custom.zsh-theme /home/vscode/.oh-my-zsh/custom/themes

# Install Dependencies
RUN sh scripts/install-cookiecutter.sh
RUN sh scripts/install-catch2.sh
RUN sudo sh scripts/install-gcc10.sh

# Avoid warnings by switching to noninteractive
RUN export DEBIAN_FRONTEND=noninteractive && sudo apt-get update -qq && sudo apt-get upgrade -y -qq \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
  && git clone https://github.com/zsh-users/zsh-autosuggestions /home/vscode/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.zsh_history" \
  && mkdir /commandhistory \
  && touch /commandhistory/.zsh_history \
  && sudo chown -R vscode /commandhistory \
  && echo $SNIPPET >> "/home/vscode/.zshrc"
# Set the default shell to zsh rather than bash
ENV SHELL /bin/zsh

# Set Timezone 
RUN sudo rm -rf /etc/localtime 
RUN sudo ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime


