#!/bin/bash
#######################################
# Linux Coding Development Enviroment #
#######################################

CURRENT_DIR=$(pwd)

yes | pacman -Syyu jdk-openjdk \
  tmux \
  python3 \
  neovim \
  git \
  unzip \
  zip \
  tar \
  python-pip \
  ripgrep


cp ./bash_profile ~/.bash_profile
cp ./bashrc ~/.bashrc

git clone https://github.com/samoshkin/tmux-config.git && ./tmux-config/install.sh
cp ./tmux.conf ~/.tmux/tmux.conf
rm -rf ./tmux-config

git clone https://github.com/spring-guides/gs-spring-boot.git ~/

pip install neovim --upgrade
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
nvim +PackerSync
