#!/bin/bash


bash mkdir -p ${LOGS}
bash scripts/apt.sh &> ${LOGS}/apt.log
bash scripts/copy_config.sh &> ${logs}/copy_config.log
bash scripts/pyenv.sh &> ${logs}/pyenv.log
bash scripts/python_setup.sh &> ${logs}/python_setup.log
bash scripts/rust.sh &> ${logs}/rust.log
bash scripts/misc.sh &> ${logs}/misc.log
