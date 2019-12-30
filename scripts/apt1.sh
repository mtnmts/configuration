#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/pyenv-deps.txt)
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/pwntools-deps.txt)

# QEMU
sudo apt-get build-dep qemu
