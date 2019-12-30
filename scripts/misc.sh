#!/bin/bash
# Neovim, Kubectl

which nvim
if [ $? -ne 0 ]; then
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
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


# setup gdb
wget -P ~ https://git.io/.gdbinit


# Switch to fish
sudo chsh -s /usr/bin/fish $(whoami)
