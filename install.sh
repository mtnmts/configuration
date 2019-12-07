#!/bin/bash
sudo apt update
sudo apt install -y $(cat config/packages.txt)
curl https://pyenv.run | bash
pyenv install 3.8.0
pyenv global 3.8.0
pip install $(cat config/pip.txt)
sudo apt install nvim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa
