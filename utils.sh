#!/bin/sh
# install some useful utils
mkdir -p ~/install

# neovim
wget -q https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz -O ~/install/nvim-linux64.tar.gz
tar -xf ~/install/nvim-linux64.tar.gz -C ~/.codespace/bin
sudo ln -s ~/.codespace/bin/nvim-linux64/bin/nvim /usr/bin/nvim

# ripgrep
wget -q https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz -O ~/install/ripgrep.tar.gz
tar -xf ~/install/ripgrep.tar.gz -C ~/.codespace/bin --transform s/ripgrep-.*-x86_64-unknown-linux-musl/ripgrep/
sudo ln -sf ~/.codespace/bin/ripgrep/rg /usr/bin/rg

# exa
wget -q 'https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-musl-v0.10.1.zip' -O ~/install/exa.zip
mkdir -p ~/.codespace/bin/exa
unzip -o -q ~/install/exa.zip -d ~/.codespace/bin/exa
sudo ln -sf ~/.codespace/bin/exa/bin/exa /usr/bin/exa

# fd
wget -q 'https://github.com/sharkdp/fd/releases/download/v8.7.0/fd-v8.7.0-x86_64-unknown-linux-musl.tar.gz' -O ~/install/fd.tar.gz
tar -xf ~/install/fd.tar.gz -C ~/.codespace/bin --transform s/fd-.*-unknown-linux-musl/fd/
sudo ln -sf ~/.codespace/bin/fd/fd /usr/bin/fd

# difft
wget -q 'https://github.com/Wilfred/difftastic/releases/download/0.50.0/difft-x86_64-unknown-linux-gnu.tar.gz' -O ~/install/difft.tar.gz
mkdir -p ~/.codespace/bin/difft
tar -xf ~/install/difft.tar.gz -C ~/.codespace/bin/difft
sudo ln -sf ~/.codespace/bin/difft/difft /usr/bin/difft

# zoxide
wget -q https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.2/zoxide-0.9.2-x86_64-unknown-linux-musl.tar.gz -O ~/install/zoxide.tar.gz
mkdir -p ~/.codespace/bin/zoxide
tar -xf ~/install/zoxide.tar.gz -C ~/.codespace/bin/zoxide
sudo ln -s ~/.codespace/bin/zoxide/zoxide /usr/bin/zoxide

# starship
wget -q https://github.com/starship/starship/releases/download/v1.16.0/starship-x86_64-unknown-linux-musl.tar.gz -O ~/install/starship.tar.gz
mkdir -p ~/.codespace/bin/starship
tar -xf ~/install/starship.tar.gz -C ~/.codespace/bin/starship
sudo ln -s ~/.codespace/bin/starship/starship /usr/bin/starship