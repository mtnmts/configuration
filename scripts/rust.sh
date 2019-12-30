#!/bin/bash

# Rust
which cargo
if [ $? -ne 0 ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup.sh
	chmod +x ./rustup.sh
	./rustup.sh  --default-toolchain nightly --profile complete -y
	rm rustup.sh
fi
