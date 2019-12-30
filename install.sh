#!/bin/bash

bash mkdir -p $LOGS
bash scripts/apt.sh > $LOGS/apt.log 2>&1
bash scripts/copy_config.sh > $LOGS/copy_config.log 2>&1
bash scripts/pyenv.sh > $LOGS/pyenv.log 2>&1
bash scripts/python_setup.sh > $LOGS/python_setup.log 2>&1
bash scripts/rust.sh > $LOGS/rust.log 2>&1
bash scripts/misc.sh > $LOGS/misc.log 2>&1 
