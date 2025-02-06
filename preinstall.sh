#!/bin/bash

mkdir $HOME/.codespace
# link config
ln -s /workspaces/.codespaces/.persistedshare/dotfiles $HOME/.codespace/config

# setup tmpdir
mkdir -p ~/install

# all binaries are installed into ~/.codespace/bin
mkdir -p $HOME/.codespace/bin

# config dir
mkdir -p ~/.config

# apt update
sudo apt upgrade -y
sudo apt update -y
sudo apt install -y gpg

# preinstall jq
sudo wget https://github.com/jqlang/jq/releases/download/jq-1.6/jq-linux64 -O /usr/bin/jq
