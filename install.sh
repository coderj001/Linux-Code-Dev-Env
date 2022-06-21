#!/bin/bash
#######################################
# Linux Coding Development Enviroment #
#######################################

CURRENT_DIR=$(pwd)
JAVA_CONFIG='/root/.java_config'

yes | pacman -Syyu jdk-openjdk \
  tmux \
  python3 \
  neovim \
  git \
  unzip \
  zip \
  tar \
  python-pip


cp ./bash_profile ~/.bash_profile

git clone https://github.com/samoshkin/tmux-config.git && ./tmux-config/install.sh
cp ./tmux.conf ~/.tmux/tmux.conf
rm -rf ./tmux-config

pip install neovim --upgrade
curl -sLf https://spacevim.org/install.sh | bash -s -- --install neovim

mkdir -p $JAVA_CONFIG
cd $JAVA_CONFIG && curl -LO https://github.com/google/google-java-format/releases/download/v1.15.0/google-java-format-1.15.0.jar && curl -LO https://download.eclipse.org/jdtls/milestones/1.9.0/jdt-language-server-1.9.0-202203031534.tar.gz
tar -xf jdt-language-server-1.9.0-202203031534.tar.gz && rm jdt-language-server-1.9.0-202203031534.tar.gz
cd $CURRENT_DIR

echo """

# Java

[[layers]]
  name = "lang#java"
  java_formatter_jar = "/root/.java_config/google-java-format-1.15.0.jar"

[[layers]]
  name = "lsp"
  filetypes = [
    "java"
  ]
  [layers.override_cmd]
    java = [
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=NONE",
    "-noverify",
    "-Xmx1G",
    "-jar",
    "/root/.java_config/plugins/org.eclipse.equinox.launcher_1.5.200.v20180922-1751.jar",
    "-configuration",
    "/root/.java_config/config_linux",
    "-data",
    "/root/.cache/javalsp"
    ]
""" >> /root/.SpaceVim.d/init.toml
