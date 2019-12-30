#!/bin/bash

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

$PYENV_ROOT/bin/pyenv --version
if [ $? -ne 0 ]; then
	rm -rf $PYENV_ROOT
	curl https://pyenv.run | bash
fi
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
