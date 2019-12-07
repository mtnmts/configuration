#!/bin/bash

sudo apt update
sudo apt install -y $(cat config/packages.txt) 
sudo apt install -y $(cat config/pyenv-deps.txt)
sudo apt install -y $(cat config/pwntools-deps.txt)

curl https://pyenv.run | bash
export PATH="/root/.pyenv/bin:$PATH"
pyenv init -
pyenv virtualenv-init -
pyenv install 3.8-dev
pyenv global 3.8-dev
pip install --upgrade pip
pip install -r config/pip.txt

sudo apt install nvim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa

chsh -s /usr/bin/fish $(whoami)
rmdir bin
