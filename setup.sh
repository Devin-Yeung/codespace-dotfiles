# setup tmpdir
mkdir -p ~/install

# all binaries are installed into ~/.codespace/bin
mkdir -p ~/.codespace/bin

# config dir
mkdir -p ~/.config

# setup neovim
wget -q https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz --output-document ~/install/nvim-linux64.tar.gz
tar -xf ~/install/nvim-linux64.tar.gz -C ~/.codespace/bin
sudo ln -s ~/.codespace/bin/nvim-linux64/bin/nvim /usr/bin/nvim

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

# zoxide
wget -q https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.2/zoxide-0.9.2-x86_64-unknown-linux-musl.tar.gz -O ~/install/zoxide.tar.gz
mkdir -p ~/.codespace/bin/zoxide
tar -xf ~/install/zoxide.tar.gz -C ~/.codespace/bin/zoxide
sudo ln -s ~/.codespace/bin/zoxide/zoxide /usr/bin/zoxide

# starship
wget -q https://github.com/starship/starship/releases/download/v1.16.0/starship-x86_64-unknown-linux-musl.tar.gz -O ~/install/starship.tar.gz
tar -xf ~/install/starship.tar.gz -C ~/.codespace/bin
sudo ln -s ~/.codespace/bin/starship /usr/bin/starship

# git config
cp .gitconfig ~/.gitconfig

# man pages
for section in 1 3 5 7 8; do
    mkdir -p ~/.codespace/man/man$section
    fd ".*\.$section" ~/.codespace/bin -x ln -sf {} ~/.codespace/man/man$section/{/.}.$section
done

# clean up
rm -rf ~/install
