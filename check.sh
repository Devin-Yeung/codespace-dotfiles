#!/bin/bash

commands=(
    'nvim --version'
    'rg --version'
    'exa --version'
    'fd --version'
    'difft --version'
    'zoxide --version'
    'starship --version'
    'lazygit --version'
    'tmux -V'
)

ret=0
# Iterate through the predefined commands
for cmd in "${commands[@]}"; do
    if ! $cmd &> /dev/null ; then
        echo "$cmd Failed"
        ret=1
    fi
done

exit $ret