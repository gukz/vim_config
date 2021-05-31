#!/bin/bash
sudo apt-get install gettext
git clone --depth=1 git@github.com:neovim/neovim.git ~/neovim
cd ~/neovim
git pull
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
