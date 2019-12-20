#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/packages.txt) 
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/pyenv-deps.txt)
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/pwntools-deps.txt)

cp -R .config $HOME/.config

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
rm -rf $PYENV_ROOT

# Python
curl https://pyenv.run | bash
pyenv init -
pyenv virtualenv-init -

# 2.7-dev
pyenv install 2.7-dev
pyenv global 3.8-dev
pyenv shell 2.7-dev
pyenv init -
pyenv exec pip install -r config/pip-27.txt

## 3.7-dev
## pyenv install 3.7-dev
## pyenv shell 3.7-dev
## pyenv init -
## pyenv exec pip install -r config/pip-37.txt

# 3.8-dev (Global)
pyenv install 3.8-dev
pyenv global 3.8-dev
pyenv init -
pip install --upgrade pip
pip install -r config/pip.txt
python3 -m pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3


# Neovim, Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
chmod u+x kubectl
sudo mv nvim.appimage /usr/local/bin/nvim
sudo mv kubectl /usr/local/bin/kubectl
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install --all

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
chmod +x ./rustup.sh
./rustup.sh  --default-toolchain nightly --profile complete -y
rm rustup.sh

# Switch to fish
sudo chsh -s /usr/bin/fish $(whoami)
