#!/bin/bash
#######################################
# Linux Coding Development Enviroment #
#######################################

yes | pacman -Syyu jdk-openjdk tmux python3 neovim git

cp ./bash_profile ~/.bash_profile

git clone https://github.com/samoshkin/tmux-config.git && ./tmux-config/install.sh
cp ./tmux.conf ~/.tmux/tmux.conf

curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim
