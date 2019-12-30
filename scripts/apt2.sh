#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
sudo DEBIAN_FRONTEND=noninteractive apt install -y $(cat config/apt/build_tools.txt) 
