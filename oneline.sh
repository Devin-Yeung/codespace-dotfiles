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
