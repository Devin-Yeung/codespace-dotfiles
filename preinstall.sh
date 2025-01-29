#!/bin/bash

# install nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install linux --no-confirm --init none
# fix permission, see: https://github.com/DeterminateSystems/nix-installer/issues/777
sudo chown -R $(id -u):$(id -u) /nix
# let's use nix
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# cache the pkgs that need to be installed
echo "Caching pkgs ... ($(id -u))"
nix build --no-link .#full

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

# preinstall jq
sudo wget https://github.com/jqlang/jq/releases/download/jq-1.6/jq-linux64 -O /usr/bin/jq
