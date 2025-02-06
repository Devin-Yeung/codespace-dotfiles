#!/bin/bash

# fix permission, see: https://github.com/DeterminateSystems/nix-installer/issues/777
# $(id -u) to make sure the current user is the owner of the nix folder
sudo chown -R $(id -u):$(id -u) /nix
# let's use nix
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# cache the pkgs that need to be installed
echo "Caching pkgs ... ($(id -u))"
nix build --no-link .#full
