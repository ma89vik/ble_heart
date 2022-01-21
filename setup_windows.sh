#!/bin/bash

export TOOLCHAIN_PATH="/c/Program Files (x86)/GNU Arm Embedded Toolchain/9 2020-q2-update"
export NRF_SDK_PATH="/c/Users/Marius/Documents/Project/ble_heart/external/nrf_sdk"
export NRFJPROG_PATH="/c/Program Files (x86)/Nordic Semiconductor/nrf-command-line-tools/bin/nrfjprog.exe"

# Python setup (in a virtual env)
python3 -m venv .ble_heart_venv
source .ble_heart_venv/bin/activate
pip3 install -r requirements.txt