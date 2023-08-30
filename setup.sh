# setup tmpdir
mkdir -p ~/install

# all binaries are installed into ~/.codespace/bin
mkdir -p ~/.codespace/bin

# setup neovim
wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz --output-document ~/install/nvim-linux64.tar.gz
tar -xvf ~/install/nvim-linux64.tar.gz -C ~/.codespace/bin
sudo ln -s ~/.codespace/bin/nvim-linux64/bin/nvim /usr/bin/nvim

# clean up
rm -rf ~/install
