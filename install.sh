#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y $(cat config/packages.txt) 
sudo apt install -y $(cat config/pyenv-deps.txt)
sudo apt install -y $(cat config/pwntools-deps.txt)


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
rm -rf $PYENV_ROOT

curl https://pyenv.run | bash
pyenv init -
pyenv virtualenv-init -
pyenv install 3.8-dev
pyenv global 3.8-dev

pip install --upgrade pip
pip install -r config/pip.txt
python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3


curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install --all

chsh -s /usr/bin/fish $(whoami)
