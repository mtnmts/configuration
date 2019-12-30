#!/bin/bash
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
PYENV=$PYENV_ROOT/bin/pyenv

$PYENV init -
$PYENV virtualenv-init -

# 3.8-dev (Global)
$PYENV install 3.8-dev
$PYENV global 3.8-dev
$PYENV init -
$PYENV exec pip install --upgrade pip
$PYENV exec pip install -r config/pip.txt
$PYENV exec pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev3
# 2.7-dev

$PYENV install 2.7-dev
$PYENV global 2.7-dev
$PYENV shell 2.7-dev
$PYENV init -
$PYENV exec pip install -r config/pip-27.txt

$PYENV global 3.8-dev
$PYENV init -
$PYENV shell 3.8-dev

pip3 install pynvim

# Shellphish
pip install git+https://github.com/shellphish/shellphish-afl
pip install git+https://github.com/shellphish/fuzzer

