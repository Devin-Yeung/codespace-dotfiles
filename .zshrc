#!/bin/zsh

# make sure nix-daemon is alive
if ! pgrep -x nix-daemon >/dev/null; then
    sudo -n sh -c '. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh; nohup /nix/var/nix/profiles/default/bin/nix-daemon > /tmp/nix-daemon.log 2>&1 &';
fi
