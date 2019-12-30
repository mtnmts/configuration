#!/bin/bash

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

# Shellphish
pip install git+https://github.com/shellphish/shellphish-afl
pip install git+https://github.com/shellphish/fuzzer

