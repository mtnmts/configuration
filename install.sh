#!/bin/bash
USER=$(whoami)
export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/packages.txt) 
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/pyenv-deps.txt)
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/pwntools-deps.txt)

cp -R .config $HOME/
cp .tmux.conf $HOME/
chown $USER -R $HOME/.config
chown $USER -R $HOME/.tmux.conf

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
rm -rf $PYENV_ROOT

# QEMU
sudo apt-get build-dep qemu

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
$PYENV_ROOT/bin/pyenv --version
if [ $? -ne 0 ]; then
	curl https://pyenv.run | bash
fi
pyenv init -
pyenv virtualenv-init -

# 3.8-dev (Global)
pyenv install 3.8-dev
pyenv global 3.8-dev
pyenv init -
pyenv exec pip install --upgrade pip
pyenv exec pip install -r config/pip.txt
pyenv exec pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3
# 2.7-dev

pyenv install 2.7-dev
pyenv global 2.7-dev
pyenv shell 2.7-dev
pyenv init -
pyenv exec pip install -r config/pip-27.txt

pyenv global 3.8-dev
pyenv init -
pyenv shell 3.8-dev
pip3 install pynvim
## 3.7-dev
## pyenv install 3.7-dev
## pyenv shell 3.7-dev
## pyenv init -
## pyenv exec pip install -r config/pip-37.txt



# Neovim, Kubectl
which nvim
if [ $? -ne 0 ]; then
	curl https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
	tar xzf nvim-linux64.tar.gz
	sudo mv nvim-linux64/bin/nvim /usr/local/bin/nvim
	chmod u+x /usr/local/bin/nvim
	rm -rf nvim-linux64.tar.gz nvim-linux64/
fi

which kubectl 
if [ $? -ne 0 ]; then
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod u+x kubectl
	sudo mv kubectl /usr/local/bin/kubectl
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa
nvim +'UpdateRemotePlugins' +qa

# FZF
which fzf 
if [ $? -ne 0 ]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	yes | ~/.fzf/install --all
fi

#AFL
which afl-fuzz
if [ $? -ne 0 ]; then
	wget https://github.com/google/AFL/archive/v2.56b.zip 
	unzip v2.56b.zip
	cd AFL-2.56b && sudo make install && cd ..
	rm -rf AFL-2.56b
	rm v2.56b.zip
fi

# Shellphish
pip install git+https://github.com/shellphish/shellphish-afl
pip install git+https://github.com/shellphish/fuzzer

# setup gdb
wget -P ~ https://git.io/.gdbinit

# Rust
which cargo
if [ $? -ne 0 ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
	chmod +x ./rustup.sh
	./rustup.sh  --default-toolchain nightly --profile complete -y
	rm rustup.sh
fi

# Switch to fish
sudo chsh -s /usr/bin/fish $(whoami)
