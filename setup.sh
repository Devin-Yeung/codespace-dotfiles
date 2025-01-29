#!/bin/sh

# bootstrap
bash preinstall.sh

# install utils
bash utils.sh

# install the utils that not directly fetch from github release
bash oneline.sh

# man pages
for section in 1 3 5 7 8; do
    mkdir -p ~/.codespace/man/man$section
    fd ".*\.$section" ~/.codespace/bin -x ln -sf {} ~/.codespace/man/man$section/{/.}.$section
done

# clean up
rm -rf ~/install
