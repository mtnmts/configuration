#!/bin/bash
# Neovim, Kubectl

NVIM=/usr/local/bin/nvim
which nvim
if [ $? -ne 0 ]; then
	curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod u+x nvim.appimage
	sudo mv nvim.appimage $NVIM
fi

which kubectl 
if [ $? -ne 0 ]; then
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	chmod u+x kubectl
	sudo mv kubectl /usr/local/bin/kubectl
fi

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
$NVIM +'PlugInstall --sync' +qa
$NVIM +'UpdateRemotePlugins' +qa

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
ls ~/.gdbinit
if [ $? -ne 0 ]; then
	wget -P ~ https://git.io/.gdbinit
fi


# Switch to fish
sudo chsh -s /usr/bin/fish $(whoami)
