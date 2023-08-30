# install some useful utils
mkdir -p ~/install

# ripgrep
wget -q https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz -O ~/install/ripgrep.tar.gz
tar -xf ~/install/ripgrep.tar.gz -C ~/.codespace/bin --transform s/ripgrep-.*-x86_64-unknown-linux-musl/ripgrep/
sudo ln -sf ~/.codespace/bin/ripgrep/rg /usr/bin/rg

# exa
wget -q 'https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-musl-v0.10.1.zip' -O ~/install/exa.zip
mkdir -p ~/.codespace/bin/exa
unzip ~/install/exa.zip -f -d ~/.codespace/bin/exa
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