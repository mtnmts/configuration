#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt upgrade -y
sudo apt install apt-utils

# QEMU
# sudo apt-get build-dep qemu
