# bootstrap
sh bootstrap.sh

# install utils
sh utils.sh

# setup nvchad
git clone https://github.com/NvChad/NvChad.git --depth=1 ~/.config/nvim

# zsh setup

# use zsh as default
sudo chsh -s /usr/bin/zsh

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
