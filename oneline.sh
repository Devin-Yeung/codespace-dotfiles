#!/bin/bash

# >>>>> git >>>>>
# git config
cp .gitconfig ~/.gitconfig
# <<<<< git <<<<<


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


# >>>>> nvchad >>>>>
git clone https://github.com/NvChad/NvChad.git --branch=v2.0 --depth=1 ~/.config/nvim
ln -sf $(pwd)/nvchad/custom ~/.config/nvim/lua/
# <<<<< nvchad <<<<<


# >>>>> tmux >>>>>
sudo apt install tmux -y
# tmux config
cp .tmux.conf ~/.tmux.conf
# <<<<< tmux <<<<<


# >>>>> eza >>>>>
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
# <<<<< eza <<<<<


# >>>>> rye >>>>>
curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
# <<<<< rye <<<<<

# >>>>> justfile >>>>>
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | sudo bash -s -- --to /usr/bin
# <<<<< justfile <<<<<

