#!/bin/bash

# https://github.com/DeterminateSystems/nix-installer/issues/777
# https://github.com/DeterminateSystems/nix-installer/issues/913
sudo sh -c 'apt update -qq && apt install -y -qq acl && setfacl -k /tmp'

# Notice the '&' to background the process and 'nohup' to prevent the process from being killed when the shell exits
sudo -n sh -c '. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; nohup /nix/var/nix/profiles/default/bin/nix-daemon > /tmp/nix-daemon.log 2>&1 &'

# let's use nix
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# cache the pkgs that need to be installed
echo "Caching pkgs ... ($(id -u))"
nix build --no-link .#full
