#!/bin/sh
# bootstrap
sh preinstall.sh

# install utils
bash utils.sh

# install the utils that not directly fetch from github release
bash oneline.sh


# zsh setup

# use zsh as default
# see https://docs.github.com/en/codespaces/customizing-your-codespace/changing-the-shell-in-a-codespace#setting-the-default-shell-over-ssh
sudo chsh "$(id -un)" --shell /usr/bin/zsh

# config file
cp .zshrc ~/.zshrc

# antigen
mkdir -p ~/.zsh/antigen
curl -L git.io/antigen > ~/.zsh/antigen/antigen.zsh

# git config
cp .gitconfig ~/.gitconfig

# man pages
for section in 1 3 5 7 8; do
    mkdir -p ~/.codespace/man/man$section
    fd ".*\.$section" ~/.codespace/bin -x ln -sf {} ~/.codespace/man/man$section/{/.}.$section
done

# clean up
rm -rf ~/install
