# install some useful utils
mkdir -p ~/install

# ripgrep
wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep-13.0.0-x86_64-unknown-linux-musl.tar.gz -O ~/install/ripgrep.tar.gz
tar -xvf ~/install/ripgrep.tar.gz -C ~/.codespace/bin --transform s/ripgrep-.*-x86_64-unknown-linux-musl/ripgrep/
sudo ln -s ~/.codespace/bin/ripgrep/rg /usr/bin/rg

# exa
wget 'https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-musl-v0.10.1.zip' -O ~/install/exa.zip
mkdir -p ~/.codespace/bin/exa
unzip ~/install/exa.zip -d ~/.codespace/bin/exa
sudo ln -s ~/.codespace/bin/exa/bin/exa /usr/bin/exa