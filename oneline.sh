#!/bin/bash

# >>>>> nvchad >>>>>
git clone https://github.com/NvChad/NvChad.git --depth=1 ~/.config/nvim
ln -sf $(pwd)/nvchad/custom ~/.config/nvim/lua/
# <<<<< nvchad <<<<<


# >>>>> tmux >>>>>
sudo apt install tmux -y
# tmux config
cp .tmux.conf ~/.tmux.conf
# <<<<< tmux <<<<<


# >>>>> git >>>>>
# git config
cp .gitconfig ~/.gitconfig
# <<<<< git <<<<<


# >>>>> rye >>>>>
curl -sSf https://rye-up.com/get | bash
# <<<<< rye <<<<<


# >>>>> zsh >>>>>
# use zsh as default
# see https://docs.github.com/en/codespaces/customizing-your-codespace/changing-the-shell-in-a-codespace#setting-the-default-shell-over-ssh
sudo chsh "$(id -un)" --shell /usr/bin/zsh
# zsh config
cp .zshrc ~/.zshrc
# antigen
mkdir -p ~/.zsh/antigen
curl -L git.io/antigen > ~/.zsh/antigen/antigen.zsh
# <<<<< zsh <<<<<

