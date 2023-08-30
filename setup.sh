#!/bin/sh

# normalize hostname
echo "codespace" | sudo tee /etc/hostname

# link config
mkdir -p $HOME/.codespace
ln -s /workspaces/.codespaces/.persistedshare/dotfiles $HOME/.codespace/config

# apt update
sudo apt upgrade -y
sudo apt update -y

# preinstall nix
curl -fsSL https://install.determinate.systems/nix | sh -s -- install linux --determinate --no-confirm --init none

# deal with nix in the background
bash nix.sh
