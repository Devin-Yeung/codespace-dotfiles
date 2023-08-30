# setup tmpdir
mkdir -p ~/install

# all binaries are installed into ~/.codespace/bin
mkdir -p ~/.codespace/bin

# config dir
mkdir -p ~/.config

# setup neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz --output-document ~/install/nvim-linux64.tar.gz
tar -xvf ~/install/nvim-linux64.tar.gz -C ~/.codespace/bin
sudo ln -s ~/.codespace/bin/nvim-linux64/bin/nvim /usr/bin/nvim

# setup nvchad
git clone https://github.com/NvChad/NvChad.git --depth=1 ~/.config/nvim

# clean up
rm -rf ~/install
